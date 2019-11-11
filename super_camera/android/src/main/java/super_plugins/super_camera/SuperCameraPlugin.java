package super_plugins.super_camera;

import androidx.annotation.NonNull;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleOwner;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** SuperCameraPlugin */
public class SuperCameraPlugin implements FlutterPlugin, ActivityAware, LifecycleOwner {
  private static final String CHANNEL_NAME = "super_plugins/super_camera";
  private static final String PLATFORM_VIEW_FACTORY_NAME = CHANNEL_NAME + "/views";
  private static final String TEXTURE_REGISTRY_ID = "texture_registry";

  private ActivityPluginBinding activityBinding;
  private FlutterPluginBinding flutterBinding;

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), CHANNEL_NAME);
    final ChannelGenerated channelGenerated = new ChannelGenerated(channel);
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

  @Override
  public void onAttachedToEngine(FlutterPluginBinding binding) {
    flutterBinding = binding;
  }

  @Override
  public void onAttachedToActivity(ActivityPluginBinding binding) {
    activityBinding = binding;
    final MethodChannel channel = new MethodChannel(flutterBinding.getBinaryMessenger(), CHANNEL_NAME);
    final ChannelGenerated channelGenerated = new ChannelGenerated(channel);
    channel.setMethodCallHandler(channelGenerated);

    final ChannelGenerated.TextureRegistryWrapper activityWrapper = new ChannelGenerated.TextureRegistryWrapper(
        channelGenerated,
        TEXTURE_REGISTRY_ID,
        flutterBinding.getTextureRegistry());
    channelGenerated.addAllocatedWrapper(TEXTURE_REGISTRY_ID, activityWrapper);
    flutterBinding.getPlatformViewRegistry().registerViewFactory(
        PLATFORM_VIEW_FACTORY_NAME,
        channelGenerated.getPlatformViewFactory());
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    activityBinding = null;
  }

  @Override
  public void onReattachedToActivityForConfigChanges(ActivityPluginBinding binding) {
    activityBinding = binding;
  }

  @Override
  public void onDetachedFromActivity() {
    activityBinding = null;
  }

  @Override
  public void onDetachedFromEngine(FlutterPluginBinding binding) {
    flutterBinding = null;
  }

  @NonNull
  @Override
  public Lifecycle getLifecycle() {
    return (Lifecycle) activityBinding.getLifecycle();
  }
}
