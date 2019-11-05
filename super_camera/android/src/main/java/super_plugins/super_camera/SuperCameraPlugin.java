package super_plugins.super_camera;

import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** SuperCameraPlugin */
public class SuperCameraPlugin {
  private static final String CHANNEL_NAME = "super_plugins/super_camera";
  private static final String PLATFORM_VIEW_FACTORY_NAME = CHANNEL_NAME + "/views";
  private static final String TEXTURE_REGISTRY_ID = "texture_registry";

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(),
        "super_plugins/super_camera");
    final ChannelGenerated channelGenerated = new ChannelGenerated();
    channel.setMethodCallHandler(channelGenerated);

    final ChannelGenerated.TextureRegistryWrapper activityWrapper = new ChannelGenerated.TextureRegistryWrapper(
        channelGenerated,
        TEXTURE_REGISTRY_ID,
        registrar.textures());
    channelGenerated.addAllocatedWrapper(TEXTURE_REGISTRY_ID, activityWrapper);
    registrar
        .platformViewRegistry()
        .registerViewFactory(
            PLATFORM_VIEW_FACTORY_NAME,
            channelGenerated.getPlatformViewFactory());
  }
}
