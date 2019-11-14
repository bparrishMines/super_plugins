package super_plugins.super_camera_example;

import com.baseflow.permissionhandler.PermissionHandlerPlugin;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry;
import io.flutter.plugins.deviceinfo.DeviceInfoPlugin;
import super_plugins.super_camera.SuperCameraPlugin;

public class MainActivity extends FlutterActivity {
  @Override
  public void configureFlutterEngine(FlutterEngine flutterEngine) {
    flutterEngine.getPlugins().add(new SuperCameraPlugin());
    flutterEngine.getPlugins().add(new DeviceInfoPlugin());

    final ShimPluginRegistry shimPluginRegistry = new ShimPluginRegistry(flutterEngine);
    PermissionHandlerPlugin.registerWith(
        shimPluginRegistry.registrarFor("com.baseflow.permissionhandler.PermissionHandlerPlugin"));
  }
}
