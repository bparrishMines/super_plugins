import '../../interface/camera_interface.dart';
import 'camera.dart';

class AndroidCameraConfigurator extends CameraConfigurator {
  AndroidCameraConfigurator(CameraInfo info) : super(info);

  @override
  Future<int> addPreviewTexture() {
    // TODO: implement addPreviewTexture
    return null;
  }

  @override
  Future<void> dispose() {
    // TODO: implement dispose
    return null;
  }

  @override
  Future<void> initialize() {
    // TODO: implement initialize
    return null;
  }

  @override
  // TODO: implement previewTextureId
  int get previewTextureId => null;

  @override
  Future<void> start() {
    // TODO: implement start
    return null;
  }

  @override
  Future<void> stop() {
    // TODO: implement stop
    return null;
  }
}