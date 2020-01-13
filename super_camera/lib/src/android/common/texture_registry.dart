import 'dart:async';

import 'package:flutter/services.dart';
import 'package:penguin/penguin.dart';
import 'package:penguin_plugin/penguin_plugin.dart';

import '../../common/channel.dart';

part 'texture_registry.android.penguin.g.dart';

/// A registry entry for a managed [SurfaceTexture].
@Class(AndroidPlatform(
  AndroidType(
      'io.flutter.view.TextureRegistry', <String>['SurfaceTextureEntry']),
))
class SurfaceTextureEntry extends $SurfaceTextureEntry {
  SurfaceTextureEntry.fromUniqueId(String uniqueId)
      : super.fromUniqueId(uniqueId, channel: Common.channel);

  /// Unique identifier used to identify which [Texture] to draw to.
  ///
  /// Pass to `Texture({this.textureId});`.
  @Method()
  Future<int> id() => invoke<int>(Common.channel, [$id()]);

  /// The managed [SurfaceTexture].
  @Method()
  Future<SurfaceTexture> surfaceTexture() => invoke<SurfaceTexture>(
        Common.channel,
        [$surfaceTexture()],
        genericHelper: _GenericHelper.instance,
      );

  /// Unregisters and releases this [SurfaceTexture].
  @Method()
  Future<void> release() => invoke<void>(Common.channel, [$release()]);
}

/// Captures frames from an image stream as an OpenGL ES texture.
///
/// You can retrieve an instance through [TextureRegistry] or [PreviewOutput].
@Class(AndroidPlatform(
  AndroidType('android.graphics', <String>['SurfaceTexture']),
))
class SurfaceTexture extends $SurfaceTexture {
  /// Constructor for internal use only.
  SurfaceTexture.fromUniqueId(String uniqueId)
      : super.fromUniqueId(uniqueId, channel: Common.channel);
}

/// Gives access to surfaces to draw frames to.
///
/// Use this to allocate a [SurfaceTexture] for a [Texture] widget.
@Class(AndroidPlatform(
  AndroidType('io.flutter.view', <String>['TextureRegistry']),
))
class TextureRegistry extends $TextureRegistry {
  TextureRegistry.fromUniqueId(String uniqueId)
      : super.fromUniqueId(uniqueId, channel: Common.channel);

  static final TextureRegistry instance =
      TextureRegistry.fromUniqueId('texture_registry');

  @Method()
  Future<SurfaceTextureEntry> createSurfaceTexture() =>
      invoke<SurfaceTextureEntry>(
        Common.channel,
        [$createSurfaceTexture()],
        genericHelper: _GenericHelper.instance,
      );
}
