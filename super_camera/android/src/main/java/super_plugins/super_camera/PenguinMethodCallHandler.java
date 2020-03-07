package super_plugins.super_camera;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class PenguinMethodCallHandler implements MethodChannel.MethodCallHandler {
  private final CameraInterface.CameraInstanceFactory factory;

  public PenguinMethodCallHandler(CameraInterface.CameraInstanceFactory factory) {
    assert factory != null;
    this.factory = factory;
  }

  @Override
  public void onMethodCall(MethodCall call, MethodChannel.Result result) {
    switch(call.method) {
      case "CREATE":
        if (call.arguments instanceof CameraInterface.CameraConfigurator) {
          CameraInterface.holders.put(((CameraInterface.CameraConfigurator) call.arguments).referenceId,
              factory.createCameraConfigurator((CameraInterface.CameraConfigurator) call.arguments));
        }
        result.success(null);
        break;
      case "METHODCALL":
        final List<Object> arguments = (List<Object>) call.arguments;
        final String referenceId = ((CameraInterface.MethodChannelReferenceHolder) arguments.get(0)).referenceId;
        final Object caller = CameraInterface.holders.get(referenceId);
        try {
          final List<Object> methodArguments;
          if (arguments.size() > 2) {
            methodArguments = arguments.subList(2, arguments.size() - 1);
          } else {
            methodArguments = new ArrayList<>();
          }
          final Method method = caller.getClass().getMethod((String) arguments.get(1), getClasses(methodArguments));
          method.invoke(caller, methodArguments);
        } catch (NoSuchMethodException e) {
          result.error(null, null, null);
          return;
        } catch (IllegalAccessException e) {
          result.error(null, null, null);
          return;
        } catch (InvocationTargetException e) {
          result.error(null, null, null);
          return;
        }
        break;
    }
  }

  public Class[] getClasses(List<Object> arguments) {
    final Class[] classes = new Class[arguments.size()];
    for (int i = 0; i < arguments.size(); i++) {
      classes[i] = arguments.get(i).getClass();
    }
    return classes;
  }
}
