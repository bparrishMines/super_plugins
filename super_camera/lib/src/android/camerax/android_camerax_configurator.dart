import 'dart:async';

import 'package:flutter/material.dart';
import 'package:super_camera/src/interface/camera_interface.dart';

import 'camerax.dart';

class AndroidCameraXConfigurator extends CameraConfigurator {
  AndroidCameraXConfigurator(CameraInfoX infoX) : super(infoX);

  Completer<void> _initializeCompleter = Completer<void>();

  TextureView _textureView;

  @override
  Future<Widget> getPreviewWidget() async {
    await _initializeCompleter.future;
    return _textureView;
  }

  @override
  Future<void> initialize() {
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
  Future<void> start() => _initializeCompleter.future;

  @override
  Future<void> stop() => Future<void>.value();

  @override
  Future<void> dispose() => CameraX.unbindAll();
}

class _OnPreviewOutputUpdateListenerImpl extends OnPreviewOutputUpdateListener {
  _OnPreviewOutputUpdateListenerImpl(this.onUpdatedCallback);

  final void Function(PreviewOutput previewOutput) onUpdatedCallback;

  @override
  void onUpdated(PreviewOutput previewOutput) =>
      onUpdatedCallback(previewOutput);
}
