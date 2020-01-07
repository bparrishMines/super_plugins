import 'package:flutter/material.dart';

import '../../ios_camera.dart';
import '../../super_camera.dart';

class IosCameraConfigurator implements CameraConfigurator {
  IosCameraConfigurator(this._captureDevice) : _session = CaptureSession() {
    final CaptureDeviceInput deviceInput = CaptureDeviceInput.initWithDevice(
      _captureDevice,
    );

    _session.addInput(deviceInput);
    final CaptureVideoPreviewLayer previewLayer = CaptureVideoPreviewLayer();
    previewLayer.session = _session;
    _view = View(
      sublayers: <Layer>[previewLayer],
      onViewCreated: () => _isStarted ? _session.startRunning() : null,
    );
  }

  final CaptureDevice _captureDevice;
  final CaptureSession _session;
  View _view;
  bool _isStarted = false;

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
  Future<void> start() {
    _isStarted = true;
    return Future<void>.value();
  }

  @override
  Future<void> stop() => Future<void>.value();
}
