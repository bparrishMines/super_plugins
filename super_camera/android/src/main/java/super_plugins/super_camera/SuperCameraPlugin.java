package super_plugins.super_camera;

import androidx.annotation.NonNull;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleOwner;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.embedding.engine.plugins.lifecycle.FlutterLifecycleAdapter;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** SuperCameraPlugin */
public class SuperCameraPlugin implements FlutterPlugin, ActivityAware, LifecycleOwner {
  private static final String CHANNEL_NAME = "super_plugins/super_camera";
  private static final String PLATFORM_VIEW_FACTORY_NAME = CHANNEL_NAME + "/views";
  private static final String TEXTURE_REGISTRY_ID = "texture_registry";
  private static final String LIFECYCLE_OWNER_ID = "lifecycle";

  private FlutterPluginBinding flutterBinding;
  private Lifecycle lifecycle;

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), CHANNEL_NAME);
    final ChannelGenerated channelGenerated = new ChannelGenerated(channel);
    channel.setMethodCallHandler(channelGenerated.methodCallHandler);

    final ChannelGenerated.$TextureRegistry textureRegistryWrapper = new ChannelGenerated.$TextureRegistry(
        channelGenerated.wrapperManager,
        TEXTURE_REGISTRY_ID,
        registrar.textures());
    channelGenerated.wrapperManager.addAllocatedWrapper(textureRegistryWrapper);
    registrar
        .platformViewRegistry()
        .registerViewFactory(
            PLATFORM_VIEW_FACTORY_NAME,
            channelGenerated.viewFactory);
  }

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
    flutterBinding = binding;
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    lifecycle = FlutterLifecycleAdapter.getActivityLifecycle(binding);

    final MethodChannel channel = new MethodChannel(flutterBinding.getBinaryMessenger(), CHANNEL_NAME);
    final ChannelGenerated channelGenerated = new ChannelGenerated(channel);
    channel.setMethodCallHandler(channelGenerated.methodCallHandler);

    final ChannelGenerated.$TextureRegistry textureRegistryWrapper = new ChannelGenerated.$TextureRegistry(
        channelGenerated.wrapperManager,
        TEXTURE_REGISTRY_ID,
        flutterBinding.getTextureRegistry());

    final ChannelGenerated.$LifecycleOwner lifecycleOwnerWrapper =
        new ChannelGenerated.$LifecycleOwner(channelGenerated.wrapperManager,
            LIFECYCLE_OWNER_ID,
            this);

    channelGenerated.wrapperManager.addAllocatedWrapper(textureRegistryWrapper);
    channelGenerated.wrapperManager.addAllocatedWrapper(lifecycleOwnerWrapper);

    flutterBinding.getPlatformViewRegistry().registerViewFactory(
        PLATFORM_VIEW_FACTORY_NAME,
        channelGenerated.viewFactory);
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    lifecycle = null;
  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
    lifecycle = FlutterLifecycleAdapter.getActivityLifecycle(binding);
  }

  @Override
  public void onDetachedFromActivity() {
    lifecycle = null;
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    flutterBinding = null;
  }

  @NonNull
  @Override
  public Lifecycle getLifecycle() {
    return lifecycle;
  }
}
