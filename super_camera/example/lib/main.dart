import 'package:flutter/material.dart';

import 'package:super_camera/super_camera.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Texture _texture;

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
    final Camera camera = await Camera1.instance.open(0);
    _texture = Texture(textureId: await camera.attachPreviewToTexture());
    camera.startPreview();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Container(width: 200, height: 200, child: _texture),
        ),
      ),
    );
  }
}
