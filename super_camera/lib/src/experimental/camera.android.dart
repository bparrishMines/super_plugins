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

class AndroidCameraConfigurator
    with MethodChannelReferenceHolder
    implements CameraConfigurator {
  AndroidCameraConfigurator(CameraConfigurator configurator)
      : cameraDescription = configurator.cameraDescription;

  final CameraDescription cameraDescription;

  Future<Widget> getPreviewWidget() async {
    final int textureId = await channel.invokeMethod<int>(
      'METHODCALL',
      <dynamic>[this, 'getPreviewWidget'],
    );
    return Texture(textureId: textureId);
  }

  Future<void> initialize() {
    print('initialize');
    retain();
    return channel
        .invokeMethod<void>('METHODCALL', <dynamic>[this, 'initialize']);
  }

  Future<void> start() {
    print('start');
    channel.invokeMethod('METHODCALL', <dynamic>[this, 'start']);
  }

  Future<void> stop() {
    print('stop');
    channel.invokeMethod('METHODCALL', <dynamic>[this, 'stop']);
  }

  Future<void> dispose() {
    print('dispose');
    return channel.invokeMethod('METHODCALL', <dynamic>[this, 'dispose']);
    //release();
  }

  @override
  MethodChannel get channel => CameraPlatform.channel;
}
