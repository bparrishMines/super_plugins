import 'package:reference/reference.dart';

import 'camera1.dart';
import '../common.dart';

class RemoteHandler extends MethodChannelRemoteHandler {
  RemoteHandler() : super('$baseChannelName/camera1');

  @override
  List<Object> getCreationArguments(LocalReference localReference) {
    switch (localReference.referenceType) {
      case Camera1:
        return <Object>[];
      case Camera:
        return <Object>[];
      case CameraInfo:
        final CameraInfo value = localReference;
        return <Object>[value.cameraId, value.facing, value.orientation];
      default:
        throw ArgumentError.value(localReference);
    }
  }
}

class LocalHandler with LocalReferenceCommunicationHandler {
  const LocalHandler(this.createCamera);

  final Camera Function() createCamera;

  @override
  LocalReference create(
    ReferencePairManager referencePairManager,
    Type referenceType,
    List<Object> arguments,
  ) {
    if (referenceType == Camera) {
      return createCamera();
    } else if (referenceType == CameraInfo) {
      return CameraInfo(
        cameraId: arguments[0],
        facing: arguments[1],
        orientation: arguments[2],
      );
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

class Camera1Manager extends MethodChannelReferencePairManager {
  Camera1Manager(this.localHandler)
      : super(
          <Type>[Camera1, Camera, CameraInfo],
          '$baseChannelName/camera1',
        );

  @override
  final LocalHandler localHandler;

  @override
  MethodChannelRemoteHandler get remoteHandler => RemoteHandler();
}
