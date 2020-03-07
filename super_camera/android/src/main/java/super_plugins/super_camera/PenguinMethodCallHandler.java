package super_plugins.super_camera;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import io.flutter.Log;
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
    Log.d("handle", call.method);
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
          final Method method;
          Log.d("handle", caller.getClass().getSimpleName());
          Log.d("handle", "" + methodArguments.size());
          Log.d("handle", "" + arguments.get(1));
//          if (methodArguments.size() == 0) {
//            method = caller.getClass().getMethod((String) arguments.get(1));
//          } else {
            method = caller.getClass().getMethod((String) arguments.get(1), getClasses(methodArguments));
          //}
          Log.d("handle", "caller" + method.getName());
          result.success(method.invoke(caller, methodArguments.toArray()));
        } catch (NoSuchMethodException e) {
          Log.d("handle", "NoSuchMethodException");
          result.error("NoSuchMethodException", e.getMessage(), null);
          return;
        } catch (IllegalAccessException e) {
          Log.d("handle", "IllegalAccessException");
          result.error(null, null, null);
          return;
        } catch (InvocationTargetException e) {
          Log.d("handle", "InvocationTargetException");
          result.error(null, null, null);
          return;
        }
        break;
       default:
         result.notImplemented();
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
