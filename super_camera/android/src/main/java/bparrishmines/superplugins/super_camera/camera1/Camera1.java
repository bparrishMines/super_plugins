package bparrishmines.superplugins.super_camera.camera1;

import java.util.ArrayList;
import java.util.List;
import github.penguin.reference.reference.LocalReference;

class Camera1 implements LocalReference {
  static private final Camera1 instance = new Camera1();

  private Camera1Manager manager;

  static Camera1 getInstance(Camera1Manager manager) {
    instance.manager = manager;
    return instance;
  }

  private Camera1() {}

  List<CameraInfo> getAllCameraInfo() {
    final List<CameraInfo> allCameraInfo = new ArrayList<>();

    int numOfCameras = android.hardware.Camera.getNumberOfCameras();
    for (int i = 0; i < numOfCameras; i++) {
      final CameraInfo info = new CameraInfo(i);
      android.hardware.Camera.getCameraInfo(i, info);
      allCameraInfo.add(info);
    }

    return allCameraInfo;
  }

  Camera open(int cameraId) {
    final Camera camera = new Camera(android.hardware.Camera.open(cameraId), manager);
    manager.pairWithNewRemoteReference(camera);
    return camera;
  }

  @Override
  public Class<? extends LocalReference> getReferenceClass() {
    return Camera1.class;
  }
}
