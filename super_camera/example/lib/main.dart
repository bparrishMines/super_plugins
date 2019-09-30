import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:super_camera/super_camera.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () async {
              final bool hasCameraAccess = await _getCameraPermission();

              if (!hasCameraAccess) {
                print('No camera access!');
                return;
              }

              final int numCameras = await Camera.getNumberOfCameras();
              print(numCameras);
              final CameraInfo info = CameraInfo();
              for (int i = 0; i < numCameras; i++) {
                print('CameraId: $i');
                await Camera.getCameraInfo(i, info);
                print(info.facing);
                print(info.orientation);
              }

              final Camera camera = Camera.open(0);
              await camera.release();
            },
            child: Text('Test'),
          ),
        ),
      ),
    );
  }
}
