import 'package:flutter/foundation.dart';
import 'package:reference/reference.dart';

import '../common.dart';
import 'camerax.dart';

class RemoteHandler extends MethodChannelRemoteHandler {
  RemoteHandler() : super('$baseChannelName/camerax');

  @override
  List<Object> getCreationArguments(LocalReference localReference) {
    switch (localReference.referenceType) {
      case Preview:
        return <Object>[];
      case ProcessCameraProvider:
        return <Object>[];
      case CameraSelector:
        final CameraSelector value = localReference;
        return <Object>[value.lensFacing];
      case SuccessListener:
        return <Object>[];
      default:
        throw ArgumentError.value(localReference);
    }
  }
}

class LocalHandler with LocalReferenceCommunicationHandler {
  const LocalHandler({@required this.createCamera})
      : assert(createCamera != null);

  final Camera Function() createCamera;

  @override
  LocalReference create(
    ReferencePairManager referencePairManager,
    Type referenceType,
    List<Object> arguments,
  ) {
    if (referenceType == Camera) {
      return createCamera();
    }

    throw ArgumentError.value(referenceType);
  }

  @override
  Object invokeMethod(
    ReferencePairManager referencePairManager,
    LocalReference localReference,
    String methodName,
    List<Object> arguments,
  ) {
    if (localReference is SuccessListener) {
      switch (methodName) {
        case 'onSuccess':
          localReference.onSuccess();
          return null;
        case 'onError':
          localReference.onError(arguments[0], arguments[1]);
          return null;
      }
    }
    throw ArgumentError.value(<Object>[localReference, methodName]);
  }
}

// TODO Object<?> java
class CameraXManager extends MethodChannelReferencePairManager {
  CameraXManager(this.localHandler)
      : assert(localHandler != null),
        super(
          <Type>[
            Camera,
            ProcessCameraProvider,
            CameraSelector,
            Preview,
            SuccessListener,
          ],
          '$baseChannelName/camerax',
        );

  @override
  final LocalReferenceCommunicationHandler localHandler;

  @override
  MethodChannelRemoteHandler get remoteHandler => RemoteHandler();
}
