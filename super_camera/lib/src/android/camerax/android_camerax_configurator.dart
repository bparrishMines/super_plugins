//import 'dart:async';
//
//import 'package:flutter/material.dart';
//
//import '../../interface/camera_interface.dart';
//import 'camerax.dart';
//
///// Default [CameraConfigurator] for Android versions >= 21.
/////
///// This configurator is created when using the default constructor for
///// [CameraController] and the current device is an Android, versions 21+.
//class AndroidCameraXConfigurator extends CameraConfigurator {
//  /// Creates a [CameraConfigurator] using the camera specified by [infoX].
//  AndroidCameraXConfigurator(CameraInfoX infoX) : super(infoX);
//
//  Completer<void> _initializeCompleter = Completer<void>();
//  TextureViewWidget _previewWidget;
//
//  @override
//  Future<Widget> getPreviewWidget() async {
//    super.getPreviewWidget();
//    await _initializeCompleter.future;
//    return _previewWidget;
//  }
//
//  @override
//  Future<void> initialize() {
//    super.initialize();
//
//    final PreviewConfigBuilder builder = PreviewConfigBuilder()
//      ..setLensFacing((cameraDescription as CameraInfoX).getLensFacing());
//
//    final Preview preview = Preview(builder.build())
//      ..setOnPreviewOutputUpdateListener(
//        _OnPreviewOutputUpdateListenerImpl(
//          (PreviewOutput previewOutput) {
//            final TextureView textureView = TextureView()
//              ..setSurfaceTexture(previewOutput.getSurfaceTexture());
//            _previewWidget = TextureViewWidget(textureView);
//            _initializeCompleter.complete();
//          },
//        ),
//      );
//
//    CameraX.bindToLifecycle(LifecycleOwner.instance, preview);
//
//    return _initializeCompleter.future;
//  }
//
//  @override
//  Future<void> start() {
//    super.start();
//    return _initializeCompleter.future;
//  }
//
//  // TODO(bparrishMines): Just unbind individual UseCases here.
//  /// This is a no-op for [AndroidCameraXConfigurator].
//  @override
//  Future<void> stop() => super.stop();
//
//  @override
//  Future<void> dispose() {
//    super.dispose();
//
//    _previewWidget = null;
//    return CameraX.unbindAll();
//  }
//}
//
//class _OnPreviewOutputUpdateListenerImpl extends OnPreviewOutputUpdateListener {
//  _OnPreviewOutputUpdateListenerImpl(this.onUpdatedCallback);
//
//  final void Function(PreviewOutput previewOutput) onUpdatedCallback;
//
//  @override
//  void onUpdated(PreviewOutput previewOutput) =>
//      onUpdatedCallback(previewOutput);
//}
