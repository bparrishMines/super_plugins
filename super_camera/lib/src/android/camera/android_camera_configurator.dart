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
  /// Creates a [CameraConfigurator] using the camera specified by [description].
  AndroidCameraConfigurator(AndroidCameraDescription description)
      : super(description);

  Camera _camera;
  Completer<void> _initializeCompleter;
  SurfaceTextureEntry _surfaceTextureEntry;
  Texture _texture;

  /// Retrieves a list of available cameras for the current device.
  static Future<List<CameraDescription>> availableCameras() async {
    final int cameraCount = await Camera.getNumberOfCameras();
    final List<CameraDescription> descriptions = <CameraDescription>[];

    final CameraInfo info = CameraInfo();

    for (int i = 0; i < cameraCount; i++) {
      Camera.getCameraInfo(i, info);

      final int facing = await info.facing;
      final int orientation = await info.orientation;

      descriptions.add(AndroidCameraDescription(
        facing: facing,
        orientation: orientation,
        id: i,
      ));
    }

    info.release();
    return descriptions;
  }

  @override
  Future<void> dispose() {
    super.dispose();
    _surfaceTextureEntry.release();
    return _camera.autoReleasePool().release();
  }

  @override
  Future<void> initialize() {
    super.initialize();
    if (_initializeCompleter != null) return _initializeCompleter.future;
    _initializeCompleter = Completer<void>();

    Future.wait([
      Camera.open(int.parse(cameraDescription.name))
          .then((Camera camera) => _camera = camera),
      TextureRegistry.instance
          .createSurfaceTexture()
          .then((SurfaceTextureEntry entry) => _surfaceTextureEntry = entry),
    ]).then((_) => _initializeCompleter.complete());

    return _initializeCompleter.future;
  }

  @override
  Future<void> start() {
    super.start();
    return initialize().then((_) => _camera.startPreview());
  }

  @override
  Future<void> stop() {
    super.stop();
    return initialize().then((_) => _camera.stopPreview());
  }

  /// Returns a [Texture] widget displaying frames from the camera.
  @override
  Future<Widget> getPreviewWidget() async {
    super.getPreviewWidget();
    if (_texture != null) return Future<Widget>.value(_texture);
    await initialize();

    final SurfaceTextureEntry entry =
        await TextureRegistry.instance.createSurfaceTexture();
    final SurfaceTexture surfaceTexture = await entry.surfaceTexture();
    final int id = await entry.id();

    _camera.setPreviewTexture(surfaceTexture.autoReleasePool());
    return _texture = Texture(textureId: id);
  }
}

class AndroidCameraDescription implements CameraDescription {
  AndroidCameraDescription({this.facing, this.id, this.orientation});

  final int facing;
  final int id;
  final int orientation;

  @override
  LensDirection get direction {
    switch (facing) {
      case CameraInfo.CAMERA_FACING_FRONT:
        return LensDirection.front;
      case CameraInfo.CAMERA_FACING_BACK:
        return LensDirection.back;
    }

    throw StateError(
      'Facing `$facing` should be either $CameraInfo.CAMERA_FACING_FRONT or $CameraInfo.CAMERA_FACING_BACK.',
    );
  }

  @override
  String get name => id.toString();
}
