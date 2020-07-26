import 'package:flutter/widgets.dart';

import 'foundation.dart';
import '../platform_interface.dart' as pi;

class CameraDevice implements pi.CameraDevice {
  CameraDevice(this.device);

  final CaptureDevice device;

  @override
  String get name => device.uniqueId;
}

class SuperCamera implements pi.SuperCamera {
  SuperCamera._();

  static SuperCamera instance = SuperCamera._();

  @override
  Future<List<pi.CameraDevice>> getAllCameraDevices() async {
    final List<CaptureDevice> devices =
        await Foundation.instance.devicesWithMediaType(MediaType.video);
    return devices
        .map<CameraDevice>((CaptureDevice device) => CameraDevice(device))
        .toList();
  }
}

class CameraController implements pi.CameraController {
  CameraController(this.device)
      : session = CaptureSession(
          <CaptureDeviceInput>[CaptureDeviceInput(device.device)],
        );

  @override
  final CameraDevice device;

  final CaptureSession session;
  Preview preview;

  @override
  Future<void> initialize() async {
    // Do nothing.
  }

  @override
  Future<Widget> getPreview() async => preview ??= Preview(session);

  @override
  Future<void> start() => session.startRunning();

  @override
  Future<void> stop() => session.stopRunning();
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
