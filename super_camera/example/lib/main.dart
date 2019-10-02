import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:super_camera/super_camera.dart';

void main() {
//  SystemChrome.setEnabledSystemUIOverlays([]);
//  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
//    DeviceOrientation.portraitUp,
//  ]);

  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CameraController _controller;
  LensDirection _lensDirection = LensDirection.back;
  double _deviceRotation = 0;

  @override
  void initState() {
    super.initState();
    _getCameraPermission().then((bool success) {
      if (success) _setupCamera();
    });
  }

  Future<void> _toggleLensDirection() {
    _controller.dispose();
    setState(() {
      _controller = null;
    });

    switch (_lensDirection) {
      case LensDirection.front:
        _lensDirection = LensDirection.back;
        break;
      case LensDirection.back:
        _lensDirection = LensDirection.front;
        break;
      case LensDirection.unknown:
        _lensDirection = LensDirection.front;
        break;
    }

    return _setupCamera();
  }

  Future<void> _setupCamera() async {
    final List<CameraDescription> cameras =
        await CameraController.availableCameras();
    final CameraDescription camera = cameras.firstWhere(
      (CameraDescription desc) => desc.direction == _lensDirection,
    );

    setState(() {
      _controller = CameraController(description: camera);
    });
  }

  Widget _buildPictureButton() {
    return InkResponse(
      onTap: () {},
      child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey, width: 2)),
        child: new Icon(
          Icons.camera,
          color: Colors.grey,
          size: 60,
        ),
      ),
    );
  }

  Future<bool> _getCameraPermission() async {
    final PermissionStatus permission =
        await PermissionHandler().checkPermissionStatus(
      PermissionGroup.camera,
    );

    if (permission == PermissionStatus.granted) {
      return true;
    }

    final Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions([PermissionGroup.camera]);

    return permissions[PermissionGroup.camera] == PermissionStatus.granted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: _controller != null
                  ? CameraPreview(_controller)
                  : Container(),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 30, left: 10, right: 10, top: 15),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.centerLeft,
                  child: Transform.rotate(
                    angle: _deviceRotation,
                    child: IconButton(
                      icon: Icon(
                        Icons.switch_camera,
                        color: Colors.white,
                        size: 32,
                      ),
                      onPressed: _toggleLensDirection,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: _buildPictureButton(),
                )
              ],
            ),
            decoration: BoxDecoration(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
