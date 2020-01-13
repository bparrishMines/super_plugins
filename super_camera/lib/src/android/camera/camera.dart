import 'dart:async';

import 'package:flutter/services.dart';
import 'package:penguin/penguin.dart';
import 'package:penguin_plugin/penguin_plugin.dart';

import '../common/texture_registry.dart';
import '../../common/channel.dart';

part 'camera.android.penguin.g.dart';

/// The Camera class is used to set image capture settings, start/stop preview, snap pictures, and retrieve frames for encoding for video.
///
/// This class is a client for the Camera service, which manages the actual
/// camera hardware.
///
/// This uses the [Camera](https://developer.android.com/reference/android/hardware/Camera)
/// API and is deprecated for Android versions 21+.
@Class(AndroidPlatform(AndroidType('android.hardware', <String>['Camera'])))
class Camera extends $Camera {
  Camera.fromUniqueId(String uniqueId)
      : super.fromUniqueId(uniqueId, channel: Common.channel);

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
      invoke<int>(Common.channel, [$Camera.$getNumberOfCameras()]);

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
  static Future<Camera> open(int cameraId) => invoke<Camera>(
        Common.channel,
        [$Camera.$open(cameraId)],
        genericHelper: _GenericHelper.instance,
      );

  /// Returns the information about a particular camera.
  ///
  /// If [Camera.getNumberOfCameras] returns N, the valid id is 0 to N-1.
  @Method()
  static Future<void> getCameraInfo(int cameraId, CameraInfo cameraInfo) =>
      invoke<void>(Common.channel, [
        $Camera.$getCameraInfo(cameraId, cameraInfo),
      ]);

  /// Disconnects and releases the Camera object resources.
  ///
  /// You must call this as soon as you're done with the Camera object.
  @Method()
  FutureOr<void> release() => invoke<void>(Common.channel, [$release()]);

  /// Starts capturing and drawing preview frames to the screen.
  ///
  /// Preview will not actually start until a surface is supplied with
  /// [setPreviewTexture].
  @Method()
  Future<void> startPreview() => invoke<void>(Common.channel, [$startPreview()]);

  /// Stops capturing and drawing preview frames to the surface.
  ///
  /// Resets the camera for a future call to [startPreview].
  @Method()
  Future<void> stopPreview() => invoke<void>(Common.channel, [$stopPreview()]);

  /// Sets the SurfaceTexture to be used for live preview.
  ///
  /// Either a surface or surface texture is necessary for preview, and preview
  /// is necessary to take pictures. The same surface texture can be re-set
  /// without harm. Setting a preview surface texture will un-set any preview
  /// surface that was set.
  ///
  /// This method must be called before [startPreview]. The one exception is
  /// that if the preview surface texture is not set (or set to null) before
  /// [startPreview] is called, then this method may be called once with a
  /// non-null parameter to set the preview surface. (This allows camera setup
  /// and surface creation to happen in parallel, saving time.) The preview
  /// surface texture may not otherwise change while preview is running.
  @Method()
  Future<void> setPreviewTexture(SurfaceTexture surfaceTexture) => invoke<void>(Common.channel, [$setPreviewTexture(surfaceTexture)]);
}

/// Information about a camera.
///
/// Retrieve by calling [Camera.getCameraInfo].
@Class(AndroidPlatform(
  AndroidType('android.hardware', <String>['Camera', 'CameraInfo']),
))
class CameraInfo extends $CameraInfo {
  @Constructor()
  CameraInfo() : super.$Default(channel: Common.channel);

  CameraInfo.fromUniqueId(String uniqueId) : super.fromUniqueId(uniqueId, channel: Common.channel);

  /// The facing of the camera is opposite to that of the screen.
  static const int CAMERA_FACING_BACK = 0;

  /// The facing of the camera is the same as that of the screen.
  static const int CAMERA_FACING_FRONT = 1;

  /// The identifier for this camera device.
  ///
  /// This can be used in [Camera.open].
  int id;

  /// The direction that the camera faces.
  ///
  /// It should be [CameraInfo.CAMERA_FACING_BACK] or
  /// [CameraInfo.CAMERA_FACING_FRONT].
  @Field()
  Future<int> get facing => invoke<int>(Common.channel, [$get$facing()]);

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
  Future<int> get orientation => invoke<int>(Common.channel, [$get$orientation()]);

//  @override
//  LensDirection get direction {
//    switch (facing) {
//      case CAMERA_FACING_BACK:
//        return LensDirection.back;
//      case CAMERA_FACING_FRONT:
//        return LensDirection.front;
//    }
//
//    throw StateError(
//      'Facing `$facing` should be either $CAMERA_FACING_FRONT or $CAMERA_FACING_BACK',
//    );
//  }

//  @override
//  String get name => id.toString();
}
