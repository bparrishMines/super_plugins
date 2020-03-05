import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'camera.interface.dart';

class AndroidInstanceCreator extends CameraInstanceCreator {
  @override
  CameraConfigurator createCameraConfigurator(
    CameraConfigurator configurator,
  ) =>
      AndroidCameraConfigurator(configurator);
}

class AndroidCameraConfigurator with MethodChannelReferenceHolder implements CameraConfigurator {
  AndroidCameraConfigurator(CameraConfigurator configurator)
      : cameraDescription = configurator.cameraDescription;

  final CameraDescription cameraDescription;

  Future<Widget> getPreviewWidget() {
    throw UnimplementedError();
  }

  Future<void> initialize() => channel.invokeMethod('methodcall', <dynamic>[this, 'initialize']);

  Future<void> start() => channel.invokeMethod('methodcall', <dynamic>[this, 'start']);

  Future<void> stop() => channel.invokeMethod('methodcall', <dynamic>[this, 'stop']);

  Future<void> dispose() => channel.invokeMethod('methodcall', <dynamic>[this, 'dispose']);

  @override
  MethodChannel get channel => CameraPlatform.channel;
}
