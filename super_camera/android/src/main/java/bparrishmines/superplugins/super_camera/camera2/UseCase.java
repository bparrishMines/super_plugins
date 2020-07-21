package bparrishmines.superplugins.super_camera.camera2;

import github.penguin.reference.reference.LocalReference;

abstract class UseCase implements LocalReference {
  final androidx.camera.core.UseCase useCase;

  protected UseCase(androidx.camera.core.UseCase useCase) {
    this.useCase = useCase;
  }
}
