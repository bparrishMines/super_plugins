import 'package:flutter/material.dart';

import '../../ios_camera.dart';
import '../../super_camera.dart';

class IosCameraConfigurator implements CameraConfigurator {
  IosCameraConfigurator(this._captureDevice) {
    final CaptureDeviceInput deviceInput = CaptureDeviceInput.initWithDevice(
      _captureDevice,
    );

    _session.addInput(deviceInput);
//    _view = ViewWidget(sublayers: <Layer>[
//      CaptureVideoPreviewLayer()..session = _session,
//    ]);
  }

  final CaptureDevice _captureDevice;
  final CaptureSession _session = CaptureSession();
  ViewWidget _view;

  @override
  CameraDescription get cameraDescription => _captureDevice;

  @override
  Future<void> dispose() {
    throw UnimplementedError();
  }

  @override
  Future<Widget> getPreviewWidget() => Future<Widget>.value(_view);

  @override
  Future<void> initialize() => Future<void>.value();

  @override
  Future<void> start() => _session.startRunning();

  @override
  Future<void> stop() => Future<void>.value();
}
