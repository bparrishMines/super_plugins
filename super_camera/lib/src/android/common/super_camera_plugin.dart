import 'dart:async';

import 'package:flutter/services.dart';
import 'package:penguin/penguin.dart';
import 'package:super_camera/penguin.g.dart';
import 'package:uuid/uuid.dart';

import '../../common/channel.dart';

@Class(AndroidPlatform(
  AndroidType('super_plugins.super_camera', 'SuperCameraPlugin'),
))
class SuperCameraPlugin {
  SuperCameraPlugin._();

  @Method()
  static Future<SurfaceTextureEntry> getSurfaceTextureEntry() {
    final Completer<SurfaceTextureEntry> completer =
        Completer<SurfaceTextureEntry>();

    final $SurfaceTextureEntry entry = $SurfaceTextureEntry(Uuid().v4());
    final SurfaceTexture surfaceTexture = SurfaceTexture._();

    $invokeAll(
      Channel.channel,
      <MethodCall>[
        $SuperCameraPlugin.$getSurfaceTextureEntry(
          entry.$uniqueId,
        ),
        entry.$allocate(),
        entry.$surfaceTexture(surfaceTexture._surfaceTexture.$uniqueId),
        surfaceTexture.surfaceTexture.$allocate(),
        entry.$id(),
      ],
    ).then(
      (List<dynamic> result) => completer.complete(
        SurfaceTextureEntry._(entry, surfaceTexture, result[4]),
      ),
    );

    return completer.future;
  }
}

@Class(AndroidPlatform(
  AndroidType('io.flutter.view.TextureRegistry', 'SurfaceTextureEntry'),
))
class SurfaceTextureEntry {
  SurfaceTextureEntry._(
    this._surfaceTextureEntry,
    this._surfaceTexture,
    this._id,
  );

  final $SurfaceTextureEntry _surfaceTextureEntry;
  final SurfaceTexture _surfaceTexture;
  final int _id;

  bool _isReleased = false;

  @Method()
  int id() => _id;

  @Method()
  Future<void> release() {
    assert(!_isReleased, Channel.deallocatedMsg(this));
    _isReleased = true;
    return $invokeAll(Channel.channel, <MethodCall>[
      _surfaceTextureEntry.$release(),
      _surfaceTextureEntry.$deallocate(),
      _surfaceTexture.surfaceTexture.$deallocate(),
    ]);
  }

  @Method()
  SurfaceTexture surfaceTexture() => _surfaceTexture;
}

/// Captures frames from an image stream as an OpenGL ES texture.
@Class(AndroidPlatform(AndroidType('android.graphics', 'SurfaceTexture')))
class SurfaceTexture {
  SurfaceTexture._() : _surfaceTexture = $SurfaceTexture(Uuid().v4());

  final $SurfaceTexture _surfaceTexture;

  /// INTERNAL USE ONLY.
  ///
  /// Used to identify the surface texture on the Android platform side.
  $SurfaceTexture get surfaceTexture => _surfaceTexture;
}
