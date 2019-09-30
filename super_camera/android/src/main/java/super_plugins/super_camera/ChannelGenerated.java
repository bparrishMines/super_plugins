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

import io.flutter.view.TextureRegistry.SurfaceTextureEntry;

import android.graphics.SurfaceTexture;


public class ChannelGenerated implements MethodCallHandler {
  private static abstract class FlutterWrapper {
    final ChannelGenerated $channelGenerated;
    final String $uniqueId;
    
    FlutterWrapper(ChannelGenerated $channelGenerated, String $uniqueId) {
      this.$channelGenerated = $channelGenerated;
      this.$uniqueId = $uniqueId;
    }

    abstract Object onMethodCall(MethodCall call) throws Exception;
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
      final String uniqueId,
      final FlutterWrapper wrapper,
      HashMap<String, FlutterWrapper> wrapperMap) {
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
    } catch (Exception exception) {
      result.error(exception.getClass().getSimpleName(), exception.getMessage(), null);
    } finally {
      tempWrappers.clear();
    }
  }

  private Object onMethodCall(MethodCall call) throws Exception {
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
      
      case "SuperCameraPlugin#getSurfaceTextureEntry": {
          return SuperCameraPluginWrapper.onStaticMethodCall(this, call);
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

    
    
    static Object onStaticMethodCall(ChannelGenerated $channelGenerated, MethodCall call) throws Exception {
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
    public Object onMethodCall(MethodCall call) throws Exception {
      switch(call.method) {
        case "Camera#allocate":
          allocate();
          return null;
        case "Camera#deallocate":
          deallocate();
          return null;
        
        case "Camera#release":
          return release(call);
        
        case "Camera#startPreview":
          return startPreview(call);
        
        case "Camera#stopPreview":
          return stopPreview(call);
        
        case "Camera#setPreviewTexture":
          return setPreviewTexture(call);
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    

    
    static Object getNumberOfCameras(ChannelGenerated $channelGenerated, MethodCall call) throws Exception {
      
      return
      
      
      Camera.getNumberOfCameras(
      
      )
      
      ;
      
    }
    
    static Object open(ChannelGenerated $channelGenerated, MethodCall call) throws Exception {
      
      new CameraWrapper($channelGenerated, (String) call.argument("$newUniqueId"),
      
      
      Camera.open(
      
      call.argument("cameraId") != null ? (Integer) call.argument("cameraId") : null
      
      )
      
      );
      return null;
      
    }
    
    static Object getCameraInfo(ChannelGenerated $channelGenerated, MethodCall call) throws Exception {
      
      
      
      Camera.getCameraInfo(
      
      call.argument("cameraId") != null ? (Integer) call.argument("cameraId") : null
      ,
      call.argument("cameraInfo") != null ? ((CameraInfoWrapper) $channelGenerated.getWrapper((String) call.argument("cameraInfo"))).$value : null
      
      )
      
      ;
      return null;
      
    }
    
     Object release( MethodCall call) throws Exception {
      
      
      
      $value.release(
      
      )
      
      ;
      return null;
      
    }
    
     Object startPreview( MethodCall call) throws Exception {
      
      
      
      $value.startPreview(
      
      )
      
      ;
      return null;
      
    }
    
     Object stopPreview( MethodCall call) throws Exception {
      
      
      
      $value.stopPreview(
      
      )
      
      ;
      return null;
      
    }
    
     Object setPreviewTexture( MethodCall call) throws Exception {
      
      
      
      $value.setPreviewTexture(
      
      call.argument("surfaceTexture") != null ? ((SurfaceTextureWrapper) $channelGenerated.getWrapper((String) call.argument("surfaceTexture"))).$value : null
      
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
    
    
    static Object onStaticMethodCall(ChannelGenerated $channelGenerated, MethodCall call) throws Exception {
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
    public Object onMethodCall(MethodCall call) throws Exception {
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
    
    
     private Object facing( MethodCall call) throws Exception {
      if (call.argument("facing") != null) {
        $value.facing =
        
        call.argument("facing") != null ? (Integer) call.argument("facing") : null;
        
      } 
      
      
      return
      
      $value.facing
      
      
      ;
      
    }
    
     private Object orientation( MethodCall call) throws Exception {
      if (call.argument("orientation") != null) {
        $value.orientation =
        
        call.argument("orientation") != null ? (Integer) call.argument("orientation") : null;
        
      } 
      
      
      return
      
      $value.orientation
      
      
      ;
      
    }
    

    
  }
  
  private static class SuperCameraPluginWrapper extends FlutterWrapper {
    private final SuperCameraPlugin $value;

    public SuperCameraPluginWrapper(ChannelGenerated $channelGenerated, String $uniqueId, SuperCameraPlugin $value) {
      super($channelGenerated, $uniqueId);
      this.$value = $value;
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }

    
    
    static Object onStaticMethodCall(ChannelGenerated $channelGenerated, MethodCall call) throws Exception {
      switch(call.method) {
        
        case "SuperCameraPlugin#getSurfaceTextureEntry": {
            return SuperCameraPluginWrapper.getSurfaceTextureEntry($channelGenerated, call);
          }
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(MethodCall call) throws Exception {
      switch(call.method) {
        case "SuperCameraPlugin#allocate":
          allocate();
          return null;
        case "SuperCameraPlugin#deallocate":
          deallocate();
          return null;
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    

    
    static Object getSurfaceTextureEntry(ChannelGenerated $channelGenerated, MethodCall call) throws Exception {
      
      new SurfaceTextureEntryWrapper($channelGenerated, (String) call.argument("$newUniqueId"),
      
      
      SuperCameraPlugin.getSurfaceTextureEntry(
      
      )
      
      );
      return null;
      
    }
    
  }
  
  private static class SurfaceTextureEntryWrapper extends FlutterWrapper {
    private final SurfaceTextureEntry $value;

    public SurfaceTextureEntryWrapper(ChannelGenerated $channelGenerated, String $uniqueId, SurfaceTextureEntry $value) {
      super($channelGenerated, $uniqueId);
      this.$value = $value;
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }

    
    
    static Object onStaticMethodCall(ChannelGenerated $channelGenerated, MethodCall call) throws Exception {
      switch(call.method) {
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(MethodCall call) throws Exception {
      switch(call.method) {
        case "SurfaceTextureEntry#allocate":
          allocate();
          return null;
        case "SurfaceTextureEntry#deallocate":
          deallocate();
          return null;
        
        case "SurfaceTextureEntry#id":
          return id(call);
        
        case "SurfaceTextureEntry#release":
          return release(call);
        
        case "SurfaceTextureEntry#surfaceTexture":
          return surfaceTexture(call);
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    

    
     Object id( MethodCall call) throws Exception {
      
      return
      
      
      $value.id(
      
      )
      
      ;
      
    }
    
     Object release( MethodCall call) throws Exception {
      
      
      
      $value.release(
      
      )
      
      ;
      return null;
      
    }
    
     Object surfaceTexture( MethodCall call) throws Exception {
      
      new SurfaceTextureWrapper($channelGenerated, (String) call.argument("$newUniqueId"),
      
      
      $value.surfaceTexture(
      
      )
      
      );
      return null;
      
    }
    
  }
  
  private static class SurfaceTextureWrapper extends FlutterWrapper {
    private final SurfaceTexture $value;

    public SurfaceTextureWrapper(ChannelGenerated $channelGenerated, String $uniqueId, SurfaceTexture $value) {
      super($channelGenerated, $uniqueId);
      this.$value = $value;
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }

    
    
    static Object onStaticMethodCall(ChannelGenerated $channelGenerated, MethodCall call) throws Exception {
      switch(call.method) {
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(MethodCall call) throws Exception {
      switch(call.method) {
        case "SurfaceTexture#allocate":
          allocate();
          return null;
        case "SurfaceTexture#deallocate":
          deallocate();
          return null;
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    

    
  }
  
}
