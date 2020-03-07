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

  Future<void> initialize() => channel.invokeMethod('METHODCALL', <dynamic>[this, 'initialize']);

  Future<void> start() => channel.invokeMethod('METHODCALL', <dynamic>[this, 'start']);

  Future<void> stop() => channel.invokeMethod('METHODCALL', <dynamic>[this, 'stop']);

  Future<void> dispose() => channel.invokeMethod('METHODCALL', <dynamic>[this, 'dispose']);

  @override
  MethodChannel get channel => CameraPlatform.channel;
}
