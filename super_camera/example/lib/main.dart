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

              final List<CameraDescription> cameras =
                  await CameraController.availableCameras();
              final CameraController controller = new CameraController(
                description: cameras.firstWhere(
                    (CameraDescription description) =>
                        description.direction == LensDirection.front),
              );
              print(cameras);
            },
            child: const Text('Test Camera'),
          ),
        ),
      ),
    );
  }
}
