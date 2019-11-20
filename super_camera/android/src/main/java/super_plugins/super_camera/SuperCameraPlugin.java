package super_plugins.super_camera;

import android.os.Build;
import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleOwner;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import io.flutter.Log;
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
    final ChannelGenerated.ActivityWrapper activityWrapper = new ChannelGenerated.ActivityWrapper(channelGenerated, ACTIVITY_ID, binding.getActivity());

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
    channelGenerated.removeAllocatedWrapper(ACTIVITY_ID);
  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
    activityBinding = binding;
    final ChannelGenerated.ActivityWrapper activityWrapper = new ChannelGenerated.ActivityWrapper(channelGenerated, ACTIVITY_ID, binding.getActivity());
    channelGenerated.addAllocatedWrapper(ACTIVITY_ID, activityWrapper);
  }

  @Override
  public void onDetachedFromActivity() {
    activityBinding = null;
    channelGenerated = null;
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    flutterBinding = null;
  }

  @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
  @Override
  public Lifecycle getLifecycle() {
    try {
      Object reference = activityBinding.getLifecycle();
      Class hiddenLifecycleClass =
          Class.forName("io.flutter.embedding.engine.plugins.lifecycle.HiddenLifecycleReference");

      if (!reference.getClass().equals(hiddenLifecycleClass)) {
        throw new IllegalArgumentException(
            "The reference argument must be of type HiddenLifecycleReference. Was actually "
                + reference);
      }

      Method getLifecycle = reference.getClass().getMethod("getLifecycle");
      return (Lifecycle) getLifecycle.invoke(reference);
    } catch (ClassNotFoundException
        | NoSuchMethodException
        | IllegalAccessException
        | InvocationTargetException e) {
      Log.e(
          "super_camera",
          "You are attempting to use Flutter plugins that are newer than your"
              + " version of Flutter. Plugins may not work as expected.");
    }
    return null;
  }
}
