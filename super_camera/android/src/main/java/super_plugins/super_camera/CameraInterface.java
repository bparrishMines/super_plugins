package super_plugins.super_camera;

import java.util.HashMap;
import java.util.Map;

public class CameraInterface {
  public static final Map<String, MethodChannelReferenceHolder> holders = new HashMap<>();

  public static class MethodChannelReferenceHolder {
    final String referenceId;

    public MethodChannelReferenceHolder(String referenceId) {
      this.referenceId = referenceId;
    }
  }

  public static class LensDirection {
    final String value;

    public LensDirection(String value) {
      this.value = value;
    }
  }

  public static class CameraDescription {
    final LensDirection direction;
    final String name;

    public CameraDescription(LensDirection direction, String name) {
      this.direction = direction;
      this.name = name;
    }
  }

  public static class CameraConfigurator extends MethodChannelReferenceHolder {
    final CameraDescription cameraDescription;

    public CameraConfigurator(CameraDescription cameraDescription, String referenceID) {
      super(referenceID);
      this.cameraDescription = cameraDescription;
    }

    // TODO: make these capture all exceptions.
    public Object getPreviewWidget() {
      throw new UnsupportedOperationException();
    }

    public Object initialize() {
      throw new UnsupportedOperationException();
    }

    public Object start() {
      throw new UnsupportedOperationException();
    }

    public Object stop() {
      throw new UnsupportedOperationException();
    }

    public Object dispose() {
      throw new UnsupportedOperationException();
    }
  }

  public abstract static class CameraInstanceFactory {
    abstract CameraConfigurator createCameraConfigurator(CameraConfigurator configurator);
  }
}
