import 'dart:async';

import 'package:flutter/material.dart';

import '../../ios_camera.dart';
import '../../super_camera.dart';

class IosCameraConfigurator extends CameraConfigurator {
  IosCameraConfigurator(IosCameraDescription description) : super(description);

  /// Retrieves a list of available cameras for the current device.
  static Future<List<CameraDescription>> availableCameras() async {
    final List<CameraDescription> descriptions = <CameraDescription>[];

    final Array<CaptureDevice> devices =
        await CaptureDevice.devicesWithMediaType(MediaType.video);

    final int cameraCount = await devices.count;
    for (int i = 0; i < cameraCount; i++) {
      final CaptureDevice device = await devices.objectAtIndex(i);
      final int position = await device.position;
      final String name = await device.uniqueID;
      descriptions.add(IosCameraDescription(name, position));
      device.release();
    }

    devices.release();
    return descriptions;
  }

  Completer<void> _initializeCompleter;
  CaptureSession _session;
  CaptureVideoPreviewLayer _previewLayer;
  ViewWidget _previewWidget;

  @override
  Future<void> dispose() {
    super.dispose();
    _session.release();
    _previewLayer.release();
    _session = null;
    _previewLayer = null;
    return Future<void>.value();
  }

  @override
  Future<Widget> getPreviewWidget() async {
    super.getPreviewWidget();
    await _initializeCompleter.future;
    return _previewWidget;
  }

  @override
  Future<void> initialize() {
    super.initialize();
    if (_initializeCompleter != null) return _initializeCompleter.future;
    _initializeCompleter = Completer<void>();

    final IosCameraDescription description = cameraDescription;
    _session = CaptureSession();
    _previewLayer = CaptureVideoPreviewLayer();
    _previewWidget = ViewWidget(_previewLayer);

    CaptureDevice.deviceWithUniqueID(description.name).then(
      (CaptureDevice device) {
        final CaptureDeviceInput input =
            CaptureDeviceInput.initWithDevice(device);
        _session.addInput(input);
        _previewLayer.session = _session;
        _initializeCompleter.complete();
      },
    );

    return _initializeCompleter.future;
  }

  @override
  Future<void> start() {
    super.start();
    return _initializeCompleter.future.then((_) => _session.startRunning());
  }

  @override
  Future<void> stop() {
    super.stop();
    return _initializeCompleter.future.then((_) => _session.stopRunning());
  }
}

class IosCameraDescription implements CameraDescription {
  IosCameraDescription(this.name, this.position);

  final String name;

  final int position;

  LensDirection get direction {
    switch (position) {
      case CaptureDevicePosition.front:
        return LensDirection.front;
      case CaptureDevicePosition.back:
        return LensDirection.back;
    }

    throw StateError(
      '$IosCameraDescription.position should equal $CaptureDevicePosition.front or $CaptureDevicePosition.back.',
    );
  }
}
