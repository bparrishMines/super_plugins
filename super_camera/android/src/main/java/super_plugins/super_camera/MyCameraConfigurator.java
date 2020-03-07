package super_plugins.super_camera;

import android.hardware.Camera;

import java.io.IOException;

import io.flutter.Log;
import io.flutter.view.TextureRegistry;

public class MyCameraConfigurator extends CameraInterface.CameraConfigurator {
  private final CameraInterface.CameraConfigurator configurator;
  private final TextureRegistry textureRegistry;

  private Camera camera;
  private TextureRegistry.SurfaceTextureEntry textureEntry;


  public MyCameraConfigurator(CameraInterface.CameraConfigurator configurator, TextureRegistry textureRegistry) {
    super(configurator.cameraDescription, configurator.referenceId);
    this.configurator = configurator;
    this.textureRegistry = textureRegistry;
  }

  @Override
  public Object getPreviewWidget() {
    Log.d("handle", "getPreviewWidget");
    return textureEntry.id();
  }

  @Override
  public Object initialize() {
    Log.d("handle", "initialize");
    if (camera == null) {
      camera = Camera.open(Integer.parseInt(configurator.cameraDescription.name));
      textureEntry = textureRegistry.createSurfaceTexture();
      try {
        camera.setPreviewTexture(textureEntry.surfaceTexture());
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
    return null;
  }

  @Override
  public Object start() {
    Log.d("handle", "start");
    camera.startPreview();
    return null;
  }

  @Override
  public Object stop() {
    Log.d("handle", "stop");
    camera.stopPreview();
    return null;
  }

  @Override
  public Object dispose() {
    Log.d("handle", "dispose");
    camera.release();
    textureEntry.release();
    camera = null;
    textureEntry = null;
    return null;
  }
}
