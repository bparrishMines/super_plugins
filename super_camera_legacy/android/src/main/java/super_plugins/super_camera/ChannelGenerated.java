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
import android.view.ViewGroup;
import android.widget.FrameLayout;

import android.hardware.Camera;

import io.flutter.view.TextureRegistry.SurfaceTextureEntry;

import android.graphics.SurfaceTexture;

import io.flutter.view.TextureRegistry;

import androidx.camera.core.UseCase;

import androidx.camera.core.CameraX.LensFacing;

import androidx.camera.core.CameraInfo;

import androidx.camera.core.CameraX;

import androidx.lifecycle.LifecycleOwner;

import androidx.camera.core.Preview;

import androidx.camera.core.Preview.OnPreviewOutputUpdateListener;

import androidx.camera.core.Preview.PreviewOutput;

import androidx.camera.core.PreviewConfig;

import 	android.view.TextureView;

import android.content.Context;


public class ChannelGenerated {
  public final PlatformViewFactory viewFactory = new ViewFactoryImpl();
  public final WrapperManager wrapperManager = new WrapperManager();
  public final MethodCallHandler methodCallHandler = new MethodCallHandlerImpl();
  public final MethodChannel callbackChannel;
  
  public ChannelGenerated(MethodChannel callbackChannel) {
    this.callbackChannel = callbackChannel;
  }
  
  private class ViewFactoryImpl extends PlatformViewFactory {
    ViewFactoryImpl() {
      super(StandardMessageCodec.INSTANCE);
    }

    @Override
    public PlatformView create(final Context context, int viewId, final Object args) {
      final FrameLayout frameLayout = new FrameLayout(context);

      final Wrapper contextWrapper;
      try {
        final Class wrapperClass = Class.forName(String.format("super_plugins.super_camera.ChannelGenerated$$%s", Context.class.getSimpleName()));
        final Constructor constructor = wrapperClass.getConstructor(WrapperManager.class, String.class, Context.class);
        contextWrapper = (Wrapper) constructor.newInstance(wrapperManager, UUID.randomUUID().toString(), context);
      } catch (Exception exception) {
        exception.printStackTrace();
        return null;
      }

      final HashMap<String, Object> arguments = new HashMap<>();
      arguments.put("context", contextWrapper.$uniqueId);
      arguments.put("callbackId", args);

      callbackChannel.invokeMethod("onCreateView", arguments, new Result() {
        @Override
        public void success(Object result) {
          final View view;
          try {
            view = wrapperManager.getWrapper((String) result).getView();
          } catch (WrapperNotFoundException exception) {
            exception.printStackTrace();
            return;
          }
          frameLayout.addView(view,
              new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        }

        @Override
        public void error(String errorCode, String errorMessage, Object errorDetails) {
          throw new RuntimeException(errorMessage);
        }

        @Override
        public void notImplemented() {
          throw new RuntimeException("notImplemented");
        }
      });

      return new PlatformView() {
        @Override
        public View getView() {
          return frameLayout;
        }

        @Override
        public void dispose() {
          contextWrapper.deallocate(wrapperManager);
        }
      };
    }
  }
  
  private class MethodCallHandlerImpl implements MethodCallHandler {
    private MethodCallHandlerImpl() {}
    
    @Override
    public void onMethodCall(MethodCall call, Result result) {
      try {
        final Object value = onMethodCall(call);
        result.success(value);
      } catch (Exception exception) {
        result.error(exception.getClass().getSimpleName(), exception.getMessage(), android.util.Log.getStackTraceString(exception));
      } finally {
        wrapperManager.clearTemporaryWrappers();
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
              new $CameraCameraInfo(this, wrapperManager, callbackChannel, call);
              return null;
            } else {
              throw new UnsupportedOperationException("This operation requires api 16 and above");
            }
          }
        
        case "Preview()": {
            if (Build.VERSION.SDK_INT >= 21) {
              new $Preview(this, wrapperManager, callbackChannel, call);
              return null;
            } else {
              throw new UnsupportedOperationException("This operation requires api 21 and above");
            }
          }
        
