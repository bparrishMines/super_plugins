import 'package:flutter/widgets.dart';

import 'camera1.dart';
import '../platform_interface.dart' as pi;

class CameraDevice implements pi.CameraDevice {
  CameraDevice(this.info);

  final CameraInfo info;

  @override
  String get name => info.cameraId.toString();
}

class SuperCamera implements pi.SuperCamera {
  SuperCamera._();

  static SuperCamera instance = SuperCamera._();

  @override
  Future<List<pi.CameraDevice>> getAllCameraDevices() async {
    final List<CameraInfo> allInfo = await Camera1.instance.getAllCameraInfo();
    return allInfo
        .map<CameraDevice>((CameraInfo info) => CameraDevice(info))
        .toList();
  }
}

class CameraController implements pi.CameraController {
  CameraController(this.device);

  @override
  final CameraDevice device;

  Camera camera;

  @override
  Future<void> initialize() async {
    if (camera != null) return;
    camera = await Camera1.instance.open(device.info.cameraId);
  }

  @override
  Future<Widget> getPreview() async {
    assert(camera != null);
    return Texture(textureId: await camera.attachPreviewToTexture());
  }

  @override
  Future<void> start() {
    assert(camera != null);
    return camera.startPreview();
  }

  @override
  Future<void> stop() {
    assert(camera != null);
    return camera.stopPreview();
  }
}

class SuperCameraPlatform extends pi.SuperCameraPlatform {
  @override
  CameraController createCameraController(covariant CameraDevice device) {
    return CameraController(device);
  }

  @override
  SuperCamera getSuperCameraInstance() {
    return SuperCamera.instance;
  }
}
