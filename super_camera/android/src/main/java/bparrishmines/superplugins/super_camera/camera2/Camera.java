package bparrishmines.superplugins.super_camera.camera2;

import github.penguin.reference.reference.LocalReference;

class Camera implements LocalReference {
  final androidx.camera.core.Camera camera;

  Camera(androidx.camera.core.Camera camera) {
    this.camera = camera;
  }

  @Override
  public Class<? extends LocalReference> getReferenceClass() {
    return Camera.class;
  }
}
