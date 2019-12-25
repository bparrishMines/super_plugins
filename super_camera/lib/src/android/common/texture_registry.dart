import 'dart:async';

import 'package:flutter/services.dart';
import 'package:penguin/penguin.dart';
import 'package:penguin_plugin/android_wrapper.dart';
import 'package:penguin_plugin/penguin_plugin.dart';

import '../../common/channel.dart';

part 'texture_registry.android.penguin.g.dart';

/// A registry entry for a managed [SurfaceTexture].
@Class(AndroidPlatform(
  AndroidType(
      'io.flutter.view.TextureRegistry', <String>['SurfaceTextureEntry']),
))
class SurfaceTextureEntry extends $SurfaceTextureEntry {
  SurfaceTextureEntry._(
    String uniqueId,
    this._surfaceTexture,
    this._id,
  ) : super(uniqueId);

  final SurfaceTexture _surfaceTexture;
  final int _id;

  bool _isReleased = false;

  /// Unique identifier used to identify which [Texture] to draw to.
  ///
  /// Pass to `Texture({this.textureId});`.
  @Method()
  int id() => _id;

  /// The managed [SurfaceTexture].
  @Method()
  SurfaceTexture surfaceTexture() => _surfaceTexture;

  /// Unregisters and releases this [SurfaceTexture].
  @Method()
  Future<void> release() {
    assert(!_isReleased, Common.deallocatedMsg(this));
    _isReleased = true;
    return invoke<void>(Common.channel, <MethodCall>[
      $release(),
      _surfaceTexture.deallocate(),
      deallocate(),
    ]);
  }

  static FutureOr<SurfaceTextureEntry> onAllocated(String uniqueId) {
    final Completer<SurfaceTextureEntry> completer =
        Completer<SurfaceTextureEntry>();

    final $SurfaceTextureEntry entry = $SurfaceTextureEntry(uniqueId);
    final SurfaceTexture surfaceTexture = SurfaceTexture._(Common.uuid.v4());

    invokeForAll(
      Common.channel,
      <MethodCall>[
        entry.$surfaceTexture(surfaceTexture.uniqueId),
        surfaceTexture.allocate(),
        entry.$id(),
      ],
    ).then(
      (List<dynamic> result) => completer.complete(
        SurfaceTextureEntry._(uniqueId, surfaceTexture, result[2]),
      ),
    );

    return completer.future;
  }
}

/// Captures frames from an image stream as an OpenGL ES texture.
///
/// You can retrieve an instance through [TextureRegistry] or [PreviewOutput].
@Class(AndroidPlatform(
  AndroidType('android.graphics', <String>['SurfaceTexture']),
))
class SurfaceTexture extends $SurfaceTexture {
  /// Constructor for internal use only.
  SurfaceTexture._(String uniqueId) : super(uniqueId);

  static FutureOr onAllocated(String uniqueId) => SurfaceTexture._(uniqueId);
}

/// Gives access to surfaces to draw frames to.
///
/// Use this to allocate a [SurfaceTexture] for a [Texture] widget.
@Class(AndroidPlatform(
    AndroidType('io.flutter.view', <String>['TextureRegistry'])))
class TextureRegistry extends $TextureRegistry {
  TextureRegistry._() : super('texture_registry');

  static final TextureRegistry instance = TextureRegistry._();

  @Method()
  Future<SurfaceTextureEntry> createSurfaceTexture() {
    final String textureEntryId = Common.uuid.v4();

    invoke<void>(Common.channel, [
      $createSurfaceTexture(textureEntryId),
      $SurfaceTextureEntry(textureEntryId).allocate(),
    ]);

    return SurfaceTextureEntry.onAllocated(textureEntryId);
  }

  static FutureOr<TextureRegistry> onAllocated(String uniqueId) =>
      throw UnimplementedError();
}
