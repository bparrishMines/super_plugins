import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:super_camera/super_camera.dart';

void main() {
  const MethodChannel channel = MethodChannel('super_camera');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await SuperCamera.platformVersion, '42');
  });
}
