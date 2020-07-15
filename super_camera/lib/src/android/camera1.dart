import 'dart:async';

import 'package:flutter/services.dart';
import 'package:reference/reference.dart';

import 'camera1_manager.dart';

ReferencePairManager _manager = Camera1Manager(
  LocalHandler(createCamera: () => Camera._()),
)..initialize();

class Camera1 implements LocalReference {
  Camera1._() {
    _manager.pairWithNewRemoteReference(this);
  }

  static final Camera1 instance = Camera1._();

  /// Returns the information about each camera.
  Future<List<CameraInfo>> getAllCameraInfo() async {
    final List<dynamic> allCameraInfo = await _manager.invokeRemoteMethod(
      _manager.getPairedRemoteReference(this),
      'getAllCameraInfo',
    );
    return allCameraInfo.cast<CameraInfo>();
  }

  /// Creates a new [Camera] object to access a particular hardware camera.
  ///
  /// If the same camera is opened by other applications, this will throw a
  /// [PlatformException].
  ///
  /// You must call [Camera.release] when you are done using the camera, otherwise it
  /// will remain locked and be unavailable to other applications. Your
  /// application should only have one [Camera] object active at a time for a
  /// particular hardware camera.
  Future<Camera> open(int cameraId) async {
    return await _manager.invokeRemoteMethod(
      _manager.getPairedRemoteReference(this),
      'open',
      <Object>[cameraId],
    );
  }

  @override
  Type get referenceType => Camera1;
}

/// The [Camera] class is used to set image capture settings, start/stop preview, snap pictures, and retrieve frames for encoding for video.
///
/// This class is a client for the Camera service, which manages the actual
/// camera hardware.
///
/// This uses the [Camera](https://developer.android.com/reference/android/hardware/Camera)
/// API and is deprecated for Android versions 21+.
class Camera implements LocalReference {
  Camera._() {
    _remoteReference = _manager.getPairedRemoteReference(this);
  }

  RemoteReference _remoteReference;
  int _currentTexture;

  /// Disconnects and releases the [Camera] object resources.
  ///
  /// You must call this as soon as you're done with the [Camera] object.
  Future<void> release() async {
    if (_remoteReference == null) return;
    _remoteReference = null;
    _manager.invokeRemoteMethod(_remoteReference, 'release');
    await _manager.disposePairWithLocalReference(this);
  }

  /// Starts capturing and drawing preview frames to the screen.
  ///
  /// Preview will not actually start until a texture is supplied with
  /// [addToTexture].
  Future<void> startPreview() {
    assert(_remoteReference != null);

    return _manager.invokeRemoteMethod(
      _remoteReference,
      'startPreview',
    );
  }

  /// Stops capturing and drawing preview frames to the surface.
  ///
  /// Resets the camera for a future call to [startPreview].
  Future<void> stopPreview() {
    assert(_remoteReference != null);

    return _manager.invokeRemoteMethod(
      _manager.getPairedRemoteReference(this),
      'stopPreview',
    );
  }

  Future<int> attachPreviewToTexture() async {
    assert(_remoteReference != null);

    return _currentTexture ??= await _manager.invokeRemoteMethod(
      _manager.getPairedRemoteReference(this),
      'attachPreviewToTexture',
    );
  }

  Future<void> releaseTexture() {
    assert(_remoteReference != null);

    _currentTexture = null;
    return _manager.invokeRemoteMethod(
      _manager.getPairedRemoteReference(this),
      'releaseTexture',
    );
  }

  @override
  Type get referenceType => Camera;
}

/// Information about a camera.
///
/// Retrieve by calling [Camera.getAllCameraInfo].
class CameraInfo implements LocalReference {
  CameraInfo({this.cameraId, this.facing, this.orientation})
      : assert(cameraId != null),
        assert(facing != null),
        assert(facing >= 0),
        assert(orientation != null);

  /// The facing of the camera is opposite to that of the screen.
  static const int CAMERA_FACING_BACK = 0;

  /// The facing of the camera is the same as that of the screen.
  static const int CAMERA_FACING_FRONT = 1;

  /// The identifier for this camera device.
  ///
  /// This can be used in [Camera.open].
  final int cameraId;

  /// The direction that the camera faces.
  ///
  /// It should be [CameraInfo.CAMERA_FACING_BACK] or
  /// [CameraInfo.CAMERA_FACING_FRONT].
  final int facing;

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
  final int orientation;

  @override
  Type get referenceType => CameraInfo;
}
