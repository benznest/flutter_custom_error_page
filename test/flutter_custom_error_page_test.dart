import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_custom_error_page/flutter_custom_error_page.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_custom_error_page');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterCustomErrorPage.platformVersion, '42');
  });
}
