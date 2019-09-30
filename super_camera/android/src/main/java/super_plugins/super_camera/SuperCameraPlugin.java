package super_plugins.super_camera;

import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import io.flutter.view.TextureRegistry;
import io.flutter.view.TextureRegistry.SurfaceTextureEntry;

/** SuperCameraPlugin */
public class SuperCameraPlugin {
  private static TextureRegistry textureRegistry;

  static SurfaceTextureEntry getSurfaceTextureEntry() {
    return textureRegistry.createSurfaceTexture();
  }

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(),
        "super_plugins/super_camera");
    channel.setMethodCallHandler(new ChannelGenerated());
    textureRegistry = registrar.textures();
  }
}
