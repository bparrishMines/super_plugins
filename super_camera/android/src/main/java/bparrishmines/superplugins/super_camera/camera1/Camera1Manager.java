package bparrishmines.superplugins.super_camera.camera1;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import bparrishmines.superplugins.super_camera.SuperCameraPlugin;
import github.penguin.reference.method_channel.MethodChannelReferencePairManager;
import github.penguin.reference.method_channel.MethodChannelRemoteHandler;
import github.penguin.reference.reference.LocalReference;
import github.penguin.reference.reference.ReferencePairManager;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.view.TextureRegistry;

public class Camera1Manager extends MethodChannelReferencePairManager {
  final TextureRegistry textureRegistry;

  private static class RemoteHandler extends MethodChannelRemoteHandler {
    public RemoteHandler(BinaryMessenger binaryMessenger) {
      super(binaryMessenger, SuperCameraPlugin.baseChannelName + "/camera1");
    }

    @Override
    public List<Object> getCreationArguments(LocalReference localReference) {
      if (localReference.getReferenceClass() == Camera1.class) {
        return Collections.emptyList();
      } else if (localReference.getReferenceClass() == Camera.class) {
        return Collections.emptyList();
      } else if (localReference.getReferenceClass() == CameraInfo.class) {
        final CameraInfo info = (CameraInfo) localReference;
        return Arrays.asList(info.cameraId, info.facing, info.orientation);
      }

      throw new IllegalArgumentException(localReference.toString());
    }
  }

  private static class LocalHandler implements LocalReferenceCommunicationHandler {
    @Override
    public LocalReference create(ReferencePairManager referencePairManager, Class<? extends LocalReference> referenceClass, List<Object> arguments) {
      if (referenceClass == Camera1.class) {
        return Camera1.getInstance((Camera1Manager) referencePairManager);
      }

      throw new IllegalArgumentException(referenceClass.toString());
    }

    @Override
    public Object invokeMethod(ReferencePairManager referencePairManager, LocalReference localReference, String methodName, List<Object> arguments) throws Exception {
      if (localReference.getReferenceClass() == Camera1.class) {
        final Camera1 camera = (Camera1) localReference;
        switch (methodName) {
          case "getAllCameraInfo":
            return camera.getAllCameraInfo();
          case "open":
            return camera.open((Integer) arguments.get(0));
        }
      } else if (localReference.getReferenceClass() == Camera.class) {
        final Camera camera = (Camera) localReference;
        switch (methodName) {
          case "release":
            camera.release();
            return null;
          case "startPreview":
            camera.startPreview();
            return null;
          case "stopPreview":
            camera.stopPreview();
            return null;
          case "attachPreviewToTexture":
            return camera.attachPreviewToTexture();
          case "releaseTexture":
            camera.releaseTexture();
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

  public Camera1Manager(BinaryMessenger binaryMessenger, TextureRegistry textureRegistry) {
    super(Arrays.asList(Camera1.class, Camera.class, CameraInfo.class),
        binaryMessenger,
        SuperCameraPlugin.baseChannelName + "/camera1");
    this.textureRegistry = textureRegistry;
  }

  @Override
  public MethodChannelRemoteHandler getRemoteHandler() {
    return new RemoteHandler(binaryMessenger);
  }

  @Override
  public LocalReferenceCommunicationHandler getLocalHandler() {
    return new LocalHandler();
  }
}
