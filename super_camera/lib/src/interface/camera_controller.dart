import 'dart:async';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';
import 'package:super_camera/src/android/camera/android_camera_configurator.dart';
import 'package:super_camera/src/ios/ios_camera_configurator.dart';

import '../../android_camera.dart';
import '../../ios_camera.dart';
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
///
/// final CameraPreview previewWidget = CameraPreview(controller);
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
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    AndroidDeviceInfo androidInfo;
    if (Platform.isAndroid) {
      androidInfo = await deviceInfo.androidInfo;
    }

    if (Platform.isAndroid) {
      //&& androidInfo.version.sdkInt < 21) {
      return AndroidCameraConfigurator.availableCameras();
    }
//    else if (Platform.isAndroid && androidInfo.version.sdkInt >= 21) {
//      // TODO(bparrishMines): Check if there exists a front/back camera.
//      descriptions.add(await CameraX.getCameraInfo(LensFacing.FRONT));
//      descriptions.add(await CameraX.getCameraInfo(LensFacing.BACK));
//    } else if (Platform.isIOS) {
//      final Array<CaptureDevice> devices =
//          await CaptureDevice.devicesWithMediaType(MediaType.video);
//      descriptions.addAll(devices.toList());
//    }
    else {
      throw UnsupportedError('${Platform.operatingSystem} is not supported.');
    }
    ;
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

    if (_instance != null) _instance.dispose();
    _instance = this;
    configurator.initialize().then((_) => completer.complete());

    return completer.future;
  }

  /// Begins the flow of data between the inputs and outputs connected to the camera instance.
  Future<void> start() {
    assert(!_isDisposed, _isDisposedMessage);
    assert(_instance == this, _isNotInitializedMessage);

    return configurator.start();
  }

  /// Stops the flow of data between the inputs and outputs connected to the camera instance.
  Future<void> stop() {
    assert(!_isDisposed, _isDisposedMessage);
    assert(_instance == this, _isNotInitializedMessage);

    return configurator.stop();
  }

  /// Deallocate all resources and disables further use of the controller.
  Future<void> dispose() {
    _instance = null;
    _isDisposed = true;
    return configurator.dispose();
  }

  // Find the default configurator for platform and device version.
  static CameraConfigurator _createDefaultConfigurator(
    CameraDescription description,
  ) {
    if (Platform.isAndroid && description is AndroidCameraDescription) {
      return AndroidCameraConfigurator(description);
    }
//    else if (Platform.isAndroid && description is CameraInfoX) {
//      return AndroidCameraXConfigurator(description);
//    } else if (Platform.isIOS && description is CaptureDevice) {
//      return IosCameraConfigurator(description);
//    }

    throw UnsupportedError(
      '${Platform.operatingSystem} is not supported with $CameraDescription `${description.runtimeType}`.',
    );
  }
}
