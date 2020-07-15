package bparrishmines.superplugins.super_camera;

import androidx.annotation.NonNull;

import bparrishmines.superplugins.super_camera.camera1.Camera1Manager;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import io.flutter.view.TextureRegistry;

/** SuperCameraPlugin */
public class SuperCameraPlugin implements FlutterPlugin {
  public static final String baseChannelName = "bparrishMines.superplugins/super_camera";

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    initialize(flutterPluginBinding.getBinaryMessenger(), flutterPluginBinding.getTextureRegistry());
  }

  public static void registerWith(Registrar registrar) {
    new SuperCameraPlugin().initialize(registrar.messenger(), registrar.textures());
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    // Do nothing
  }

  private void initialize(BinaryMessenger binaryMessenger, TextureRegistry textureRegistry) {
    new Camera1Manager(binaryMessenger, textureRegistry).initialize();;
  }
}
