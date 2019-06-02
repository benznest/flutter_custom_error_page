import 'dart:async';

import 'package:flutter/services.dart';

class FlutterCustomErrorPage {
  static const MethodChannel _channel =
      const MethodChannel('flutter_custom_error_page');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
