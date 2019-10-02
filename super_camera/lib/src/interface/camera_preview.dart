import 'package:flutter/widgets.dart';

import 'camera_controller.dart';
import 'camera_interface.dart';
import '../android/camera/camera.dart';

class CameraPreview extends StatefulWidget {
  CameraPreview(this.controller) : assert(controller != null);

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

    if (description is CameraInfo &&
        description.direction == LensDirection.front) {
      rotation = (description.orientation + 180) % 360;
    } else if (description is CameraInfo &&
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
    widget.controller.stop();
    return FutureBuilder<Widget>(
      future: configurator.getPreviewWidget(),
      builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Container();
          case ConnectionState.done:
            widget.controller.start();
            return _buildPreviewWidget(snapshot.data);
        }
        return null; // unreachable
      },
    );
  }
}
