// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// PenguinGenerator
// **************************************************************************
package super_plugins.super_camera;

import android.content.Context;
import android.os.Build;
import android.view.View;
import androidx.annotation.RequiresApi;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.UUID;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

import android.hardware.Camera;

import android.app.Activity;

import io.flutter.view.TextureRegistry.SurfaceTextureEntry;

import android.graphics.SurfaceTexture;

import io.flutter.view.TextureRegistry;

import androidx.camera.core.CameraX.LensFacing;

import androidx.camera.core.CameraInfo;

import androidx.camera.core.CameraX;

import androidx.lifecycle.LifecycleOwner;

import androidx.camera.core.Preview;

import androidx.camera.core.Preview.OnPreviewOutputUpdateListener;

import androidx.camera.core.Preview.PreviewOutput;

import androidx.camera.core.PreviewConfig;

import 	android.view.TextureView;


public class ChannelGenerated implements MethodCallHandler {
  private class $ViewFactoryGenerated extends PlatformViewFactory {
    $ViewFactoryGenerated() {
      super(StandardMessageCodec.INSTANCE);
    }

    @Override
    public PlatformView create(Context context, int viewId, Object args) {
      return getWrapper((String) args);
    }
  }

  public static abstract class FlutterWrapper implements PlatformView {
    final ChannelGenerated $channelGenerated;
    final String $uniqueId;
    
    private FlutterWrapper(ChannelGenerated $channelGenerated, String $uniqueId) {
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
      $channelGenerated.removeAllocatedWrapper($uniqueId);
    }
    
    @Override
    public View getView() {
      return (View) $getValue();
    }

