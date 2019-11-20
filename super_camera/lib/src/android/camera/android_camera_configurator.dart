import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:super_camera/src/android/common/texture_registry.dart';

import '../../interface/camera_interface.dart';
import 'camera.dart';

/// Default [CameraConfigurator] for Android versions < 21.
///
/// This configurator is created when using the default constructor for
/// [CameraController] and the current device is an Android, versions 16-20.
class AndroidCameraConfigurator extends CameraConfigurator {
  /// Creates a [CameraConfigurator] using the camera specified by [info].
  AndroidCameraConfigurator(CameraInfo info) : super(info);

  Camera _camera;
  Texture _texture;

  @override
  Future<void> dispose() {
    super.dispose();

    _texture = null;
    return _camera.release();
  }

  @override
  Future<void> initialize() {
    super.initialize();

    if (_camera != null) return Future<void>.value();

    _camera = Camera.open(int.parse(cameraDescription.name));
    return Future<void>.value();
  }

  @override
  Future<void> start() {
    super.start();
    return _camera.startPreview();
  }

  @override
  Future<void> stop() {
    super.stop();
    return _camera.stopPreview();
  }

  /// Returns a [Texture] widget displaying frames from the camera.
  @override
  Future<Widget> getPreviewWidget() {
    super.getPreviewWidget();
    if (_texture != null) return Future<Widget>.value(_texture);

    final Completer<Widget> completer = Completer<Widget>();

    TextureRegistry.instance.createSurfaceTexture().then(
      (SurfaceTextureEntry entry) {
        _camera.setPreviewTexture(entry.surfaceTexture());
        completer.complete(_texture = Texture(textureId: entry.id()));
      },
    );

    return completer.future;
  }
}
