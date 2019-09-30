import 'dart:async';

import 'package:flutter/services.dart';
import 'package:penguin/penguin.dart';
import 'package:uuid/uuid.dart';

import '../../../penguin.g.dart';
import '../../channel.dart';

@Class(AndroidPlatform(AndroidType('android.hardware', 'Camera')))
class Camera {
  Camera._() : _camera = $Camera(Uuid().v4());

  final $Camera _camera;

  bool _isReleased = false;

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
  /// [PlatformException].
  ///
  /// You must call [release] when you are done using the camera, otherwise it
  /// will remain locked and be unavailable to other applications. Your
  /// application should only have one Camera object active at a time for a
  /// particular hardware camera.
  @Method()
  static Camera open(int cameraId) {
    final Camera camera = Camera._();
    $invokeAll(
      Channel.channel,
      <MethodCall>[
        $Camera.$open(cameraId, camera._camera.$uniqueId),
        camera._camera.$allocate(),
      ],
    );
    return camera;
  }

  /// Returns the information about a particular camera.
  ///
  /// If [Camera.getNumberOfCameras] returns N, the valid id is 0 to N-1.
  @Method()
  static Future<void> getCameraInfo(int cameraId, CameraInfo cameraInfo) async {
    final List<dynamic> result = await $invokeAll(
      Channel.channel,
      <MethodCall>[
        cameraInfo._cameraInfo.$CameraInfoDefault(),
        $Camera.$getCameraInfo(cameraId, cameraInfo._cameraInfo),
        cameraInfo._cameraInfo.$facing(),
        cameraInfo._cameraInfo.$orientation(),
      ],
    );

    cameraInfo.facing = result[2];
    cameraInfo.orientation = result[3];
  }

  /// Disconnects and releases the Camera object resources.
  ///
  /// You must call this as soon as you're done with the Camera object.
  @Method()
  FutureOr<void> release() {
    if (_isReleased) return null;
    _isReleased = true;

    final Completer<void> completer = Completer<void>();

    $invokeAll(
      Channel.channel,
      <MethodCall>[_camera.$release(), _camera.$deallocate()],
    ).then((_) => completer.complete());

    return completer.future;
  }
}

/// Information about a camera.
///
/// Retrieve by calling [Camera.getCameraInfo].
@Class(AndroidPlatform(AndroidType('android.hardware.Camera', 'CameraInfo')))
class CameraInfo {
  @Constructor()
  CameraInfo() : _cameraInfo = $CameraInfo(Uuid().v4());

  /// The facing of the camera is opposite to that of the screen.
  static const int CAMERA_FACING_BACK = 0x00000000;

  /// The facing of the camera is the same as that of the screen.
  static const int CAMERA_FACING_FRONT = 0x00000001;

  final $CameraInfo _cameraInfo;

  /// The direction that the camera faces.
  ///
  /// It should be [CameraInfo.CAMERA_FACING_BACK] or
  /// [CameraInfo.CAMERA_FACING_FRONT].
  @Field()
  int facing;

  /// The orientation of the camera image.
  ///
  /// The value is the angle that the camera image needs to be rotated clockwise
  /// so it shows correctly on the display in its natural orientation. It should
  /// be 0, 90, 180, or 270.
  ///
  /// For example, suppose a device has a naturally tall screen. The back-facing
  /// camera sensor is mounted in landscape. You are looking at the screen.
  /// If the top side of the camera sensor is aligned with the right edge of the
  /// screen in natural orientation, the value should be 90. If the top side of
  /// a front-facing camera sensor is aligned with the right of the screen,
  /// the value should be 270.
  @Field()
  int orientation;
}
