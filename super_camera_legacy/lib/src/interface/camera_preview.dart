import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:super_camera/android_camera.dart';

import 'camera_controller.dart';
import 'camera_interface.dart';
import '../android/camera/camera.dart';

/// Helper widget to display camera preview frames.
///
/// This widget will automatically orient the preview to display the camera.
class CameraPreview extends StatefulWidget {
  CameraPreview(this.controller) : assert(controller != null);

  /// Controls a device camera.
  final CameraController controller;

  @override
  State<StatefulWidget> createState() => _CameraPreviewState();
}

class _CameraPreviewState extends State<CameraPreview> {
  RotatedBox _buildPreviewWidget(Widget cameraWidget) {
    final CameraController controller = widget.controller;
    int rotation = 0;
    final CameraDescription description =
        controller.configurator.cameraDescription;

    if (description is AndroidCameraDescription &&
        description.direction == LensDirection.front) {
      rotation = (description.orientation + 180) % 360;
      cameraWidget = Transform(
        transform: Matrix4.rotationY(pi),
        child: cameraWidget,
        alignment: Alignment.center,
      );
    } else if (description is AndroidCameraDescription &&
        description.direction == LensDirection.back) {
      rotation = description.orientation;
    }

    return RotatedBox(
      quarterTurns: (rotation / 90).floor(),
      child: cameraWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final CameraConfigurator configurator = widget.controller.configurator;

    widget.controller.initialize();
    widget.controller.start();
    return FutureBuilder<Widget>(
      future: configurator.getPreviewWidget(),
      builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Container();
          case ConnectionState.done:
            return _buildPreviewWidget(snapshot.data);
        }
        return null; // unreachable
      },
    );
  }
}
