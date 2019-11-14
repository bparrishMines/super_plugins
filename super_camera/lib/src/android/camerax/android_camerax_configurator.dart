import 'dart:async';

import 'package:flutter/material.dart';
import 'package:super_camera/src/interface/camera_interface.dart';

import 'camerax.dart';
import '../../common/channel.dart';

/// Default [CameraConfigurator] for Android versions >= 21.
///
/// This configurator is created when using the default constructor for
/// [CameraController] and the current device is an Android, versions 21+.
class AndroidCameraXConfigurator extends CameraConfigurator {
  /// Creates a [CameraConfigurator] using the camera specified by [infoX].
  AndroidCameraXConfigurator(CameraInfoX infoX) : super(infoX);

  Completer<void> _initializeCompleter = Completer<void>();

  TextureView _textureView;
  bool _isReleased = false;

  @override
  Future<Widget> getPreviewWidget() async {
    assert(!_isReleased, Channel.deallocatedMsg(this));

    await _initializeCompleter.future;
    return _textureView;
  }

  @override
  Future<void> initialize() {
    assert(!_isReleased, Channel.deallocatedMsg(this));

    final PreviewConfigBuilder builder = PreviewConfigBuilder()
      ..setLensFacing((cameraDescription as CameraInfoX).getLensFacing());

    final Preview preview = Preview(builder.build())
      ..setOnPreviewOutputUpdateListener(
        _OnPreviewOutputUpdateListenerImpl(
          (PreviewOutput previewOutput) {
            _textureView = TextureView(previewOutput.getSurfaceTexture());
            _initializeCompleter.complete();
          },
        ),
      );

    CameraX.bindToLifecycle(LifecycleOwner.instance, preview);

    return _initializeCompleter.future;
  }

  @override
  Future<void> start() {
    assert(!_isReleased, Channel.deallocatedMsg(this));
    return _initializeCompleter.future;
  }

  // TODO(bparrishMines): Just unbind UseCases here.
  /// This is a no-op for [AndroidCameraXConfigurator].
  @override
  Future<void> stop() {
    assert(!_isReleased, Channel.deallocatedMsg(this));
    return Future<void>.value();
  }

  @override
  Future<void> dispose() {
    if (_isReleased) return Future<void>.value();
    _isReleased = true;
    _textureView = null;

    return CameraX.unbindAll();
  }
}

class _OnPreviewOutputUpdateListenerImpl extends OnPreviewOutputUpdateListener {
  _OnPreviewOutputUpdateListenerImpl(this.onUpdatedCallback);

  final void Function(PreviewOutput previewOutput) onUpdatedCallback;

  @override
  void onUpdated(PreviewOutput previewOutput) =>
      onUpdatedCallback(previewOutput);
}
