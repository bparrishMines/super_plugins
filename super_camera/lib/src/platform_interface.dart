import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'android/camerax_platform_impl.dart' as android;
import 'ios/foundation_platform_impl.dart' as ios;

abstract class SuperCameraPlatform extends PlatformInterface {
  SuperCameraPlatform() : super(token: _token);

  static SuperCameraPlatform _instance;

  static final Object _token = Object();

  static SuperCameraPlatform get instance {
    if (_instance != null) return _instance;
    if (Platform.isIOS) return _instance = ios.SuperCameraPlatform();
    if (Platform.isAndroid) return _instance = android.SuperCameraPlatform();

    throw UnsupportedError('message');
  }

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [SuperCameraPlatform] when they register themselves.
  static set instance(SuperCameraPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  SuperCamera getSuperCameraInstance();
  CameraController createCameraController(CameraDevice device);
}

abstract class SuperCamera {
  static SuperCamera get instance =>
      SuperCameraPlatform.instance.getSuperCameraInstance();

  Future<List<CameraDevice>> getAllCameraDevices();
}

abstract class CameraDevice {
  String get name;
}

abstract class CameraController {
  factory CameraController(CameraDevice device) {
    return SuperCameraPlatform.instance.createCameraController(device);
  }

  CameraDevice get device;

  Future<void> initialize();
  Future<void> start();
  Future<void> stop();
  Future<Widget> getPreview();
}