        case "OnPreviewOutputUpdateListener()": {
            if (Build.VERSION.SDK_INT >= 21) {
              new $OnPreviewOutputUpdateListener(this, wrapperManager, callbackChannel, call);
              return null;
            } else {
              throw new UnsupportedOperationException("This operation requires api 21 and above");
            }
          }
        
        case "PreviewConfigBuilder()": {
            if (Build.VERSION.SDK_INT >= 21) {
              new $PreviewConfigBuilder(this, wrapperManager, callbackChannel, call);
              return null;
            } else {
              throw new UnsupportedOperationException("This operation requires api 21 and above");
            }
          }
        
        case "TextureView()": {
            if (Build.VERSION.SDK_INT >= 16) {
              new $TextureView(this, wrapperManager, callbackChannel, call);
              return null;
            } else {
              throw new UnsupportedOperationException("This operation requires api 16 and above");
            }
          }
        
        case "Camera#getNumberOfCameras": {
            return $Camera.onStaticMethodCall(wrapperManager, call);
          }
        
        case "Camera#open": {
            return $Camera.onStaticMethodCall(wrapperManager, call);
          }
        
        case "Camera#getCameraInfo": {
            return $Camera.onStaticMethodCall(wrapperManager, call);
          }
        
        case "CameraX#bindToLifecycle": {
            return $CameraX.onStaticMethodCall(wrapperManager, call);
          }
        
        case "CameraX#getCameraInfo": {
            return $CameraX.onStaticMethodCall(wrapperManager, call);
          }
        
        case "CameraX#unbindAll": {
            return $CameraX.onStaticMethodCall(wrapperManager, call);
          }
        
        case "LensFacing.BACK": {
            return $LensFacing.onStaticMethodCall(wrapperManager, call);
          }
        
        case "LensFacing.FRONT": {
            return $LensFacing.onStaticMethodCall(wrapperManager, call);
          }
        
