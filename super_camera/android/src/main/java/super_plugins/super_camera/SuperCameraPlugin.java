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
  private static final String LIFECYCLE_OWNER_ID = "lifecycle_owner";
  private static final String ACTIVITY_ID = "activity";

  private ActivityPluginBinding activityBinding;
  private FlutterPluginBinding flutterBinding;
  private ChannelGenerated channelGenerated;
  private ChannelGenerated.ActivityWrapper activityWrapper;

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), CHANNEL_NAME);
    final ChannelGenerated channelGenerated = new ChannelGenerated(channel);
    channel.setMethodCallHandler(channelGenerated);

    final ChannelGenerated.TextureRegistryWrapper textureRegistryWrapper = new ChannelGenerated.TextureRegistryWrapper(
        channelGenerated,
        TEXTURE_REGISTRY_ID,
        registrar.textures());
    channelGenerated.addAllocatedWrapper(TEXTURE_REGISTRY_ID, textureRegistryWrapper);
    registrar
        .platformViewRegistry()
        .registerViewFactory(
            PLATFORM_VIEW_FACTORY_NAME,
            channelGenerated.getPlatformViewFactory());
  }

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
    flutterBinding = binding;
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    activityBinding = binding;

    final MethodChannel channel = new MethodChannel(flutterBinding.getBinaryMessenger(), CHANNEL_NAME);
    channelGenerated = new ChannelGenerated(channel);
    channel.setMethodCallHandler(channelGenerated);

    final ChannelGenerated.TextureRegistryWrapper textureRegistryWrapper = new ChannelGenerated.TextureRegistryWrapper(
        channelGenerated,
        TEXTURE_REGISTRY_ID,
        flutterBinding.getTextureRegistry());
    final ChannelGenerated.LifecycleOwnerWrapper lifecycleOwnerWrapper =
        new ChannelGenerated.LifecycleOwnerWrapper(channelGenerated, LIFECYCLE_OWNER_ID, this);
    activityWrapper = new ChannelGenerated.ActivityWrapper(channelGenerated, ACTIVITY_ID, activityBinding.getActivity());

    channelGenerated.addAllocatedWrapper(TEXTURE_REGISTRY_ID, textureRegistryWrapper);
    channelGenerated.addAllocatedWrapper(LIFECYCLE_OWNER_ID, lifecycleOwnerWrapper);
    channelGenerated.addAllocatedWrapper(ACTIVITY_ID, activityWrapper);

    flutterBinding.getPlatformViewRegistry().registerViewFactory(
        PLATFORM_VIEW_FACTORY_NAME,
        channelGenerated.getPlatformViewFactory());
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    activityBinding = null;
    activityWrapper = null;
    channelGenerated.removeAllocatedWrapper(ACTIVITY_ID);
  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
    activityBinding = binding;
    activityWrapper = new ChannelGenerated.ActivityWrapper(channelGenerated, ACTIVITY_ID, activityBinding.getActivity());
    channelGenerated.addAllocatedWrapper(ACTIVITY_ID, activityWrapper);
  }

  @Override
  public void onDetachedFromActivity() {
    activityBinding = null;
    activityWrapper = null;
    channelGenerated.removeAllocatedWrapper(ACTIVITY_ID);
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    flutterBinding = null;
  }

  @NonNull
  @Override
  public Lifecycle getLifecycle() {
    return (Lifecycle) activityBinding.getLifecycle();
  }
}
