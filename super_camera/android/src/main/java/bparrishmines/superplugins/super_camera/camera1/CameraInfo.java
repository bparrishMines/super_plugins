package bparrishmines.superplugins.super_camera.camera1;

import android.hardware.Camera;
import github.penguin.reference.reference.LocalReference;

class CameraInfo extends Camera.CameraInfo implements LocalReference {
  final int cameraId;

  CameraInfo(int cameraId) {
    this.cameraId = cameraId;
  }

  @Override
  public Class<? extends LocalReference> getReferenceClass() {
    return CameraInfo.class;
  }
}
