package bparrishmines.superplugins.super_camera.camera2;

import android.content.Context;
import android.util.Log;
import android.view.Surface;
import androidx.annotation.NonNull;
import androidx.camera.core.SurfaceRequest;
import androidx.core.content.ContextCompat;
import androidx.core.util.Consumer;
import github.penguin.reference.reference.LocalReference;
import io.flutter.view.TextureRegistry;

class Preview extends UseCase {
  private final CameraXManager manager;

  private TextureRegistry.SurfaceTextureEntry currentTextureEntry;

  Preview(CameraXManager manager) {
    super(new androidx.camera.core.Preview.Builder().build());
    this.manager = manager;
  }

  long attachToTexture() {
    if (currentTextureEntry != null) return currentTextureEntry.id();

    currentTextureEntry = manager.textureRegistry.createSurfaceTexture();
    final androidx.camera.core.Preview preview = (androidx.camera.core.Preview) useCase;
    preview.setSurfaceProvider(new androidx.camera.core.Preview.SurfaceProvider() {
      @Override
      public void onSurfaceRequested(@NonNull SurfaceRequest request) {
        request.provideSurface(new Surface(currentTextureEntry.surfaceTexture()),
            ContextCompat.getMainExecutor(manager.context),
            new Consumer<SurfaceRequest.Result>() {
              @Override
              public void accept(SurfaceRequest.Result result) {
                Log.d(Preview.class.getName(), "" + result.getResultCode());
              }
            }
        );
      }
    });
    return currentTextureEntry.id();
  }

  void releaseTexture() {
    if (currentTextureEntry == null) return;

    final androidx.camera.core.Preview preview = (androidx.camera.core.Preview) useCase;
    preview.setSurfaceProvider(null);
    currentTextureEntry.release();
    currentTextureEntry = null;
  }

  @Override
  public Class<? extends LocalReference> getReferenceClass() {
    return Preview.class;
  }
}
