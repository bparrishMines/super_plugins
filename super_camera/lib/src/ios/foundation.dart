//import 'dart:async';
//
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/services.dart';
//import 'package:penguin/penguin.dart';
//import 'package:penguin_plugin/penguin_plugin.dart';
//import 'package:penguin_plugin/ios_wrapper.dart';
//import 'package:super_camera/src/common/channel.dart';
//import 'package:super_camera/src/interface/camera_interface.dart';
//
//part 'foundation.ios.penguin.g.dart';
//
//final CallbackHandler _callbackHandler = IosCallbackHandler();
//
//class MediaType {
//  MediaType._();
//
//  static const String video = 'vide';
//}
//
//class CaptureDevicePosition {
//  CaptureDevicePosition._();
//
//  static const int back = 1;
//
//  static const int front = 2;
//}
//
//@Class(IosPlatform(IosType('NSError')))
//class NSError {
//  NSError._();
//
//  static FutureOr onAllocated($NSError wrapper) => throw UnimplementedError();
//}
//
//@Class(IosPlatform(
//  IosType('AVCaptureDeviceInput', import: '<AVFoundation/AVFoundation.h>'),
//))
//class CaptureDeviceInput extends $CaptureDeviceInput {
//  @Constructor()
//  CaptureDeviceInput.initWithDevice(CaptureDevice device, [NSError error])
//      : super(Common.uuid.v4()) {
//    assert(error == null);
//    methodCallStorageHelper.storeAll([
//      ...device.methodCallStorageHelper.methodCalls,
//      $CaptureDeviceInputinitWithDevice(device, null),
//    ]);
//  }
//
//  static FutureOr onAllocated($CaptureDeviceInput wrapper) =>
//      throw UnimplementedError();
//}
//
//@Class(IosPlatform(
//  IosType('AVCaptureSession', import: '<AVFoundation/AVFoundation.h>'),
//))
//class CaptureSession extends $CaptureSession
//    with _AllocationListener<CaptureSession> {
//  @Constructor()
//  CaptureSession() : super(Common.uuid.v4()) {
//    methodCallStorageHelper.store($CaptureSession$Default());
//  }
//
//  bool _isAllocated = false;
//
//  @override
//  void addOnAllocatedCallback(AllocationCallback<CaptureSession> callback) {
//    super.addOnAllocatedCallback(callback);
//    if (_isAllocated) {
//      getAndClearAllocatedCalls().then(
//        (List<MethodCall> methodCalls) => invoke<void>(
//          Common.channel,
//          methodCalls,
//        ),
//      );
//    }
//  }
//
//  @Method()
//  Future<void> startRunning() {
//    final Completer<void> completer = Completer<void>();
//    final bool wasAllocated = _isAllocated;
//
//    getAndClearAllocatedCalls()
//        .then(
//          (List<MethodCall> methodCalls) => invoke<void>(Common.channel, [
//            if (!wasAllocated) ...methodCallStorageHelper.methodCalls,
//            if (!wasAllocated) allocate(),
//            ...methodCalls,
//            $startRunning(),
//          ]),
//        )
//        .then((_) => completer.complete());
//
//    _isAllocated = true;
//
//    return completer.future;
//  }
//
//  @Method()
//  void addInput(CaptureDeviceInput input) {
//    addOnAllocatedCallback(
//      (CaptureSession session) async => <MethodCall>[
//        ...input.methodCallStorageHelper.methodCalls,
//        input.allocate(),
//        $addInput(input),
//      ],
//    );
//  }
//
//  static FutureOr onAllocated($CaptureSession wrapper) =>
//      throw UnimplementedError();
//
//  @override
//  CaptureSession get self => this;
//}
//
//@Class(IosPlatform(
//  IosType('AVCaptureDevice', import: '<AVFoundation/AVFoundation.h>'),
//))
//class CaptureDevice extends $CaptureDevice implements CameraDescription {
//  CaptureDevice._({
//    @required String uniqueId,
//    this.uniqueID,
//    this.position,
//  }) : super(uniqueId);
//
//  @Field()
//  final String uniqueID;
//
//  @Field()
//  @int64
//  final int position;
//
//  @Method()
//  static Future<Array<CaptureDevice>> devicesWithMediaType(String mediaType) {
//    final $Array<CaptureDevice> array = $Array<CaptureDevice>(Common.uuid.v4());
//
//    array.methodCallStorageHelper.storeAll([
//      $CaptureDevice.$devicesWithMediaType(mediaType, array.uniqueId),
//    ]);
//
//    return Array.onAllocated<CaptureDevice>(array);
//  }
//
//  static FutureOr<CaptureDevice> onAllocated($CaptureDevice wrapper) async {
//    final List<dynamic> results = await invokeForAll(Common.channel, [
//      ...wrapper.methodCallStorageHelper.methodCalls,
//      wrapper.$uniqueID(),
//      wrapper.$position(),
//    ]);
//
//    final CaptureDevice device = CaptureDevice._(
//      uniqueId: wrapper.uniqueId,
//      uniqueID: results[results.length - 2],
//      position: results[results.length - 1],
//    );
//
//    device.methodCallStorageHelper
//        .storeAll(wrapper.methodCallStorageHelper.methodCalls);
//    return device;
//  }
//
//  @override
//  LensDirection get direction {
//    switch (position) {
//      case CaptureDevicePosition.front:
//        return LensDirection.front;
//      case CaptureDevicePosition.back:
//        return LensDirection.back;
//    }
//
//    throw UnsupportedError('Position of value $position is not supported.');
//  }
//
//  @override
//  String get name => uniqueID;
//}
//
//@Class(IosPlatform(IosType('NSArray')))
//class Array<T> extends $Array<T> {
//  Array._(String uniqueId, this.count, this._wrappers) : super(uniqueId);
//
//  @Field()
//  @int64
//  final int count;
//
//  final List<T> _wrappers;
//
//  @Method()
//  T objectAtIndex(@int64 int index) => _wrappers[index];
//
//  List<T> toList() => List<T>.of(_wrappers);
//
//  static FutureOr<Array<S>> onAllocated<S>($Array array) async {
//    if (isTypeOf<S, Wrapper>()) {
//      final int count = await invoke<int>(Common.channel, [
//        ...array.methodCallStorageHelper.methodCalls,
//        array.$count(),
//      ]);
//
//      final List<S> wrappers = <S>[];
//
//      for (int i = 0; i < count; i++) {
//        final Wrapper newWrapper =
//            _GenericHelper.getWrapperForType<S>(Common.uuid.v4());
//
//        newWrapper.methodCallStorageHelper.storeAll([
//          ...array.methodCallStorageHelper.methodCalls,
//          array.$objectAtIndex(i, newWrapper.uniqueId),
//        ]);
//
//        wrappers.add(await _GenericHelper.onAllocated(newWrapper));
//      }
//
//      final Array<S> resultArray = Array<S>._(array.uniqueId, count, wrappers);
//      resultArray.methodCallStorageHelper
//          .storeAll(array.methodCallStorageHelper.methodCalls);
//      return resultArray;
//    }
//
//    throw UnimplementedError();
//  }
//}
//
//class ViewWidget extends StatefulWidget {
//  ViewWidget(this.view) : assert(view != null) {
//    Common.callbackHandler = _callbackHandler;
//  }
//
//  final View view;
//
//  @override
//  State<StatefulWidget> createState() => _ViewWidgetState();
//}
//
//class _ViewWidgetState extends State<ViewWidget> {
//  @override
//  void dispose() {
//    super.dispose();
//    invoke<void>(Common.channel, [widget.view.deallocate()]);
//    _callbackHandler.removeWrapper(widget.view);
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    _callbackHandler.addWrapper(widget.view);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    final View view = widget.view;
//    if (view._isCreated) {
//      invoke<void>(Common.channel, [
//        ...view.methodCallStorageHelper.methodCalls,
//        view.$layer($newUniqueId: widget.view.layer.uniqueId),
//        ...view.layer.methodCallStorageHelper.methodCalls,
//      ]);
//      widget.view.methodCallStorageHelper.clearMethodCalls();
//      widget.view.layer.methodCallStorageHelper.clearMethodCalls();
//    }
//    return UiKitView(
//      viewType: '${Common.channel.name}/views',
//      creationParams: view.uniqueId,
//      creationParamsCodec: const StandardMessageCodec(),
//    );
//  }
//}
//
//@Class(IosPlatform(IosType('CAMAutoresizeLayerView', import: '"SuperCameraPlugin.h"')))
//class View extends $View {
//  @Constructor()
//  View.initWithFrame([CGRect frame]) : super(Common.uuid.v4());
//
//  bool _isCreated = false;
//
//  @Field()
//  final Layer layer = Layer._(Common.uuid.v4());
//
//  @override
//  FutureOr<Iterable<MethodCall>> onCreateView(CGRect frame) {
//    final List<MethodCall> methodCalls = methodCallStorageHelper.methodCalls;
//    final List<MethodCall> layerMethodCalls =
//        layer.methodCallStorageHelper.methodCalls;
//    methodCallStorageHelper.clearMethodCalls();
//    layer.methodCallStorageHelper.clearMethodCalls();
//
//    _isCreated = true;
//    return <MethodCall>[
//      $ViewinitWithFrame(frame),
//      $layer($newUniqueId: layer.uniqueId),
//      ...methodCalls,
//      ...layerMethodCalls,
//      allocate(),
//    ];
//  }
//
//  static FutureOr onAllocated($View wrapper) => throw UnimplementedError();
//}
//
//@Class(IosPlatform(IosType('AVCaptureVideoPreviewLayer',
//    import: '<AVFoundation/AVFoundation.h>')))
//class CaptureVideoPreviewLayer extends $CaptureVideoPreviewLayer
//    implements Layer {
//  @Constructor()
//  CaptureVideoPreviewLayer() : super(Common.uuid.v4()) {
//    methodCallStorageHelper.store($CaptureVideoPreviewLayer$Default());
//  }
//
//  @Field()
//  set session(CaptureSession session) {
//    if (session != null && !session._isAllocated) {
//      session.addOnAllocatedCallback(
//        (CaptureSession session) async => <MethodCall>[
//          //$session(session: session),
//        ],
//      );
//    }
//
//    session?.addOnDeallocatedCallback(
//      (CaptureSession session) async => <MethodCall>[
//        deallocate(),
//      ],
//    );
//
//    methodCallStorageHelper.replaceAll(<MethodCall>[
//      allocate(),
//      $session(session: session),
//    ]);
//  }
//
//  @override
//  void addSublayer(Layer layer) => throw UnimplementedError();
//
//  static FutureOr onAllocated($CaptureVideoPreviewLayer wrapper) =>
//      throw UnimplementedError();
//}
//
//@Class(IosPlatform(IosType('CALayer')))
//class Layer extends $Layer {
//  Layer._(String uniqueId) : super(uniqueId);
//
//  @Method()
//  void addSublayer(Layer layer) {
//    methodCallStorageHelper.storeAll([
//      ...layer.methodCallStorageHelper.methodCalls,
//      $addSublayer(layer),
//    ]);
//  }
//
//  static FutureOr onAllocated($Layer wrapper) => throw UnimplementedError();
//}
//
//typedef AllocationCallback<T> = Future<Iterable<MethodCall>> Function(T caller);
//
//abstract class _AllocationListener<T> {
//  T get self;
//
//  final List<AllocationCallback<T>> _onAllocatedCallbacks =
//      <AllocationCallback<T>>[];
//  final List<AllocationCallback<T>> _onDeallocatedCallbacks =
//      <AllocationCallback<T>>[];
//
//  @mustCallSuper
//  void addOnAllocatedCallback(AllocationCallback<T> callback) {
//    _onAllocatedCallbacks.add(callback);
//  }
//
//  @mustCallSuper
//  void addOnDeallocatedCallback(AllocationCallback<T> callback) {
//    _onDeallocatedCallbacks.add(callback);
//  }
//
//  static Future<List<MethodCall>> _getAndClear<S>(
//    List<AllocationCallback<S>> callbacks,
//    S object,
//  ) async {
//    final Iterable<Future<Iterable<MethodCall>>> futures =
//        callbacks.map<Future<Iterable<MethodCall>>>(
//      (AllocationCallback<S> callback) =>
//          callback(object) ??
//          Future<Iterable<MethodCall>>.value(<MethodCall>[]),
//    );
//
//    final List<Iterable<MethodCall>> methodCallIterables =
//        await Future.wait<Iterable<MethodCall>>(futures);
//
//    callbacks.clear();
//
//    return methodCallIterables.fold<List<MethodCall>>(
//      <MethodCall>[],
//      (List<MethodCall> previous, Iterable<MethodCall> next) =>
//          previous..addAll(next),
//    );
//  }
//
//  Future<List<MethodCall>> getAndClearAllocatedCalls() =>
//      _getAndClear<T>(_onAllocatedCallbacks, self);
//
//  Future<List<MethodCall>> getAndClearDeallocatedCalls() =>
//      _getAndClear<T>(_onDeallocatedCallbacks, self);
//}