        default:
          final String $uniqueId = call.argument("$uniqueId");
          if ($uniqueId == null) throw new NoUniqueIdException(call.method);
          return wrapperManager.getWrapper($uniqueId).onMethodCall(wrapperManager, call);
      }
    }
  }

  private static abstract class Wrapper implements PlatformView {
    final String $uniqueId;
    
    private Wrapper(WrapperManager wrapperManager, String uniqueId) {
      this.$uniqueId = uniqueId;
      wrapperManager.addAllocatedWrapper(this);
    }

    abstract Object onMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception;
    abstract Object $getValue();

    void allocate(WrapperManager wrapperManager) {
      wrapperManager.addAllocatedWrapper(this);
    }

    void deallocate(WrapperManager wrapperManager) {
      wrapperManager.removeAllocatedWrapper($uniqueId);
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
  
  public class WrapperManager {
    private final HashMap<String, Wrapper> allocatedWrappers = new HashMap<>();
    private final HashMap<String, Wrapper> temporaryWrappers = new HashMap<>();

    private WrapperManager() {
      // Do nothing
    }
    
    public void addAllocatedWrapper(final Wrapper wrapper) {
      addWrapper(wrapper, allocatedWrappers);
    }

    public void removeAllocatedWrapper(String uniqueId) {
      allocatedWrappers.remove(uniqueId);
    }

    private void addTemporaryWrapper(final Wrapper wrapper) {
      addWrapper(wrapper, temporaryWrappers);
    }

    private void addWrapper(final Wrapper wrapper, HashMap<String, Wrapper> wrapperMap) {
      final Wrapper existingWrapper;
      try {
        existingWrapper = getWrapper(wrapper.$uniqueId);
      } catch (WrapperNotFoundException exception) {
        wrapperMap.put(wrapper.$uniqueId, wrapper);
        return;
      }

      if (existingWrapper.$getValue() != wrapper.$getValue()) {
        final String message = String.format("Object for uniqueId already exists: %s", wrapper.$uniqueId);
        throw new IllegalArgumentException(message);
      }
      
      if (!wrapperMap.containsKey(wrapper.$uniqueId)) wrapperMap.put(wrapper.$uniqueId, wrapper);
    }

    private Wrapper getWrapper(String uniqueId) throws WrapperNotFoundException {
      if (allocatedWrappers.containsKey(uniqueId)) return allocatedWrappers.get(uniqueId);
      if (temporaryWrappers.containsKey(uniqueId)) return temporaryWrappers.get(uniqueId);
      throw new WrapperNotFoundException(uniqueId);
    }
    
    private void clearTemporaryWrappers() {
      temporaryWrappers.clear();
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
      super(String.format("Could not find Wrapper with uniqueId %s.", uniqueId));
    }
  }

  
  
  public static class $Camera extends Wrapper {
    private final Camera $value;

    public $Camera(final WrapperManager wrapperManager, final String uniqueId, final Camera value) {
      super(wrapperManager, uniqueId);
      this.$value = value;
    }

    private $Camera(final MethodCallHandlerImpl methodCallHandler, final WrapperManager wrapperManager, final MethodChannel callbackChannel, final MethodCall call) throws Exception {
      super(wrapperManager, (String) call.argument("$uniqueId"));
      switch(call.method) {
        
        default:
          this.$value = null;
      }
    }
    
    static Object onStaticMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        
        case "Camera#getNumberOfCameras": {
            return $Camera.getNumberOfCameras(wrapperManager, call);
          }
        
        case "Camera#open": {
            return $Camera.open(wrapperManager, call);
          }
        
        case "Camera#getCameraInfo": {
            return $Camera.getCameraInfo(wrapperManager, call);
          }
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        case "Camera#allocate":
          allocate(wrapperManager);
          return null;
        case "Camera#deallocate":
          deallocate(wrapperManager);
          return null;
        
        case "Camera#release":
          return release(wrapperManager, call);
        
        case "Camera#startPreview":
          return startPreview(wrapperManager, call);
        
        case "Camera#stopPreview":
          return stopPreview(wrapperManager, call);
        
        case "Camera#setPreviewTexture":
          return setPreviewTexture(wrapperManager, call);
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    

    
    static Object getNumberOfCameras(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      return
      
      
      Camera.getNumberOfCameras(
      
      )
      
      ;
      
    }
    
    static Object open(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      final Camera result =
      
      
      Camera.open(
      
      call.argument("cameraId") != null ? (Integer) call.argument("cameraId") : null
      
      )
      
      ;
      if (result == null) return null;
      return new $Camera(wrapperManager, UUID.randomUUID().toString(), result).$uniqueId;
      
    }
    
    static Object getCameraInfo(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      
      
      Camera.getCameraInfo(
      
      call.argument("cameraId") != null ? (Integer) call.argument("cameraId") : null
      ,
      call.argument("cameraInfo") != null ? (Camera.CameraInfo) wrapperManager.getWrapper((String) call.argument("cameraInfo")).$getValue() : null
      
      )
      
      ;
      return null;
      
    }
    
     Object release(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      
      
      $value.release(
      
      )
      
      ;
      return null;
      
    }
    
     Object startPreview(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      
      
      $value.startPreview(
      
      )
      
      ;
      return null;
      
    }
    
     Object stopPreview(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      
      
      $value.stopPreview(
      
      )
      
      ;
      return null;
      
    }
    
     Object setPreviewTexture(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      
      
      $value.setPreviewTexture(
      
      call.argument("surfaceTexture") != null ? (SurfaceTexture) wrapperManager.getWrapper((String) call.argument("surfaceTexture")).$getValue() : null
      
      )
      
      ;
      return null;
      
    }
    
  }
  
  
  public static class $CameraCameraInfo extends Wrapper {
    private final Camera.CameraInfo $value;

    public $CameraCameraInfo(final WrapperManager wrapperManager, final String uniqueId, final Camera.CameraInfo value) {
      super(wrapperManager, uniqueId);
      this.$value = value;
    }

    private $CameraCameraInfo(final MethodCallHandlerImpl methodCallHandler, final WrapperManager wrapperManager, final MethodChannel callbackChannel, final MethodCall call) throws Exception {
      super(wrapperManager, (String) call.argument("$uniqueId"));
      switch(call.method) {
        
        case "CameraCameraInfo()":
          this.$value = new Camera.CameraInfo(
          
          ) ;
          break; 
        
        default:
          this.$value = null;
      }
    }
    
    static Object onStaticMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        case "CameraCameraInfo#allocate":
          allocate(wrapperManager);
          return null;
        case "CameraCameraInfo#deallocate":
          deallocate(wrapperManager);
          return null;
        
        case "CameraCameraInfo.facing":
          return facing(wrapperManager, call);
        
        case "CameraCameraInfo.orientation":
          return orientation(wrapperManager, call);
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    
     private Object facing(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      
      
      return
      
      
      $value.facing
      
      
      ;
      
    }
    
     private Object orientation(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      
      
      return
      
      
      $value.orientation
      
      
      ;
      
    }
    

    
  }
  
  
  public static class $SurfaceTextureEntry extends Wrapper {
    private final SurfaceTextureEntry $value;

    public $SurfaceTextureEntry(final WrapperManager wrapperManager, final String uniqueId, final SurfaceTextureEntry value) {
      super(wrapperManager, uniqueId);
      this.$value = value;
    }

    private $SurfaceTextureEntry(final MethodCallHandlerImpl methodCallHandler, final WrapperManager wrapperManager, final MethodChannel callbackChannel, final MethodCall call) throws Exception {
      super(wrapperManager, (String) call.argument("$uniqueId"));
      switch(call.method) {
        
        default:
          this.$value = null;
      }
    }
    
    static Object onStaticMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        case "SurfaceTextureEntry#allocate":
          allocate(wrapperManager);
          return null;
        case "SurfaceTextureEntry#deallocate":
          deallocate(wrapperManager);
          return null;
        
        case "SurfaceTextureEntry#id":
          return id(wrapperManager, call);
        
        case "SurfaceTextureEntry#surfaceTexture":
          return surfaceTexture(wrapperManager, call);
        
        case "SurfaceTextureEntry#release":
          return release(wrapperManager, call);
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    

    
     Object id(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      return
      
      
      $value.id(
      
      )
      
      ;
      
    }
    
     Object surfaceTexture(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      final SurfaceTexture result =
      
      
      $value.surfaceTexture(
      
      )
      
      ;
      if (result == null) return null;
      return new $SurfaceTexture(wrapperManager, UUID.randomUUID().toString(), result).$uniqueId;
      
    }
    
     Object release(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      
      
      $value.release(
      
      )
      
      ;
      return null;
      
    }
    
  }
  
  
  public static class $SurfaceTexture extends Wrapper {
    private final SurfaceTexture $value;

    public $SurfaceTexture(final WrapperManager wrapperManager, final String uniqueId, final SurfaceTexture value) {
      super(wrapperManager, uniqueId);
      this.$value = value;
    }

    private $SurfaceTexture(final MethodCallHandlerImpl methodCallHandler, final WrapperManager wrapperManager, final MethodChannel callbackChannel, final MethodCall call) throws Exception {
      super(wrapperManager, (String) call.argument("$uniqueId"));
      switch(call.method) {
        
        default:
          this.$value = null;
      }
    }
    
    static Object onStaticMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        case "SurfaceTexture#allocate":
          allocate(wrapperManager);
          return null;
        case "SurfaceTexture#deallocate":
          deallocate(wrapperManager);
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
  
  
  public static class $TextureRegistry extends Wrapper {
    private final TextureRegistry $value;

    public $TextureRegistry(final WrapperManager wrapperManager, final String uniqueId, final TextureRegistry value) {
      super(wrapperManager, uniqueId);
      this.$value = value;
    }

    private $TextureRegistry(final MethodCallHandlerImpl methodCallHandler, final WrapperManager wrapperManager, final MethodChannel callbackChannel, final MethodCall call) throws Exception {
      super(wrapperManager, (String) call.argument("$uniqueId"));
      switch(call.method) {
        
        default:
          this.$value = null;
      }
    }
    
    static Object onStaticMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        case "TextureRegistry#allocate":
          allocate(wrapperManager);
          return null;
        case "TextureRegistry#deallocate":
          deallocate(wrapperManager);
          return null;
        
        case "TextureRegistry#createSurfaceTexture":
          return createSurfaceTexture(wrapperManager, call);
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    

    
     Object createSurfaceTexture(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      final SurfaceTextureEntry result =
      
      
      $value.createSurfaceTexture(
      
      )
      
      ;
      if (result == null) return null;
      return new $SurfaceTextureEntry(wrapperManager, UUID.randomUUID().toString(), result).$uniqueId;
      
    }
    
  }
  
  @RequiresApi(api = 21)
  public static class $UseCase extends Wrapper {
    private final UseCase $value;

    public $UseCase(final WrapperManager wrapperManager, final String uniqueId, final UseCase value) {
      super(wrapperManager, uniqueId);
      this.$value = value;
    }

    private $UseCase(final MethodCallHandlerImpl methodCallHandler, final WrapperManager wrapperManager, final MethodChannel callbackChannel, final MethodCall call) throws Exception {
      super(wrapperManager, (String) call.argument("$uniqueId"));
      switch(call.method) {
        
        default:
          this.$value = null;
      }
    }
    
    static Object onStaticMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        case "UseCase#allocate":
          allocate(wrapperManager);
          return null;
        case "UseCase#deallocate":
          deallocate(wrapperManager);
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
  public static class $LensFacing extends Wrapper {
    private final LensFacing $value;

    public $LensFacing(final WrapperManager wrapperManager, final String uniqueId, final LensFacing value) {
      super(wrapperManager, uniqueId);
      this.$value = value;
    }

    private $LensFacing(final MethodCallHandlerImpl methodCallHandler, final WrapperManager wrapperManager, final MethodChannel callbackChannel, final MethodCall call) throws Exception {
      super(wrapperManager, (String) call.argument("$uniqueId"));
      switch(call.method) {
        
        default:
          this.$value = null;
      }
    }
    
    static Object onStaticMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        
        case "LensFacing.BACK": {
            return $LensFacing.BACK(wrapperManager, call);
          }
        
        case "LensFacing.FRONT": {
            return $LensFacing.FRONT(wrapperManager, call);
          }
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        case "LensFacing#allocate":
          allocate(wrapperManager);
          return null;
        case "LensFacing#deallocate":
          deallocate(wrapperManager);
          return null;
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    
    static private Object BACK(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      
      
      final LensFacing result =
      
      
      LensFacing.BACK
      
      
      ;
      if (result == null) return null;
      return new $LensFacing(wrapperManager, UUID.randomUUID().toString(), result).$uniqueId;
      
    }
    
    static private Object FRONT(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      
      
      final LensFacing result =
      
      
      LensFacing.FRONT
      
      
      ;
      if (result == null) return null;
      return new $LensFacing(wrapperManager, UUID.randomUUID().toString(), result).$uniqueId;
      
    }
    

    
  }
  
  @RequiresApi(api = 21)
  public static class $CameraInfo extends Wrapper {
    private final CameraInfo $value;

    public $CameraInfo(final WrapperManager wrapperManager, final String uniqueId, final CameraInfo value) {
      super(wrapperManager, uniqueId);
      this.$value = value;
    }

    private $CameraInfo(final MethodCallHandlerImpl methodCallHandler, final WrapperManager wrapperManager, final MethodChannel callbackChannel, final MethodCall call) throws Exception {
      super(wrapperManager, (String) call.argument("$uniqueId"));
      switch(call.method) {
        
        default:
          this.$value = null;
      }
    }
    
    static Object onStaticMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        case "CameraInfo#allocate":
          allocate(wrapperManager);
          return null;
        case "CameraInfo#deallocate":
          deallocate(wrapperManager);
          return null;
        
        case "CameraInfo#getSensorRotationDegrees":
          return getSensorRotationDegrees(wrapperManager, call);
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    

    
     Object getSensorRotationDegrees(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      return
      
      
      $value.getSensorRotationDegrees(
      
      )
      
      ;
      
    }
    
  }
  
  @RequiresApi(api = 21)
  public static class $CameraX extends Wrapper {
    private final CameraX $value;

    public $CameraX(final WrapperManager wrapperManager, final String uniqueId, final CameraX value) {
      super(wrapperManager, uniqueId);
      this.$value = value;
    }

    private $CameraX(final MethodCallHandlerImpl methodCallHandler, final WrapperManager wrapperManager, final MethodChannel callbackChannel, final MethodCall call) throws Exception {
      super(wrapperManager, (String) call.argument("$uniqueId"));
      switch(call.method) {
        
        default:
          this.$value = null;
      }
    }
    
    static Object onStaticMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        
        case "CameraX#bindToLifecycle": {
            return $CameraX.bindToLifecycle(wrapperManager, call);
          }
        
        case "CameraX#getCameraInfo": {
            return $CameraX.getCameraInfo(wrapperManager, call);
          }
        
        case "CameraX#unbindAll": {
            return $CameraX.unbindAll(wrapperManager, call);
          }
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        case "CameraX#allocate":
          allocate(wrapperManager);
          return null;
        case "CameraX#deallocate":
          deallocate(wrapperManager);
          return null;
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    

    
    static Object bindToLifecycle(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      
      
      CameraX.bindToLifecycle(
      
      call.argument("owner") != null ? (LifecycleOwner) wrapperManager.getWrapper((String) call.argument("owner")).$getValue() : null
      ,
      call.argument("useCase") != null ? (UseCase) wrapperManager.getWrapper((String) call.argument("useCase")).$getValue() : null
      
      )
      
      ;
      return null;
      
    }
    
    static Object getCameraInfo(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      final CameraInfo result =
      
      
      CameraX.getCameraInfo(
      
      call.argument("lensFacing") != null ? (LensFacing) wrapperManager.getWrapper((String) call.argument("lensFacing")).$getValue() : null
      
      )
      
      ;
      if (result == null) return null;
      return new $CameraInfo(wrapperManager, UUID.randomUUID().toString(), result).$uniqueId;
      
    }
    
    static Object unbindAll(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      
      
      CameraX.unbindAll(
      
      )
      
      ;
      return null;
      
    }
    
  }
  
  
  public static class $LifecycleOwner extends Wrapper {
    private final LifecycleOwner $value;

    public $LifecycleOwner(final WrapperManager wrapperManager, final String uniqueId, final LifecycleOwner value) {
      super(wrapperManager, uniqueId);
      this.$value = value;
    }

    private $LifecycleOwner(final MethodCallHandlerImpl methodCallHandler, final WrapperManager wrapperManager, final MethodChannel callbackChannel, final MethodCall call) throws Exception {
      super(wrapperManager, (String) call.argument("$uniqueId"));
      switch(call.method) {
        
        default:
          this.$value = null;
      }
    }
    
    static Object onStaticMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        case "LifecycleOwner#allocate":
          allocate(wrapperManager);
          return null;
        case "LifecycleOwner#deallocate":
          deallocate(wrapperManager);
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
  public static class $Preview extends Wrapper {
    private final Preview $value;

    public $Preview(final WrapperManager wrapperManager, final String uniqueId, final Preview value) {
      super(wrapperManager, uniqueId);
      this.$value = value;
    }

    private $Preview(final MethodCallHandlerImpl methodCallHandler, final WrapperManager wrapperManager, final MethodChannel callbackChannel, final MethodCall call) throws Exception {
      super(wrapperManager, (String) call.argument("$uniqueId"));
      switch(call.method) {
        
        case "Preview()":
          this.$value = new Preview(
          
      call.argument("previewConfig") != null ? (PreviewConfig) wrapperManager.getWrapper((String) call.argument("previewConfig")).$getValue() : null
      
          ) ;
          break; 
        
        default:
          this.$value = null;
      }
    }
    
    static Object onStaticMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        case "Preview#allocate":
          allocate(wrapperManager);
          return null;
        case "Preview#deallocate":
          deallocate(wrapperManager);
          return null;
        
        case "Preview#setOnPreviewOutputUpdateListener":
          return setOnPreviewOutputUpdateListener(wrapperManager, call);
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    

    
     Object setOnPreviewOutputUpdateListener(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      
      
      $value.setOnPreviewOutputUpdateListener(
      
      call.argument("listener") != null ? (OnPreviewOutputUpdateListener) wrapperManager.getWrapper((String) call.argument("listener")).$getValue() : null
      
      )
      
      ;
      return null;
      
    }
    
  }
  
  @RequiresApi(api = 21)
  public static class $OnPreviewOutputUpdateListener extends Wrapper {
    private final OnPreviewOutputUpdateListener $value;

    public $OnPreviewOutputUpdateListener(final WrapperManager wrapperManager, final String uniqueId, final OnPreviewOutputUpdateListener value) {
      super(wrapperManager, uniqueId);
      this.$value = value;
    }

    private $OnPreviewOutputUpdateListener(final MethodCallHandlerImpl methodCallHandler, final WrapperManager wrapperManager, final MethodChannel callbackChannel, final MethodCall call) throws Exception {
      super(wrapperManager, (String) call.argument("$uniqueId"));
      switch(call.method) {
        
        case "OnPreviewOutputUpdateListener()":
          this.$value = new OnPreviewOutputUpdateListener(
          
          ) {
            
            @Override
            public void onUpdated(
            
            PreviewOutput $previewOutput
            
            ) {
              final HashMap<String, Object> arguments = new HashMap<>();
              arguments.put("$uniqueId", $uniqueId);

              
              final String $$previewOutputId = UUID.randomUUID().toString();
              wrapperManager.addAllocatedWrapper(new $PreviewOutput(wrapperManager, $$previewOutputId, $previewOutput));
              arguments.put("previewOutput", $$previewOutputId);
              
              
              callbackChannel.invokeMethod("OnPreviewOutputUpdateListener#onUpdated", arguments);  
            }
            
          };
          break; 
        
        default:
          this.$value = null;
      }
    }
    
    static Object onStaticMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        case "OnPreviewOutputUpdateListener#allocate":
          allocate(wrapperManager);
          return null;
        case "OnPreviewOutputUpdateListener#deallocate":
          deallocate(wrapperManager);
          return null;
        
        case "OnPreviewOutputUpdateListener#onUpdated":
          return onUpdated(wrapperManager, call);
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    

    
     Object onUpdated(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      
      
      $value.onUpdated(
      
      call.argument("previewOutput") != null ? (PreviewOutput) wrapperManager.getWrapper((String) call.argument("previewOutput")).$getValue() : null
      
      )
      
      ;
      return null;
      
    }
    
  }
  
  @RequiresApi(api = 21)
  public static class $PreviewOutput extends Wrapper {
    private final PreviewOutput $value;

    public $PreviewOutput(final WrapperManager wrapperManager, final String uniqueId, final PreviewOutput value) {
      super(wrapperManager, uniqueId);
      this.$value = value;
    }

    private $PreviewOutput(final MethodCallHandlerImpl methodCallHandler, final WrapperManager wrapperManager, final MethodChannel callbackChannel, final MethodCall call) throws Exception {
      super(wrapperManager, (String) call.argument("$uniqueId"));
      switch(call.method) {
        
        default:
          this.$value = null;
      }
    }
    
    static Object onStaticMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        case "PreviewOutput#allocate":
          allocate(wrapperManager);
          return null;
        case "PreviewOutput#deallocate":
          deallocate(wrapperManager);
          return null;
        
        case "PreviewOutput#getSurfaceTexture":
          return getSurfaceTexture(wrapperManager, call);
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    

    
     Object getSurfaceTexture(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      final SurfaceTexture result =
      
      
      $value.getSurfaceTexture(
      
      )
      
      ;
      if (result == null) return null;
      return new $SurfaceTexture(wrapperManager, UUID.randomUUID().toString(), result).$uniqueId;
      
    }
    
  }
  
  @RequiresApi(api = 21)
  public static class $PreviewConfig extends Wrapper {
    private final PreviewConfig $value;

    public $PreviewConfig(final WrapperManager wrapperManager, final String uniqueId, final PreviewConfig value) {
      super(wrapperManager, uniqueId);
      this.$value = value;
    }

    private $PreviewConfig(final MethodCallHandlerImpl methodCallHandler, final WrapperManager wrapperManager, final MethodChannel callbackChannel, final MethodCall call) throws Exception {
      super(wrapperManager, (String) call.argument("$uniqueId"));
      switch(call.method) {
        
        default:
          this.$value = null;
      }
    }
    
    static Object onStaticMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        case "PreviewConfig#allocate":
          allocate(wrapperManager);
          return null;
        case "PreviewConfig#deallocate":
          deallocate(wrapperManager);
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
  public static class $PreviewConfigBuilder extends Wrapper {
    private final PreviewConfig.Builder $value;

    public $PreviewConfigBuilder(final WrapperManager wrapperManager, final String uniqueId, final PreviewConfig.Builder value) {
      super(wrapperManager, uniqueId);
      this.$value = value;
    }

    private $PreviewConfigBuilder(final MethodCallHandlerImpl methodCallHandler, final WrapperManager wrapperManager, final MethodChannel callbackChannel, final MethodCall call) throws Exception {
      super(wrapperManager, (String) call.argument("$uniqueId"));
      switch(call.method) {
        
        case "PreviewConfigBuilder()":
          this.$value = new PreviewConfig.Builder(
          
          ) ;
          break; 
        
        default:
          this.$value = null;
      }
    }
    
    static Object onStaticMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        case "PreviewConfigBuilder#allocate":
          allocate(wrapperManager);
          return null;
        case "PreviewConfigBuilder#deallocate":
          deallocate(wrapperManager);
          return null;
        
        case "PreviewConfigBuilder#setLensFacing":
          return setLensFacing(wrapperManager, call);
        
        case "PreviewConfigBuilder#build":
          return build(wrapperManager, call);
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    

    
     Object setLensFacing(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      
      
      $value.setLensFacing(
      
      call.argument("lensFacing") != null ? (LensFacing) wrapperManager.getWrapper((String) call.argument("lensFacing")).$getValue() : null
      
      )
      
      ;
      return null;
      
    }
    
     Object build(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      final PreviewConfig result =
      
      
      $value.build(
      
      )
      
      ;
      if (result == null) return null;
      return new $PreviewConfig(wrapperManager, UUID.randomUUID().toString(), result).$uniqueId;
      
    }
    
  }
  
  
  public static class $TextureView extends Wrapper {
    private final TextureView $value;

    public $TextureView(final WrapperManager wrapperManager, final String uniqueId, final TextureView value) {
      super(wrapperManager, uniqueId);
      this.$value = value;
    }

    private $TextureView(final MethodCallHandlerImpl methodCallHandler, final WrapperManager wrapperManager, final MethodChannel callbackChannel, final MethodCall call) throws Exception {
      super(wrapperManager, (String) call.argument("$uniqueId"));
      switch(call.method) {
        
        case "TextureView()":
          this.$value = new TextureView(
          
      call.argument("context") != null ? (Context) wrapperManager.getWrapper((String) call.argument("context")).$getValue() : null
      
          ) ;
          break; 
        
        default:
          this.$value = null;
      }
    }
    
    static Object onStaticMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        case "TextureView#allocate":
          allocate(wrapperManager);
          return null;
        case "TextureView#deallocate":
          deallocate(wrapperManager);
          return null;
        
        case "TextureView#setSurfaceTexture":
          return setSurfaceTexture(wrapperManager, call);
        
        default:
          throw new NotImplementedException(call.method);
      }
    }
    
    @Override
    public Object $getValue() {
      return $value;
    }
    
    

    
     Object setSurfaceTexture(WrapperManager wrapperManager, MethodCall call) throws Exception {
      
      
      
      $value.setSurfaceTexture(
      
      call.argument("surfaceTexture") != null ? (SurfaceTexture) wrapperManager.getWrapper((String) call.argument("surfaceTexture")).$getValue() : null
      
      )
      
      ;
      return null;
      
    }
    
  }
  
  
  public static class $Context extends Wrapper {
    private final Context $value;

    public $Context(final WrapperManager wrapperManager, final String uniqueId, final Context value) {
      super(wrapperManager, uniqueId);
      this.$value = value;
    }

    private $Context(final MethodCallHandlerImpl methodCallHandler, final WrapperManager wrapperManager, final MethodChannel callbackChannel, final MethodCall call) throws Exception {
      super(wrapperManager, (String) call.argument("$uniqueId"));
      switch(call.method) {
        
        default:
          this.$value = null;
      }
    }
    
    static Object onStaticMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        
        default:
          throw new NotImplementedException(call.method);
      }
    }

    @Override
    public Object onMethodCall(WrapperManager wrapperManager, MethodCall call) throws Exception {
      switch(call.method) {
        case "Context#allocate":
          allocate(wrapperManager);
          return null;
        case "Context#deallocate":
          deallocate(wrapperManager);
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
