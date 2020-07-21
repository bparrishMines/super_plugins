package bparrishmines.superplugins.super_camera;

import android.app.Activity;
import androidx.annotation.NonNull;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleOwner;
import bparrishmines.superplugins.super_camera.camera1.Camera1Manager;
import bparrishmines.superplugins.super_camera.camera2.CameraXManager;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.embedding.engine.plugins.lifecycle.FlutterLifecycleAdapter;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import io.flutter.view.TextureRegistry;

/** SuperCameraPlugin */
public class SuperCameraPlugin implements FlutterPlugin, ActivityAware, LifecycleOwner {
  public static final String baseChannelName = "bparrishMines.superplugins/super_camera";
  private Lifecycle lifecycle;
  private FlutterPluginBinding pluginBinding;
  private CameraXManager cameraXManager;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    pluginBinding = flutterPluginBinding;
  }

  public static void registerWith(Registrar registrar) {
    new SuperCameraPlugin().initialize(registrar.messenger(), registrar.textures(), registrar.activity(), null);
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    pluginBinding = null;
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    lifecycle = FlutterLifecycleAdapter.getActivityLifecycle(binding);
    initialize(pluginBinding.getBinaryMessenger(), pluginBinding.getTextureRegistry(), binding.getActivity(), this);
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    lifecycle = null;
    cameraXManager.setContext(null);
  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
    lifecycle = FlutterLifecycleAdapter.getActivityLifecycle(binding);
    cameraXManager.setContext(binding.getActivity());
  }

  @Override
  public void onDetachedFromActivity() {
    lifecycle = null;
  }

  private void initialize(BinaryMessenger binaryMessenger, TextureRegistry textureRegistry, Activity activity, LifecycleOwner lifecycleOwner) {
    new Camera1Manager(binaryMessenger, textureRegistry).initialize();
    if (lifecycleOwner != null) {
      cameraXManager = new CameraXManager(binaryMessenger, textureRegistry, activity, lifecycleOwner);
      cameraXManager.initialize();
    }
  }

  @NonNull
  @Override
  public Lifecycle getLifecycle() {
    return lifecycle;
  }
}
