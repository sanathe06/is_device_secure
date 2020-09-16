import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:is_device_secure/is_device_secure.dart';

void main() {
  const MethodChannel channel = MethodChannel('is_device_secure');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await IsDeviceSecure.platformVersion, '42');
  });
}
