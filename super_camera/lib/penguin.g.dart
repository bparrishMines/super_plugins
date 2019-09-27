// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// PenguinGenerator
// **************************************************************************
import 'package:flutter/services.dart';

class $Camera extends $Wrapper {
  $Camera(String $uniqueId) : super($uniqueId);

  static MethodCall $getNumberOfCameras(
    String $newUniqueId,
  ) {
    return MethodCall(
      'Camera#getNumberOfCameras',
      <String, dynamic>{
        r'$newUniqueId': $newUniqueId,
      },
    );
  }

  @override
  String get $platformClassName => 'Camera';
}

abstract class $Wrapper {
  $Wrapper(this.$uniqueId);

  final String $uniqueId;

  String get $platformClassName;

  MethodCall $allocate() {
    return MethodCall(
      '${$platformClassName}#allocate',
      <String, String>{r'$uniqueId': $uniqueId},
    );
  }

  MethodCall $deallocate() {
    return MethodCall(
      '${$platformClassName}#deallocate',
      <String, String>{r'$uniqueId': $uniqueId},
    );
  }
}

Future<List<dynamic>> $invoke(
  MethodChannel channel,
  List<MethodCall> methodCalls,
) {
  final List<Map<String, dynamic>> calls = methodCalls
      .map<Map<String, dynamic>>(
        (MethodCall methodCall) => <String, dynamic>{
          'method': methodCall.method,
          'arguments': methodCall.arguments,
        },
      )
      .toList();

  return channel.invokeListMethod<dynamic>('MultiInvoke', calls);
}
