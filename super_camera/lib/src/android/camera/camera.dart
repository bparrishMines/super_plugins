import 'package:flutter/services.dart';
import 'package:penguin/penguin.dart';
import 'package:uuid/uuid.dart';

import '../../../penguin.g.dart';
import '../../channel.dart';

@Class(AndroidPlatform(AndroidType('android.hardware', 'Camera')))
class Camera {
  Camera._(this._camera);

  final $Camera _camera;

  /// Returns the number of physical cameras available on this device.
  ///
  /// The return value of this method might change dynamically if the device
  /// supports external cameras and an external camera is connected or
  /// disconnected. If there is a logical multi-camera in the system, to
  /// maintain app backward compatibility, this method will only expose one
  /// camera per facing for all logical camera and physical camera groups. Use
  /// camera2 API to see all cameras.
  @Method()
  static Future<int> getNumberOfCameras() =>
      $invoke(Channel.channel, $Camera.$getNumberOfCameras());

  /// Creates a new Camera object to access a particular hardware camera.
  ///
  /// If the same camera is opened by other applications, this will throw a
  /// PlatformException.
  ///
  /// You must call release() when you are done using the camera, otherwise it
  /// will remain locked and be unavailable to other applications. Your
  /// application should only have one Camera object active at a time for a
  /// particular hardware camera.
  @Method()
  static Camera open(int cameraId) {
    final Camera camera = Camera._($Camera(Uuid().v4()));
    $invokeAll(
      Channel.channel,
      <MethodCall>[
        $Camera.$open(cameraId, camera._camera.$uniqueId),
        camera._camera.$allocate(),
      ],
    );
    return camera;
  }

  @Method()
  static Future<void> getCameraInfo(int cameraId, CameraInfo cameraInfo) async {
    final List<dynamic> result = await $invokeAll(
      Channel.channel,
      <MethodCall>[
        cameraInfo._cameraInfo.$CameraInfoDefault(),
      ],
    );
  }
}

/// Information about a camera.
///
/// Retrieve by calling [Camera.getCameraInfo].
@Class(AndroidPlatform(AndroidType('android.hardware.Camera', 'CameraInfo')))
class CameraInfo {
  @Constructor()
  CameraInfo() : _cameraInfo = $CameraInfo(Uuid().v4());

  static const int CAMERA_FACING_BACK = 0;
  static const int CAMERA_FACING_FRONT = 1;

  final $CameraInfo _cameraInfo;

  bool canDisableShutterSound;
  int orientation;
  int facing;
}
