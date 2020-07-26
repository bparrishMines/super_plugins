import 'dart:async';

import 'package:device_info/device_info.dart';
import 'package:flutter/widgets.dart';

import 'camera1_platform_impl.dart' as camera;
import 'camerax.dart';
import '../platform_interface.dart' as pi;

class CameraDevice implements pi.CameraDevice {
  CameraDevice(this.selector);

  final CameraSelector selector;

  @override
  String get name => selector.lensFacing.toString();
}

class SuperCamera implements pi.SuperCamera {
  SuperCamera._();

  static SuperCamera instance = SuperCamera._();

  @override
  Future<List<pi.CameraDevice>> getAllCameraDevices() async {
    if (!await hasMinimumVersion()) {
      pi.SuperCameraPlatform.instance = camera.SuperCameraPlatform();
      return SuperCamera.instance.getAllCameraDevices();
    }
    return Future<List<pi.CameraDevice>>.value(<pi.CameraDevice>[
      CameraDevice(CameraSelector(CameraSelector.lensFacingBack)),
      CameraDevice(CameraSelector(CameraSelector.lensFacingFront)),
    ]);
  }

  Future<bool> hasMinimumVersion() async {
    final AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
    if (androidInfo.version.sdkInt >= 21) return true;
    return false;
  }
}

class CameraController implements pi.CameraController {
  CameraController(this.device);

  @override
  final CameraDevice device;

  final Preview preview = Preview();
  Camera camera;

  @override
  Future<void> initialize() async {
    final Completer<void> completer = Completer();

    ProcessCameraProvider.instance.initialize(SuccessListener(
      onSuccess: () {
        completer.complete();
      },
      onError: (String code, String message) {
        completer.completeError(StateError('$code: $message'));
      },
    ));

    return completer.future;
  }

  @override
  Future<Widget> getPreview() async {
    return Texture(textureId: await preview.attachToTexture());
  }

  @override
  Future<void> start() async {
    camera = await ProcessCameraProvider.instance.bindToLifecycle(
      device.selector,
      preview,
    );
  }

  @override
  Future<void> stop() {
    camera = null;
    return ProcessCameraProvider.instance.unbindAll();
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
