import 'package:flutter/foundation.dart';
import 'package:reference/reference.dart';

import '../common.dart';
import 'foundation.dart';

class RemoteHandler extends MethodChannelRemoteHandler {
  RemoteHandler() : super('$baseChannelName/foundation');

  @override
  List<Object> getCreationArguments(LocalReference localReference) {
    switch (localReference.referenceType) {
      case Foundation:
        return <Object>[];
      case CaptureDeviceInput:
        final CaptureDeviceInput value = localReference;
        return <Object>[value.device];
      case CaptureSession:
        final CaptureSession value = localReference;
        return <Object>[value.inputs];
      case CaptureDevice:
        final CaptureDevice value = localReference;
        return <Object>[value.uniqueId, value.position];
      case Preview:
        final Preview value = localReference;
        return <Object>[value.session];
      default:
        throw ArgumentError.value(localReference);
    }
  }
}

class LocalHandler with LocalReferenceCommunicationHandler {
  @override
  LocalReference create(
    ReferencePairManager referencePairManager,
    Type referenceType,
    List<Object> arguments,
  ) {
    if (referenceType == CaptureDevice) {
      return CaptureDevice(arguments[0], arguments[1]);
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
    throw ArgumentError.value(<Object>[localReference, methodName]);
  }
}

class FoundationManager extends MethodChannelReferencePairManager {
  FoundationManager()
      : super(
          <Type>[
            Foundation,
            CaptureDeviceInput,
            CaptureSession,
            CaptureDevice,
            Preview,
          ],
          '$baseChannelName/foundation',
        );

  @override
  LocalReferenceCommunicationHandler get localHandler => LocalHandler();

  @override
  MethodChannelRemoteHandler get remoteHandler => RemoteHandler();
}
