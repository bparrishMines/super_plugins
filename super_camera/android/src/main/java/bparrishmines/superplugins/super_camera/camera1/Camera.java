package bparrishmines.superplugins.super_camera.camera1;

import java.io.IOException;
import github.penguin.reference.reference.LocalReference;
import io.flutter.view.TextureRegistry.SurfaceTextureEntry;

class Camera implements LocalReference {
  private final android.hardware.Camera camera;
  private final Camera1Manager manager;

  private SurfaceTextureEntry currentTextureEntry;

  Camera(android.hardware.Camera camera, Camera1Manager manager) {
    this.camera = camera;
    this.manager = manager;
  }

  void release() throws IOException {
    releaseTexture();
    camera.release();
  }

  void startPreview() {
    camera.startPreview();
  }

  void stopPreview() {
    camera.stopPreview();
  }

  long attachPreviewToTexture() throws IOException {
    if (currentTextureEntry != null) return currentTextureEntry.id();

    currentTextureEntry = manager.textureRegistry.createSurfaceTexture();
    camera.setPreviewTexture(currentTextureEntry.surfaceTexture());
    return currentTextureEntry.id();
  }

  void releaseTexture() throws IOException {
    if (currentTextureEntry == null) return;
    camera.setPreviewTexture(null);
    currentTextureEntry.release();
    currentTextureEntry = null;
  }

  @Override
  public Class<? extends LocalReference> getReferenceClass() {
    return Camera.class;
  }
}
