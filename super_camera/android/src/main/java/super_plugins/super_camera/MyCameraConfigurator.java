package super_plugins.super_camera;

public class MyCameraConfigurator extends CameraInterface.CameraConfigurator {
  private final CameraInterface.CameraConfigurator configurator;

  public MyCameraConfigurator(CameraInterface.CameraConfigurator configurator) {
    super(configurator.cameraDescription, configurator.referenceId);
    this.configurator = configurator;
  }

  @Override
  Object getPreviewWidget() {
    throw new UnsupportedOperationException();
  }

  @Override
  Object initialize() {
    throw new UnsupportedOperationException();
  }

  @Override
  Object start() {
    throw new UnsupportedOperationException();
  }

  @Override
  Object stop() {
    throw new UnsupportedOperationException();
  }

  @Override
  Object dispose() {
    throw new UnsupportedOperationException();
  }
}
