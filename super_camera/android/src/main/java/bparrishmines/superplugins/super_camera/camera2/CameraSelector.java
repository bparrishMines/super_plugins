package bparrishmines.superplugins.super_camera.camera2;

import github.penguin.reference.reference.LocalReference;

class CameraSelector implements LocalReference {
  final androidx.camera.core.CameraSelector selector;
  final int lensFacing;

  CameraSelector(int lensFacing) {
    this.lensFacing = lensFacing;
    this.selector =
        new androidx.camera.core.CameraSelector.Builder().requireLensFacing(lensFacing).build();
  }

  @Override
  public Class<? extends LocalReference> getReferenceClass() {
    return CameraSelector.class;
  }
}
