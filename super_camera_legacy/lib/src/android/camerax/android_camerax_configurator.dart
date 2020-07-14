import 'dart:async';

import 'package:flutter/material.dart';
import 'package:super_camera/src/android/common/texture_registry.dart';

import '../../interface/camera_interface.dart';
import 'camerax.dart';

/// Default [CameraConfigurator] for Android versions >= 21.
///
/// This configurator is created when using the default constructor for
/// [CameraController] and the current device is an Android, versions 21+.
class AndroidCameraXConfigurator extends CameraConfigurator {
  /// Creates a [CameraConfigurator] using the camera specified by [infoX].
  AndroidCameraXConfigurator(CameraXDescription description)
      : super(description);

  Completer<void> _initializeCompleter;
  Completer<Widget> _previewWidgetCompleter = Completer<Widget>();
  _OnPreviewOutputUpdateListenerImpl _outputListener;
  Preview _preview;

  bool _isStarted = false;

  /// Retrieves a list of available cameras for the current device.
  static Future<List<CameraDescription>> availableCameras() async {
    final List<CameraDescription> descriptions = <CameraDescription>[];

    final CameraInfoX backInfo =
        await CameraX.getCameraInfo(await LensFacing.back);
    if (backInfo != null) {
      descriptions.add(CameraXDescription('back', LensDirection.back));
      backInfo.release();
    }

    final CameraInfoX frontInfo =
        await CameraX.getCameraInfo(await LensFacing.front);
    if (frontInfo != null) {
      descriptions.add(CameraXDescription('front', LensDirection.front));
      frontInfo.release();
    }

    return descriptions;
  }

  @override
  Future<Widget> getPreviewWidget() async {
    super.getPreviewWidget();
    await _initializeCompleter.future;
    return _previewWidgetCompleter.future;
  }

  @override
  Future<void> initialize() {
    super.initialize();
    if (_initializeCompleter != null) return _initializeCompleter.future;
    _initializeCompleter = Completer<void>();

    final PreviewConfigBuilder builder = PreviewConfigBuilder();
    final CameraXDescription description = cameraDescription;

    Future<LensFacing> lensFacing;
    if (description.name == 'back') {
      lensFacing = LensFacing.back;
    } else if (description.name == 'front') {
      lensFacing = LensFacing.front;
    } else {
      throw StateError(description.name);
    }

    lensFacing.then<PreviewConfig>((LensFacing lensFacing) {
      builder.setLensFacing(lensFacing.autoReleasePool());
      return (builder.autoReleasePool() as PreviewConfigBuilder).build();
    }).then((PreviewConfig config) {
      _preview = Preview(config.autoReleasePool());
      _outputListener = _OnPreviewOutputUpdateListenerImpl(_onUpdated);
      _preview.setOnPreviewOutputUpdateListener(_outputListener);
      _initializeCompleter.complete();
    });

    return _initializeCompleter.future;
  }

  Future<void> _onUpdated(PreviewOutput previewOutput) async {
    final SurfaceTexture surfaceTexture =
        await previewOutput.getSurfaceTexture();
    _previewWidgetCompleter.complete(TextureViewWidget(surfaceTexture));
  }

  @override
  Future<void> start() {
    super.start();
    if (_isStarted) return Future<void>.value();
    _isStarted = true;
    return _initializeCompleter.future.then(
      (_) => CameraX.bindToLifecycle(LifecycleOwner.instance, _preview),
    );
  }

  @override
  Future<void> stop() {
    super.stop();
    _isStarted = false;
    return _initializeCompleter.future.then((_) => CameraX.unbindAll());
  }

  @override
  Future<void> dispose() {
    super.dispose();
    _outputListener?.release();
    _outputListener = null;
    if (_preview == null) return Future<void>.value();
    final Preview temp = _preview;
    _preview = null;
    return temp.release();
  }
}

class _OnPreviewOutputUpdateListenerImpl extends OnPreviewOutputUpdateListener {
  _OnPreviewOutputUpdateListenerImpl(this.onUpdatedCallback);

  final Future<void> Function(PreviewOutput previewOutput) onUpdatedCallback;

  @override
  void onUpdated(PreviewOutput previewOutput) {
    onUpdatedCallback(previewOutput);
  }
}

class CameraXDescription implements CameraDescription {
  CameraXDescription(this.name, this.direction);

  final String name;
  final LensDirection direction;
}
