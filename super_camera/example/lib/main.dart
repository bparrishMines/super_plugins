import 'package:flutter/material.dart';

import 'package:super_camera/src/android/camera1.dart' as camera1;
import 'package:super_camera/src/android/camerax.dart' as camerax;
import 'package:super_camera/src/ios/foundation.dart' as ios;
import 'package:permission_handler/permission_handler.dart';

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
    _setupIos();
  }

  void _setupCamera() async {
    final camera1.Camera camera = await camera1.Camera1.instance.open(0);
    _previewWidget = Texture(textureId: await camera.attachPreviewToTexture());
    camera.startPreview();
    setState(() {});
  }

  void _setupCamera2() async {
    final camerax.Preview preview = camerax.Preview();
    final camerax.ProcessCameraProvider provider =
        camerax.ProcessCameraProvider.instance;
    provider.initialize(
      camerax.SuccessListener(
        onSuccess: () {
          provider.bindToLifecycle(
            camerax.CameraSelector(camerax.CameraSelector.lensFacingBack),
            preview,
          );
          preview.attachToTexture().then((int textureId) {
            setState(() {
              _previewWidget = Texture(textureId: textureId);
            });
          });
        },
        onError: (String code, String message) {
          print('$code: $message');
        },
      ),
    );
  }

  void _setupIos() async {
    final List<ios.CaptureDevice> devices =
        await ios.Foundation.instance.devicesWithMediaType(ios.MediaType.video);
    final ios.CaptureSession session = ios.CaptureSession(
        <ios.CaptureDeviceInput>[ios.CaptureDeviceInput(devices[0])]);
    session.startRunning();
    setState(() {
      _previewWidget = ios.Preview(session);
    });
  }

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
