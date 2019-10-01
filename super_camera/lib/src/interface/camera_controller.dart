// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:super_camera/src/android/camera/android_camera_configurator.dart';

import '../android/camera/camera.dart';
import 'camera_interface.dart';

/// Controls a device camera.
///
/// Use [CameraController.availableCameras] to get a list of available cameras.
///
/// This class is used as a simple interface to control a camera on Android or
/// iOS.
///
/// Only one instance of [CameraController] can be active at a time. If you call
/// [initialize] on a [CameraController] while another is active, the old
/// controller will be disposed before initializing the new controller.
///
/// Example using [CameraController]:
///
/// ```dart
/// final List<CameraDescription> cameras = async CameraController.availableCameras();
/// final CameraController controller = CameraController(description: cameras[0]);
/// controller.initialize();
/// controller.start();
/// ```
class CameraController {
  CameraController._({@required this.configurator})
      : assert(configurator != null);

  /// Default constructor.
  ///
  /// Use [CameraController.availableCameras] to get a list of available
  /// cameras.
  ///
  /// This will choose the best [CameraConfigurator] for the current device.
  factory CameraController({@required CameraDescription description}) {
    return CameraController._(
      configurator: _createDefaultConfigurator(description),
    );
  }

  /// Constructor for defining your own [CameraConfigurator].
  factory CameraController.customConfigurator(CameraConfigurator configurator) {
    return CameraController._(configurator: configurator);
  }

  static const String _isNotInitializedMessage = 'Initialize was not called.';
  static const String _isDisposedMessage = 'This controller has been disposed.';

  // Keep only one active instance of CameraController.
  static CameraController _instance;

  /// Configurator used to control the camera.
  final CameraConfigurator configurator;

  bool _isDisposed = false;
  bool get isDisposed => _isDisposed;

  /// Retrieves a list of available cameras for the current device.
  ///
  /// This will choose the appropriate Camera API for the current device.
  static Future<List<CameraDescription>> availableCameras() async {
    final List<CameraDescription> descriptions = <CameraDescription>[];

    if (Platform.isAndroid) {
      final int cameraCount = await Camera.getNumberOfCameras();
      for (int i = 0; i < cameraCount; i++) {
        final CameraInfo info = CameraInfo();
        await Camera.getCameraInfo(i, info);
        descriptions.add(info);
      }
    } else {
      throw UnsupportedError('${Platform.operatingSystem} is not supported.');
    }

    return descriptions;
  }

  /// Initializes the camera on the device.
  ///
  /// You must call [dispose] when you are done using the camera, otherwise it
  /// will remain locked and be unavailable to other applications.
  ///
  /// Only one instance of [CameraController] can be active at a time. If you
  /// call [initialize] on a [CameraController] while another is active, the old
  /// controller will be disposed before initializing the new controller.
  Future<void> initialize() {
    if (_instance == this) {
      return Future<void>.value();
    }

    final Completer<void> completer = Completer<void>();

    if (_instance != null) {
      _instance
          .dispose()
          .then((_) => configurator.initialize())
          .then((_) => completer.complete());
    }
    _instance = this;

    return completer.future;
  }

  /// Begins the flow of data between the inputs and outputs connected to the camera instance.
  Future<void> start() {
    assert(!_isDisposed, _isDisposedMessage);
    assert(_instance != this, _isNotInitializedMessage);

    return configurator.start();
  }

  /// Stops the flow of data between the inputs and outputs connected to the camera instance.
  Future<void> stop() {
    assert(!_isDisposed, _isDisposedMessage);
    assert(_instance != this, _isNotInitializedMessage);

    return configurator.stop();
  }

  /// Deallocate all resources and disables further use of the controller.
  Future<void> dispose() {
    _instance = null;
    _isDisposed = true;
    return configurator.dispose();
  }

  static CameraConfigurator _createDefaultConfigurator(
    CameraDescription description,
  ) {
    if (Platform.isAndroid && description is CameraInfo) {
      return AndroidCameraConfigurator(description);
    }

    throw UnsupportedError(
      '${Platform.operatingSystem} is not supported with $CameraDescription `${description.runtimeType}`.',
    );
  }
}
