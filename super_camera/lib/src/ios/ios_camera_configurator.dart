//import 'package:flutter/material.dart';
//
//import '../../ios_camera.dart';
//import '../../super_camera.dart';
//
//class IosCameraConfigurator implements CameraConfigurator {
//  IosCameraConfigurator(this._captureDevice) {
//    final CaptureDeviceInput deviceInput = CaptureDeviceInput.initWithDevice(
//      _captureDevice,
//    );
//
//    _session.addInput(deviceInput);
//    final View view = View.initWithFrame();
//    view.layer.addSublayer(CaptureVideoPreviewLayer()..session = _session);
//    _previewWidget = ViewWidget(view);
//  }
//
//  final CaptureDevice _captureDevice;
//  final CaptureSession _session = CaptureSession();
//  ViewWidget _previewWidget;
//
//  @override
//  CameraDescription get cameraDescription => _captureDevice;
//
//  @override
//  Future<void> dispose() {
//    throw UnimplementedError();
//  }
//
//  @override
//  Future<Widget> getPreviewWidget() => Future<Widget>.value(_previewWidget);
//
//  @override
//  Future<void> initialize() => Future<void>.value();
//
//  @override
//  Future<void> start() => _session.startRunning();
//
//  @override
//  Future<void> stop() => Future<void>.value();
//}
