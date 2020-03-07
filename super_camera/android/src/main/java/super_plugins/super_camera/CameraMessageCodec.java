package super_plugins.super_camera;

import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;

import io.flutter.Log;
import io.flutter.plugin.common.StandardMessageCodec;

public class CameraMessageCodec extends StandardMessageCodec {
  static final CameraMessageCodec INSTANCE = new CameraMessageCodec();

  private static final byte LENS_DIRECTION = (byte) 128;
  private static final byte CAMERA_DESCRIPTION = (byte) 129;
  private static final byte CAMERA_CONFIGURATOR = (byte) 130;

  protected void writeValue(ByteArrayOutputStream stream, Object value) {
    if (value instanceof CameraInterface.LensDirection) {
      stream.write(LENS_DIRECTION);
      writeValue(stream, ((CameraInterface.LensDirection) value).value);
    } else if (value instanceof CameraInterface.CameraDescription) {
      stream.write(CAMERA_DESCRIPTION);
      writeValue(stream, ((CameraInterface.CameraDescription) value).direction);
      writeValue(stream, ((CameraInterface.CameraDescription) value).name);
    } else if (value instanceof CameraInterface.CameraConfigurator) {
      stream.write(CAMERA_CONFIGURATOR);
      writeValue(stream, ((CameraInterface.CameraConfigurator) value).cameraDescription);
      writeValue(stream, ((CameraInterface.CameraConfigurator) value).referenceId);
    } else {
      super.writeValue(stream, value);
    }
  }

  protected Object readValueOfType(byte type, ByteBuffer buffer) {
    Log.d("handle", "" + type);
    switch (type) {
      case LENS_DIRECTION:
        return new CameraInterface.LensDirection((String) readValueOfType(buffer.get(), buffer));
      case CAMERA_DESCRIPTION:
        return new CameraInterface.CameraDescription((CameraInterface.LensDirection) readValueOfType(buffer.get(), buffer),
            (String) readValueOfType(buffer.get(), buffer));
      case CAMERA_CONFIGURATOR:
        return new CameraInterface.CameraConfigurator((CameraInterface.CameraDescription) readValueOfType(buffer.get(), buffer),
            (String) readValueOfType(buffer.get(), buffer));
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}
