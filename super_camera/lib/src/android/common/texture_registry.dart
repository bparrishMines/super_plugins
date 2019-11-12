import 'dart:async';

import 'package:flutter/services.dart';
import 'package:penguin/penguin.dart';
import 'package:super_camera/android.penguin.g.dart';
import 'package:uuid/uuid.dart';

import '../../common/channel.dart';

/// A registry entry for a managed [SurfaceTexture].
@Class(AndroidPlatform(
  AndroidType(
      'io.flutter.view.TextureRegistry', <String>['SurfaceTextureEntry']),
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

  /// Unique identifier used to identify which [Texture] to draw to.
  ///
  /// Pass to `Texture({this.textureId});`.
  @Method()
  int id() => _id;

  /// Unregisters and releases this [SurfaceTexture].
  @Method()
  Future<void> release() {
    assert(!_isReleased, Channel.deallocatedMsg(this));
    _isReleased = true;
    return invokeAll(Channel.channel, <MethodCall>[
      _surfaceTextureEntry.$release(),
      _surfaceTextureEntry.deallocate(),
      _surfaceTexture.surfaceTexture.deallocate(),
    ]);
  }

  /// The managed [SurfaceTexture].
  @Method()
  SurfaceTexture surfaceTexture() => _surfaceTexture;
}

/// Captures frames from an image stream as an OpenGL ES texture.
///
/// You can retrieve an instance through [TextureRegistry] or [PreviewOutput].
@Class(AndroidPlatform(
  AndroidType('android.graphics', <String>['SurfaceTexture']),
))
class SurfaceTexture {
  /// Constructor for internal use only.
  SurfaceTexture.internal(this.surfaceTexture);

  final $SurfaceTexture surfaceTexture;
}

/// Gives access to surfaces to draw frames to.
///
/// Use this to allocate a [SurfaceTexture] for a [Texture] widget.
@Class(AndroidPlatform(
    AndroidType('io.flutter.view', <String>['TextureRegistry'])))
class TextureRegistry {
  TextureRegistry._() : _$registry = $TextureRegistry('texture_registry');

  static TextureRegistry instance = TextureRegistry._();

  final $TextureRegistry _$registry;

  @Method()
  Future<SurfaceTextureEntry> createSurfaceTexture() {
    final Completer<SurfaceTextureEntry> completer =
        Completer<SurfaceTextureEntry>();

    final $SurfaceTextureEntry entry = $SurfaceTextureEntry(Uuid().v4());
    final SurfaceTexture surfaceTexture = SurfaceTexture.internal(
      $SurfaceTexture(Uuid().v4()),
    );

    invokeAll(
      Channel.channel,
      <MethodCall>[
        _$registry.$createSurfaceTexture(
          entry.uniqueId,
        ),
        entry.allocate(),
        entry.$surfaceTexture(surfaceTexture.surfaceTexture.uniqueId),
        surfaceTexture.surfaceTexture.allocate(),
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
