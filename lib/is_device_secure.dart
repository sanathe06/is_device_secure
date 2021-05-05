import 'dart:async';

import 'package:flutter/services.dart';

class IsDeviceSecure {
  static const MethodChannel _channel = const MethodChannel('is_device_secure');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<bool?> get secure async {
    final bool? isSecured = await _channel.invokeMethod("isSecure");
    return isSecured;
  }
}
