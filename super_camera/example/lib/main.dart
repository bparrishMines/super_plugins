import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:super_camera/super_camera.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget _previewWidget;

  @override
  void initState() {
    super.initState();
    _getCameraPermission();
  }

  void _getCameraPermission() async {
    while (!await Permission.camera.request().isGranted) {}
    _setupCamera();
  }

  void _setupCamera() async {
    final List<CameraDevice> devices =
        await SuperCamera.instance.getAllCameraDevices();
    final CameraController controller = CameraController(devices[0]);
    await controller.initialize();

    controller.getPreview().then((Widget preview) {
      controller.start();
      setState(() {
        _previewWidget = preview;
      });
    });
  }

//  void _setupIos() async {
//    final List<ios.CaptureDevice> devices =
//        await ios.Foundation.instance.devicesWithMediaType(ios.MediaType.video);
//    final ios.CaptureSession session = ios.CaptureSession(
//        <ios.CaptureDeviceInput>[ios.CaptureDeviceInput(devices[0])]);
//    session.startRunning();
//    setState(() {
//      _previewWidget = ios.Preview(session);
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Container(width: 200, height: 200, child: _previewWidget),
        ),
      ),
    );
  }
}
