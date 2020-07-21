package bparrishmines.superplugins.super_camera.camera2;

import androidx.core.content.ContextCompat;
import github.penguin.reference.reference.LocalReference;
import com.google.common.util.concurrent.ListenableFuture;

class ProcessCameraProvider implements LocalReference  {
  static private ProcessCameraProvider instance = new ProcessCameraProvider();

  private CameraXManager manager;
  private androidx.camera.lifecycle.ProcessCameraProvider provider;
  private Camera cameraReference;

  static ProcessCameraProvider getInstance(CameraXManager manager) {
    instance.manager = manager;
    return instance;
  }

  void initialize(final SuccessListener listener) {
    final ListenableFuture<androidx.camera.lifecycle.ProcessCameraProvider> future =
        androidx.camera.lifecycle.ProcessCameraProvider.getInstance(manager.context);
    future.addListener(new Runnable() {
      @Override
      public void run() {
        try {
          instance.provider = future.get();
          listener.onSuccess();
        } catch(Exception exception) {
          listener.onError(exception.getClass().getSimpleName(), exception.getMessage());
        }
      }
    }, ContextCompat.getMainExecutor(manager.context));
  }

  private ProcessCameraProvider() { }

  Camera bindToLifecycle(CameraSelector selector, UseCase useCase) {
    final androidx.camera.core.Camera camera =
        provider.bindToLifecycle(manager.lifecycleOwner, selector.selector, useCase.useCase);

    if (cameraReference == null) {
      cameraReference = new Camera(camera);
      manager.pairWithNewRemoteReference(cameraReference);
    }
    return cameraReference;
  }

  void unbindAll() {
    cameraReference = null;
    provider.unbindAll();
  }

  @Override
  public Class<? extends LocalReference> getReferenceClass() {
    return ProcessCameraProvider.class;
  }
}
