import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_custom_error_page/flutter_custom_error_message.dart';

class ForceError {
  ForceError() {
    assert(1==2 && false ,"Hello This is a force error time. ");
  }

  ForceError.test() {
    throw Exception("Hello This is a force error time.");
  }
}


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    ErrorWidget.builder = ErrorMessageBuilder.build(theme: ErrorTheme.BlueScreen);

    return MaterialApp(
      builder: (BuildContext context, Widget widget) {
        ErrorWidget.builder = ErrorMessageBuilder.build(theme: ErrorTheme.BlueScreen);
        return widget;
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text(null),
        ),
        body: Container(),
      ),
    );
  }

  void onTapp() {

  }
}