    @Override
    public void dispose() {
      // Do nothing
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
  private final $ViewFactoryGenerated viewFactory = new $ViewFactoryGenerated();
  private final MethodChannel callbackChannel;
  
  public ChannelGenerated() {
    this.callbackChannel = null;
  }
  
  public ChannelGenerated(MethodChannel callbackChannel) {
    this.callbackChannel = callbackChannel;
  }
  
  public PlatformViewFactory getPlatformViewFactory() {
    return viewFactory;
  }

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
  
  public void addAllocatedWrapper(final String uniqueId, final FlutterWrapper wrapper) {
    addWrapper(uniqueId, wrapper, allocatedWrappers);
  }

  public void removeAllocatedWrapper(String uniqueId) {
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
      result.error(exception.getClass().getSimpleName(), exception.getMessage(), android.util.Log.getStackTraceString(exception));
      exception.printStackTrace();
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
      
      case "CameraCameraInfo()": {
          if (Build.VERSION.SDK_INT >= 16) {
            return CameraCameraInfoWrapper.onStaticMethodCall(this, call);
          } else {
            throw new UnsupportedOperationException("This operation requires api 16 and above");
          }
        }
      
      case "Preview()": {
          if (Build.VERSION.SDK_INT >= 21) {
            return PreviewWrapper.onStaticMethodCall(this, call);
          } else {
            throw new UnsupportedOperationException("This operation requires api 21 and above");
          }
        }
      
      case "OnPreviewOutputUpdateListener()": {
          if (Build.VERSION.SDK_INT >= 21) {
            return OnPreviewOutputUpdateListenerWrapper.onStaticMethodCall(this, call);
          } else {
            throw new UnsupportedOperationException("This operation requires api 21 and above");
          }
        }
      
      case "PreviewConfigBuilder()": {
          if (Build.VERSION.SDK_INT >= 21) {
            return PreviewConfigBuilderWrapper.onStaticMethodCall(this, call);
          } else {
            throw new UnsupportedOperationException("This operation requires api 21 and above");
          }
        }
      
      case "TextureView()": {
          if (Build.VERSION.SDK_INT >= 16) {
            return TextureViewWrapper.onStaticMethodCall(this, call);
          } else {
            throw new UnsupportedOperationException("This operation requires api 16 and above");
          }
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
      
      case "CameraX#bindToLifecycle": {
          return CameraXWrapper.onStaticMethodCall(this, call);
        }
      
      case "CameraX#getCameraInfo": {
          return CameraXWrapper.onStaticMethodCall(this, call);
        }
      
      case "CameraX#unbindAll": {
          return CameraXWrapper.onStaticMethodCall(this, call);
        }
      
      case "LensFacing.BACK": {
          return LensFacingWrapper.onStaticMethodCall(this, call);
        }
      
      case "LensFacing.FRONT": {
          return LensFacingWrapper.onStaticMethodCall(this, call);
        }
      
      default:
        final String $uniqueId = call.argument("$uniqueId");
        if ($uniqueId == null) throw new NoUniqueIdException(call.method);

        final FlutterWrapper wrapper = getWrapper($uniqueId);
        if (wrapper == null) throw new WrapperNotFoundException($uniqueId);

        return wrapper.onMethodCall(call);
    }
  }

  
  
  public static class CameraWrapper extends FlutterWrapper {
    private final Camera $value;

    public CameraWrapper(ChannelGenerated $channelGenerated, String $uniqueId, Camera $value) {
      super($channelGenerated, $uniqueId);
      this.$value = $value;
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }

    private CameraWrapper(final ChannelGenerated $channelGenerated, final String $uniqueId, final MethodCall call) {
      super($channelGenerated, $uniqueId);
      switch(call.method) {
        
        default:
          this.$value = null;
      }
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
          call.argument("cameraInfo") != null ? ((CameraCameraInfoWrapper) $channelGenerated.getWrapper((String) call.argument("cameraInfo"))).$value : null
          
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
  
  
  public static class CameraCameraInfoWrapper extends FlutterWrapper {
    private final Camera.CameraInfo $value;

    public CameraCameraInfoWrapper(ChannelGenerated $channelGenerated, String $uniqueId, Camera.CameraInfo $value) {
      super($channelGenerated, $uniqueId);
      this.$value = $value;
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }

    private CameraCameraInfoWrapper(final ChannelGenerated $channelGenerated, final String $uniqueId, final MethodCall call) {
      super($channelGenerated, $uniqueId);
      switch(call.method) {
        
        case "CameraCameraInfo()":
          this.$value = new Camera.CameraInfo(
          
          ) ;
          break; 
        
        default:
          this.$value = null;
      }
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }
    
    static Object onStaticMethodCall(ChannelGenerated $channelGenerated, MethodCall call) throws Exception {
      switch(call.method) {
        
        case "CameraCameraInfo()": {
            new CameraCameraInfoWrapper($channelGenerated, (String) call.argument("$uniqueId"), call);
            return null;
          }
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(MethodCall call) throws Exception {
      switch(call.method) {
        case "Camera.CameraInfo#allocate":
          allocate();
          return null;
        case "Camera.CameraInfo#deallocate":
          deallocate();
          return null;
        
        case "CameraCameraInfo.facing":
          return facing(call);
        
        case "CameraCameraInfo.orientation":
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
  
  
  public static class ActivityWrapper extends FlutterWrapper {
    private final Activity $value;

    public ActivityWrapper(ChannelGenerated $channelGenerated, String $uniqueId, Activity $value) {
      super($channelGenerated, $uniqueId);
      this.$value = $value;
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }

    private ActivityWrapper(final ChannelGenerated $channelGenerated, final String $uniqueId, final MethodCall call) {
      super($channelGenerated, $uniqueId);
      switch(call.method) {
        
        default:
          this.$value = null;
      }
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
        case "Activity#allocate":
          allocate();
          return null;
        case "Activity#deallocate":
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
  
  
  public static class SurfaceTextureEntryWrapper extends FlutterWrapper {
    private final SurfaceTextureEntry $value;

    public SurfaceTextureEntryWrapper(ChannelGenerated $channelGenerated, String $uniqueId, SurfaceTextureEntry $value) {
      super($channelGenerated, $uniqueId);
      this.$value = $value;
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }

    private SurfaceTextureEntryWrapper(final ChannelGenerated $channelGenerated, final String $uniqueId, final MethodCall call) {
      super($channelGenerated, $uniqueId);
      switch(call.method) {
        
        default:
          this.$value = null;
      }
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
  
  
  public static class SurfaceTextureWrapper extends FlutterWrapper {
    private final SurfaceTexture $value;

    public SurfaceTextureWrapper(ChannelGenerated $channelGenerated, String $uniqueId, SurfaceTexture $value) {
      super($channelGenerated, $uniqueId);
      this.$value = $value;
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }

    private SurfaceTextureWrapper(final ChannelGenerated $channelGenerated, final String $uniqueId, final MethodCall call) {
      super($channelGenerated, $uniqueId);
      switch(call.method) {
        
        default:
          this.$value = null;
      }
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
  
  
  public static class TextureRegistryWrapper extends FlutterWrapper {
    private final TextureRegistry $value;

    public TextureRegistryWrapper(ChannelGenerated $channelGenerated, String $uniqueId, TextureRegistry $value) {
      super($channelGenerated, $uniqueId);
      this.$value = $value;
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }

    private TextureRegistryWrapper(final ChannelGenerated $channelGenerated, final String $uniqueId, final MethodCall call) {
      super($channelGenerated, $uniqueId);
      switch(call.method) {
        
        default:
          this.$value = null;
      }
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
        case "TextureRegistry#allocate":
          allocate();
          return null;
        case "TextureRegistry#deallocate":
          deallocate();
          return null;
        
        case "TextureRegistry#createSurfaceTexture":
          return createSurfaceTexture(call);
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    

    
     Object createSurfaceTexture( MethodCall call) throws Exception {
      
      new SurfaceTextureEntryWrapper($channelGenerated, (String) call.argument("$newUniqueId"),
      
      
      $value.createSurfaceTexture(
      
      )
      
      );
      return null;
      
    }
    
  }
  
  @RequiresApi(api = 21)
  public static class LensFacingWrapper extends FlutterWrapper {
    private final LensFacing $value;

    public LensFacingWrapper(ChannelGenerated $channelGenerated, String $uniqueId, LensFacing $value) {
      super($channelGenerated, $uniqueId);
      this.$value = $value;
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }

    private LensFacingWrapper(final ChannelGenerated $channelGenerated, final String $uniqueId, final MethodCall call) {
      super($channelGenerated, $uniqueId);
      switch(call.method) {
        
        default:
          this.$value = null;
      }
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }
    
    static Object onStaticMethodCall(ChannelGenerated $channelGenerated, MethodCall call) throws Exception {
      switch(call.method) {
        
        case "LensFacing.BACK": {
            return LensFacingWrapper.BACK($channelGenerated, call);
          }
        
        case "LensFacing.FRONT": {
            return LensFacingWrapper.FRONT($channelGenerated, call);
          }
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(MethodCall call) throws Exception {
      switch(call.method) {
        case "LensFacing#allocate":
          allocate();
          return null;
        case "LensFacing#deallocate":
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
    
    
    static private Object BACK(ChannelGenerated $channelGenerated, MethodCall call) throws Exception {
       
      
      
      new LensFacingWrapper($channelGenerated, (String) call.argument("$newUniqueId"), 
      
      LensFacing.BACK
      
      
      );
      return null;
      
    }
    
    static private Object FRONT(ChannelGenerated $channelGenerated, MethodCall call) throws Exception {
       
      
      
      new LensFacingWrapper($channelGenerated, (String) call.argument("$newUniqueId"), 
      
      LensFacing.FRONT
      
      
      );
      return null;
      
    }
    

    
  }
  
  @RequiresApi(api = 21)
  public static class CameraInfoWrapper extends FlutterWrapper {
    private final CameraInfo $value;

    public CameraInfoWrapper(ChannelGenerated $channelGenerated, String $uniqueId, CameraInfo $value) {
      super($channelGenerated, $uniqueId);
      this.$value = $value;
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }

    private CameraInfoWrapper(final ChannelGenerated $channelGenerated, final String $uniqueId, final MethodCall call) {
      super($channelGenerated, $uniqueId);
      switch(call.method) {
        
        default:
          this.$value = null;
      }
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
        case "CameraInfo#allocate":
          allocate();
          return null;
        case "CameraInfo#deallocate":
          deallocate();
          return null;
        
        case "CameraInfo#getSensorRotationDegrees":
          return getSensorRotationDegrees(call);
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    

    
     Object getSensorRotationDegrees( MethodCall call) throws Exception {
      
      return
      
      
      $value.getSensorRotationDegrees(
      
      )
      
      ;
      
    }
    
  }
  
  @RequiresApi(api = 21)
  public static class CameraXWrapper extends FlutterWrapper {
    private final CameraX $value;

    public CameraXWrapper(ChannelGenerated $channelGenerated, String $uniqueId, CameraX $value) {
      super($channelGenerated, $uniqueId);
      this.$value = $value;
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }

    private CameraXWrapper(final ChannelGenerated $channelGenerated, final String $uniqueId, final MethodCall call) {
      super($channelGenerated, $uniqueId);
      switch(call.method) {
        
        default:
          this.$value = null;
      }
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }
    
    static Object onStaticMethodCall(ChannelGenerated $channelGenerated, MethodCall call) throws Exception {
      switch(call.method) {
        
        case "CameraX#bindToLifecycle": {
            return CameraXWrapper.bindToLifecycle($channelGenerated, call);
          }
        
        case "CameraX#getCameraInfo": {
            return CameraXWrapper.getCameraInfo($channelGenerated, call);
          }
        
        case "CameraX#unbindAll": {
            return CameraXWrapper.unbindAll($channelGenerated, call);
          }
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(MethodCall call) throws Exception {
      switch(call.method) {
        case "CameraX#allocate":
          allocate();
          return null;
        case "CameraX#deallocate":
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
    
    

    
    static Object bindToLifecycle(ChannelGenerated $channelGenerated, MethodCall call) throws Exception {
      
      
      
      CameraX.bindToLifecycle(
      
          call.argument("owner") != null ? ((LifecycleOwnerWrapper) $channelGenerated.getWrapper((String) call.argument("owner"))).$value : null
          ,
          call.argument("preview") != null ? ((PreviewWrapper) $channelGenerated.getWrapper((String) call.argument("preview"))).$value : null
          
      )
      
      ;
      return null;
      
    }
    
    static Object getCameraInfo(ChannelGenerated $channelGenerated, MethodCall call) throws Exception {
      
      new CameraInfoWrapper($channelGenerated, (String) call.argument("$newUniqueId"),
      
      
      CameraX.getCameraInfo(
      
          call.argument("lensFacing") != null ? ((LensFacingWrapper) $channelGenerated.getWrapper((String) call.argument("lensFacing"))).$value : null
          
      )
      
      );
      return null;
      
    }
    
    static Object unbindAll(ChannelGenerated $channelGenerated, MethodCall call) throws Exception {
      
      
      
      CameraX.unbindAll(
      
      )
      
      ;
      return null;
      
    }
    
  }
  
  
  public static class LifecycleOwnerWrapper extends FlutterWrapper {
    private final LifecycleOwner $value;

    public LifecycleOwnerWrapper(ChannelGenerated $channelGenerated, String $uniqueId, LifecycleOwner $value) {
      super($channelGenerated, $uniqueId);
      this.$value = $value;
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }

    private LifecycleOwnerWrapper(final ChannelGenerated $channelGenerated, final String $uniqueId, final MethodCall call) {
      super($channelGenerated, $uniqueId);
      switch(call.method) {
        
        default:
          this.$value = null;
      }
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
        case "LifecycleOwner#allocate":
          allocate();
          return null;
        case "LifecycleOwner#deallocate":
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
  
  @RequiresApi(api = 21)
  public static class PreviewWrapper extends FlutterWrapper {
    private final Preview $value;

    public PreviewWrapper(ChannelGenerated $channelGenerated, String $uniqueId, Preview $value) {
      super($channelGenerated, $uniqueId);
      this.$value = $value;
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }

    private PreviewWrapper(final ChannelGenerated $channelGenerated, final String $uniqueId, final MethodCall call) {
      super($channelGenerated, $uniqueId);
      switch(call.method) {
        
        case "Preview()":
          this.$value = new Preview(
          
          call.argument("previewConfig") != null ? ((PreviewConfigWrapper) $channelGenerated.getWrapper((String) call.argument("previewConfig"))).$value : null
          
          ) ;
          break; 
        
        default:
          this.$value = null;
      }
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }
    
    static Object onStaticMethodCall(ChannelGenerated $channelGenerated, MethodCall call) throws Exception {
      switch(call.method) {
        
        case "Preview()": {
            new PreviewWrapper($channelGenerated, (String) call.argument("$uniqueId"), call);
            return null;
          }
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(MethodCall call) throws Exception {
      switch(call.method) {
        case "Preview#allocate":
          allocate();
          return null;
        case "Preview#deallocate":
          deallocate();
          return null;
        
        case "Preview#setOnPreviewOutputUpdateListener":
          return setOnPreviewOutputUpdateListener(call);
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    

    
     Object setOnPreviewOutputUpdateListener( MethodCall call) throws Exception {
      
      
      
      $value.setOnPreviewOutputUpdateListener(
      
          call.argument("listener") != null ? ((OnPreviewOutputUpdateListenerWrapper) $channelGenerated.getWrapper((String) call.argument("listener"))).$value : null
          
      )
      
      ;
      return null;
      
    }
    
  }
  
  @RequiresApi(api = 21)
  public static class OnPreviewOutputUpdateListenerWrapper extends FlutterWrapper {
    private final OnPreviewOutputUpdateListener $value;

    public OnPreviewOutputUpdateListenerWrapper(ChannelGenerated $channelGenerated, String $uniqueId, OnPreviewOutputUpdateListener $value) {
      super($channelGenerated, $uniqueId);
      this.$value = $value;
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }

    private OnPreviewOutputUpdateListenerWrapper(final ChannelGenerated $channelGenerated, final String $uniqueId, final MethodCall call) {
      super($channelGenerated, $uniqueId);
      switch(call.method) {
        
        case "OnPreviewOutputUpdateListener()":
          this.$value = new OnPreviewOutputUpdateListener(
          
          ) {
            
            @Override
            public void onUpdated(
            
            PreviewOutput previewOutput
            
            ) {
              final HashMap<String, Object> $arguments = new HashMap<>();
              $arguments.put("$uniqueId", $uniqueId);

              
              final String $previewOutputId = UUID.randomUUID().toString();
              $channelGenerated.addAllocatedWrapper($previewOutputId, new PreviewOutputWrapper($channelGenerated, $previewOutputId, previewOutput));
              $arguments.put("previewOutput", $previewOutputId);
              
              
              $channelGenerated.callbackChannel.invokeMethod("OnPreviewOutputUpdateListener#onUpdated", $arguments, new Result() {
                @Override
                public void success(Object result) {
                  try {
                    $channelGenerated.onMethodCall(new MethodCall("MultiInvoke", result));
                  } catch (Exception exception) {
                    exception.printStackTrace();
                  }
                }

                @Override
                public void error(String errorCode, String errorMessage, Object errorDetails) {
                  throw new RuntimeException(errorMessage);
                }

                @Override
                public void notImplemented() {
                  throw new RuntimeException();
                }
              });  
            }
            
          };
          break; 
        
        default:
          this.$value = null;
      }
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }
    
    static Object onStaticMethodCall(ChannelGenerated $channelGenerated, MethodCall call) throws Exception {
      switch(call.method) {
        
        case "OnPreviewOutputUpdateListener()": {
            new OnPreviewOutputUpdateListenerWrapper($channelGenerated, (String) call.argument("$uniqueId"), call);
            return null;
          }
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(MethodCall call) throws Exception {
      switch(call.method) {
        case "OnPreviewOutputUpdateListener#allocate":
          allocate();
          return null;
        case "OnPreviewOutputUpdateListener#deallocate":
          deallocate();
          return null;
        
        case "OnPreviewOutputUpdateListener#onUpdated":
          return onUpdated(call);
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    

    
     Object onUpdated( MethodCall call) throws Exception {
      
      
      
      $value.onUpdated(
      
          call.argument("previewOutput") != null ? ((PreviewOutputWrapper) $channelGenerated.getWrapper((String) call.argument("previewOutput"))).$value : null
          
      )
      
      ;
      return null;
      
    }
    
  }
  
  @RequiresApi(api = 21)
  public static class PreviewOutputWrapper extends FlutterWrapper {
    private final PreviewOutput $value;

    public PreviewOutputWrapper(ChannelGenerated $channelGenerated, String $uniqueId, PreviewOutput $value) {
      super($channelGenerated, $uniqueId);
      this.$value = $value;
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }

    private PreviewOutputWrapper(final ChannelGenerated $channelGenerated, final String $uniqueId, final MethodCall call) {
      super($channelGenerated, $uniqueId);
      switch(call.method) {
        
        default:
          this.$value = null;
      }
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
        case "PreviewOutput#allocate":
          allocate();
          return null;
        case "PreviewOutput#deallocate":
          deallocate();
          return null;
        
        case "PreviewOutput#getSurfaceTexture":
          return getSurfaceTexture(call);
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    

    
     Object getSurfaceTexture( MethodCall call) throws Exception {
      
      new SurfaceTextureWrapper($channelGenerated, (String) call.argument("$newUniqueId"),
      
      
      $value.getSurfaceTexture(
      
      )
      
      );
      return null;
      
    }
    
  }
  
  @RequiresApi(api = 21)
  public static class PreviewConfigWrapper extends FlutterWrapper {
    private final PreviewConfig $value;

    public PreviewConfigWrapper(ChannelGenerated $channelGenerated, String $uniqueId, PreviewConfig $value) {
      super($channelGenerated, $uniqueId);
      this.$value = $value;
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }

    private PreviewConfigWrapper(final ChannelGenerated $channelGenerated, final String $uniqueId, final MethodCall call) {
      super($channelGenerated, $uniqueId);
      switch(call.method) {
        
        default:
          this.$value = null;
      }
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
        case "PreviewConfig#allocate":
          allocate();
          return null;
        case "PreviewConfig#deallocate":
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
  
  @RequiresApi(api = 21)
  public static class PreviewConfigBuilderWrapper extends FlutterWrapper {
    private final PreviewConfig.Builder $value;

    public PreviewConfigBuilderWrapper(ChannelGenerated $channelGenerated, String $uniqueId, PreviewConfig.Builder $value) {
      super($channelGenerated, $uniqueId);
      this.$value = $value;
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }

    private PreviewConfigBuilderWrapper(final ChannelGenerated $channelGenerated, final String $uniqueId, final MethodCall call) {
      super($channelGenerated, $uniqueId);
      switch(call.method) {
        
        case "PreviewConfigBuilder()":
          this.$value = new PreviewConfig.Builder(
          
          ) ;
          break; 
        
        default:
          this.$value = null;
      }
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }
    
    static Object onStaticMethodCall(ChannelGenerated $channelGenerated, MethodCall call) throws Exception {
      switch(call.method) {
        
        case "PreviewConfigBuilder()": {
            new PreviewConfigBuilderWrapper($channelGenerated, (String) call.argument("$uniqueId"), call);
            return null;
          }
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(MethodCall call) throws Exception {
      switch(call.method) {
        case "PreviewConfig.Builder#allocate":
          allocate();
          return null;
        case "PreviewConfig.Builder#deallocate":
          deallocate();
          return null;
        
        case "PreviewConfigBuilder#setLensFacing":
          return setLensFacing(call);
        
        case "PreviewConfigBuilder#build":
          return build(call);
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    

    
     Object setLensFacing( MethodCall call) throws Exception {
      
      
      
      $value.setLensFacing(
      
          call.argument("lensFacing") != null ? ((LensFacingWrapper) $channelGenerated.getWrapper((String) call.argument("lensFacing"))).$value : null
          
      )
      
      ;
      return null;
      
    }
    
     Object build( MethodCall call) throws Exception {
      
      new PreviewConfigWrapper($channelGenerated, (String) call.argument("$newUniqueId"),
      
      
      $value.build(
      
      )
      
      );
      return null;
      
    }
    
  }
  
  
  public static class TextureViewWrapper extends FlutterWrapper {
    private final TextureView $value;

    public TextureViewWrapper(ChannelGenerated $channelGenerated, String $uniqueId, TextureView $value) {
      super($channelGenerated, $uniqueId);
      this.$value = $value;
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }

    private TextureViewWrapper(final ChannelGenerated $channelGenerated, final String $uniqueId, final MethodCall call) {
      super($channelGenerated, $uniqueId);
      switch(call.method) {
        
        case "TextureView()":
          this.$value = new TextureView(
          
          call.argument("activity") != null ? ((ActivityWrapper) $channelGenerated.getWrapper((String) call.argument("activity"))).$value : null
          
          ) ;
          break; 
        
        default:
          this.$value = null;
      }
      $channelGenerated.addWrapper($uniqueId, this, $channelGenerated.tempWrappers);
    }
    
    static Object onStaticMethodCall(ChannelGenerated $channelGenerated, MethodCall call) throws Exception {
      switch(call.method) {
        
        case "TextureView()": {
            new TextureViewWrapper($channelGenerated, (String) call.argument("$uniqueId"), call);
            return null;
          }
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(MethodCall call) throws Exception {
      switch(call.method) {
        case "TextureView#allocate":
          allocate();
          return null;
        case "TextureView#deallocate":
          deallocate();
          return null;
        
        case "TextureView#setSurfaceTexture":
          return setSurfaceTexture(call);
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    

    
     Object setSurfaceTexture( MethodCall call) throws Exception {
      
      
      
      $value.setSurfaceTexture(
      
          call.argument("surfaceTexture") != null ? ((SurfaceTextureWrapper) $channelGenerated.getWrapper((String) call.argument("surfaceTexture"))).$value : null
          
      )
      
      ;
      return null;
      
    }
    
  }
  
}
