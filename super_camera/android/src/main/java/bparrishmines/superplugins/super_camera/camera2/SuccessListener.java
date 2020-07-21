package bparrishmines.superplugins.super_camera.camera2;

import java.util.Arrays;

import github.penguin.reference.reference.LocalReference;

class SuccessListener implements LocalReference {
  final CameraXManager manager;

  SuccessListener(CameraXManager manager) {
    this.manager = manager;
  }

  void onSuccess() {
    manager.invokeRemoteMethod(manager.getPairedRemoteReference(this),
        "onSuccess");
    manager.disposePairWithLocalReference(this);
  }

  void onError(String code, String message) {
    manager.invokeRemoteMethod(manager.getPairedRemoteReference(this),
        "onError",
        Arrays.<Object>asList(code, message));
    manager.disposePairWithLocalReference(this);
  }

  @Override
  public Class<? extends LocalReference> getReferenceClass() {
    return SuccessListener.class;
  }
}
