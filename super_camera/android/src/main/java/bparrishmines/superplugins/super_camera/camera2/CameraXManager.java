package bparrishmines.superplugins.super_camera.camera2;

import android.content.Context;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import androidx.lifecycle.LifecycleOwner;
import bparrishmines.superplugins.super_camera.SuperCameraPlugin;
import github.penguin.reference.method_channel.MethodChannelReferencePairManager;
import github.penguin.reference.method_channel.MethodChannelRemoteHandler;
import github.penguin.reference.reference.LocalReference;
import github.penguin.reference.reference.ReferencePairManager;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.view.TextureRegistry;

public class CameraXManager extends MethodChannelReferencePairManager {
  final TextureRegistry textureRegistry;
  final LifecycleOwner lifecycleOwner;
  Context context;

  private static class RemoteHandler extends MethodChannelRemoteHandler {
    public RemoteHandler(BinaryMessenger binaryMessenger, String channelName) {
      super(binaryMessenger, channelName);
    }

    @Override
    public List<Object> getCreationArguments(LocalReference localReference) {
      if (localReference.getReferenceClass() == Preview.class) {
        return Collections.emptyList();
      } else if (localReference.getReferenceClass() == ProcessCameraProvider.class) {
        return Collections.emptyList();
      } else if (localReference.getReferenceClass() == CameraSelector.class) {
        final CameraSelector selector = (CameraSelector) localReference;
        return Collections.singletonList((Object) selector.lensFacing);
      } else if (localReference.getReferenceClass() == Camera.class) {
        return Collections.emptyList();
      }

      throw new IllegalArgumentException(localReference.toString());
    }
  }

  private static class LocalHandler implements LocalReferenceCommunicationHandler {
    @Override
    public LocalReference create(ReferencePairManager referencePairManager, Class<? extends LocalReference> referenceClass, List<Object> arguments) {
      final CameraXManager manager = (CameraXManager) referencePairManager;

      if (referenceClass == ProcessCameraProvider.class) {
        return ProcessCameraProvider.getInstance(manager);
      } else if (referenceClass == SuccessListener.class) {
        return new SuccessListener(manager);
      } else if (referenceClass == Preview.class) {
        return new Preview(manager);
      } else if (referenceClass == CameraSelector.class) {
        return new CameraSelector((Integer) arguments.get(0));
      }

      throw new IllegalArgumentException(referenceClass.toString());
    }

    @Override
    public Object invokeMethod(ReferencePairManager referencePairManager, LocalReference localReference, String methodName, List<Object> arguments) throws Exception {
      if (localReference.getReferenceClass() == ProcessCameraProvider.class) {
        final ProcessCameraProvider provider = (ProcessCameraProvider) localReference;
        switch (methodName) {
          case "initialize":
            provider.initialize((SuccessListener) arguments.get(0));
            return null;
          case "bindToLifecycle":
            return provider.bindToLifecycle((CameraSelector) arguments.get(0), (UseCase) arguments.get(1));
          case "unbindAll":
            provider.unbindAll();
            return null;
        }
      } else if (localReference.getReferenceClass() == Preview.class) {
        final Preview preview = (Preview) localReference;
        switch (methodName) {
          case "attachToTexture":
            return preview.attachToTexture();
          case "releaseTexture":
            preview.releaseTexture();
            return null;
        }
      }

      throw new IllegalArgumentException(Arrays.asList(localReference, methodName).toString());
    }

    @Override
    public void dispose(ReferencePairManager referencePairManager, LocalReference localReference) {
      // Do nothing
    }
  }

  public CameraXManager(BinaryMessenger binaryMessenger,
                        TextureRegistry textureRegistry,
                        Context context,
                        LifecycleOwner lifecycleOwner) {
    super(Arrays.asList(Camera.class, ProcessCameraProvider.class, CameraSelector.class, Preview.class, SuccessListener.class), binaryMessenger, SuperCameraPlugin.baseChannelName + "/camerax");
    this.textureRegistry = textureRegistry;
    this.context = context;
    this.lifecycleOwner = lifecycleOwner;
  }

  public void setContext(Context context) {
    this.context = context;
  }

  @Override
  public MethodChannelRemoteHandler getRemoteHandler() {
    return new RemoteHandler(binaryMessenger, channelName);
  }

  @Override
  public LocalReferenceCommunicationHandler getLocalHandler() {
    return new LocalHandler();
  }
}
