import 'package:flutter/services.dart';
import 'package:penguin_plugin/penguin_plugin.dart';
import 'package:uuid/uuid.dart';

/// INTERNAL ONLY CLASS
// Specifies the MethodChannel for Android and iOS. Also, specifies the message
// for a deallocated object.
class Common {
  static final Uuid uuid = Uuid();

  static final MethodChannel channel = const MethodChannel(
    'super_plugins/super_camera',
  )..setMethodCallHandler(
      (MethodCall call) => PenguinPlugin.methodCallHandler(channel)(call),
    );

  static String deallocatedMsg(dynamic object) =>
      'This `${object.runtimeType}` is no longer in memory.';
}
