// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// PenguinGenerator
// **************************************************************************
package super_plugins.super_camera;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import android.hardware.Camera;

import android.hardware.Camera.CameraInfo;


public class ChannelGenerated implements MethodCallHandler {
  private static abstract class FlutterWrapper {
    final ChannelGenerated $channelGenerated;
    final String $uniqueId;
    
    FlutterWrapper(ChannelGenerated $channelGenerated, String $uniqueId) {
      this.$channelGenerated = $channelGenerated;
      this.$uniqueId = $uniqueId;
    }

    abstract Object onMethodCall(MethodCall call) throws NotImplementedException;
    abstract Object $getValue();

    void allocate() {
      if ($channelGenerated.isAllocated($uniqueId)) return;
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.allocatedWrappers);
    }

    void deallocate() {
      $channelGenerated.removeWrapper($uniqueId);
    }
  }

  private static class NotImplementedException extends Exception {
    NotImplementedException(String method) {
      super(String.format(Locale.getDefault(),"No implementation for %s.", method));
    }
  }

  private static class NoUniqueIdException extends Exception {
    NoUniqueIdException(String method) {
      super(String.format("MethodCall was made without a unique handle for %s.", method));
    }
  }

  private static class WrapperNotFoundException extends Exception {
    WrapperNotFoundException(String uniqueId) {
      super(String.format("Could not find FlutterWrapper with uniqueId %s.", uniqueId));
    }
  }

  private final HashMap<String, FlutterWrapper> allocatedWrappers = new HashMap<>();
  private final HashMap<String, FlutterWrapper> tempWrappers = new HashMap<>();

  private void addWrapper(
      final String uniqueId, final FlutterWrapper wrapper, HashMap<String, FlutterWrapper> wrapperMap) {
    if (wrapperMap.get(uniqueId) != null) {
      final String message = String.format("Object for uniqueId already exists: %s", uniqueId);
      throw new IllegalArgumentException(message);
    }
    wrapperMap.put(uniqueId, wrapper);
  }

  private void removeWrapper(String uniqueId) {
    allocatedWrappers.remove(uniqueId);
  }

  private Boolean isAllocated(final String uniqueId) {
    return allocatedWrappers.containsKey(uniqueId);
  }

  private FlutterWrapper getWrapper(String uniqueId) {
    final FlutterWrapper wrapper = allocatedWrappers.get(uniqueId);
    if (wrapper != null) return wrapper;
    return tempWrappers.get(uniqueId);
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    try {
      final Object value = onMethodCall(call);
      result.success(value);
    } catch (WrapperNotFoundException exception) {
      result.error(exception.getClass().getSimpleName(), exception.getMessage(), null);
    } catch (NoUniqueIdException exception) {
      result.error(exception.getClass().getSimpleName(), exception.getMessage(), null);
    } catch (NotImplementedException exception) {
      result.error(exception.getClass().getSimpleName(), exception.getMessage(), null);
    } finally {
      tempWrappers.clear();
    }
  }

  private Object onMethodCall(MethodCall call) throws NoUniqueIdException, WrapperNotFoundException, NotImplementedException {
    switch(call.method) {
      case "MultiInvoke":
        final ArrayList<HashMap<String, Object>> allMethodCallData = (ArrayList<HashMap<String, Object>>) call.arguments;
        final ArrayList<Object> resultData = new ArrayList<>(allMethodCallData.size());
        for(HashMap<String, Object> methodCallData : allMethodCallData) {
          final String method = (String) methodCallData.get("method");
          final HashMap<String, Object> arguments = (HashMap<String, Object>) methodCallData.get("arguments");
          final MethodCall methodCall = new MethodCall(method, arguments);
          resultData.add(onMethodCall(methodCall));
        }
        return resultData;
      
      case "CameraInfo()": {
          return CameraInfoWrapper.onStaticMethodCall(this, call);
        }
      
      case "Camera#getNumberOfCameras": {
          return CameraWrapper.onStaticMethodCall(this, call);
        }
      
      case "Camera#open": {
          return CameraWrapper.onStaticMethodCall(this, call);
        }
      
      case "Camera#getCameraInfo": {
          return CameraWrapper.onStaticMethodCall(this, call);
        }
      
      default:
        final String $uniqueId = call.argument("$uniqueId");
        if ($uniqueId == null) throw new NoUniqueIdException(call.method);

        final FlutterWrapper wrapper = getWrapper($uniqueId);
        if (wrapper == null) throw new WrapperNotFoundException($uniqueId);

        return wrapper.onMethodCall(call);
    }
  }

  
  private static class CameraWrapper extends FlutterWrapper {
    private final Camera $value;

    public CameraWrapper(ChannelGenerated $channelGenerated, String $uniqueId, Camera $value) {
      super($channelGenerated, $uniqueId);
      this.$value = $value;
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }

    
    
    static Object onStaticMethodCall(ChannelGenerated $channelGenerated, MethodCall call) throws NotImplementedException {
      switch(call.method) {
        
        case "Camera#getNumberOfCameras": {
            return CameraWrapper.getNumberOfCameras($channelGenerated, call);
          }
        
        case "Camera#open": {
            return CameraWrapper.open($channelGenerated, call);
          }
        
        case "Camera#getCameraInfo": {
            return CameraWrapper.getCameraInfo($channelGenerated, call);
          }
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(MethodCall call) throws NotImplementedException {
      switch(call.method) {
        case "Camera#allocate":
          allocate();
          return null;
        case "Camera#deallocate":
          deallocate();
          return null;
        
        case "Camera#release":
          return release(call);
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    

    
    static Object getNumberOfCameras(ChannelGenerated $channelGenerated, MethodCall call) {
      
      return
      
      
      Camera.getNumberOfCameras(
      
      )
      
      ;
      
    }
    
    static Object open(ChannelGenerated $channelGenerated, MethodCall call) {
      
      new CameraWrapper($channelGenerated, (String) call.argument("$newUniqueId"),
      
      
      Camera.open(
      
      call.argument("cameraId") != null ? (Integer) call.argument("cameraId") : null
      
      )
      
      );
      return null;
      
    }
    
    static Object getCameraInfo(ChannelGenerated $channelGenerated, MethodCall call) {
      
      
      
      Camera.getCameraInfo(
      
      call.argument("cameraId") != null ? (Integer) call.argument("cameraId") : null
      ,
      call.argument("cameraInfo") != null ? ((CameraInfoWrapper) $channelGenerated.getWrapper((String) call.argument("cameraInfo"))).$value : null
      
      )
      
      ;
      return null;
      
    }
    
     Object release( MethodCall call) {
      
      
      
      $value.release(
      
      )
      
      ;
      return null;
      
    }
    
  }
  
  private static class CameraInfoWrapper extends FlutterWrapper {
    private final CameraInfo $value;

    public CameraInfoWrapper(ChannelGenerated $channelGenerated, String $uniqueId, CameraInfo $value) {
      super($channelGenerated, $uniqueId);
      this.$value = $value;
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }

    
    private CameraInfoWrapper(ChannelGenerated $channelGenerated, final String $uniqueId) {
      super($channelGenerated, $uniqueId);
      this.$value = new CameraInfo();
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }
    
    
    static Object onStaticMethodCall(ChannelGenerated $channelGenerated, MethodCall call) throws NotImplementedException {
      switch(call.method) {
        
        case "CameraInfo()": {
            new CameraInfoWrapper($channelGenerated, (String) call.argument("$uniqueId"));
            return null;
          }
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(MethodCall call) throws NotImplementedException {
      switch(call.method) {
        case "CameraInfo#allocate":
          allocate();
          return null;
        case "CameraInfo#deallocate":
          deallocate();
          return null;
        
        case "CameraInfo.facing":
          return facing(call);
        
        case "CameraInfo.orientation":
          return orientation(call);
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    
     private Object facing( MethodCall call) {
      if (call.argument("facing") != null) {
        $value.facing =
        
        call.argument("facing") != null ? (Integer) call.argument("facing") : null;
        
      } 
      
      
      return
      
      $value.facing
      
      
      ;
      
    }
    
     private Object orientation( MethodCall call) {
      if (call.argument("orientation") != null) {
        $value.orientation =
        
        call.argument("orientation") != null ? (Integer) call.argument("orientation") : null;
        
      } 
      
      
      return
      
      $value.orientation
      
      
      ;
      
    }
    

    
  }
  
}
