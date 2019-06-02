import 'package:flutter/foundation.dart';

class RowErrorStacktrace {
  String number;
  String message;
  String package;
  String line;

  RowErrorStacktrace(
      {this.number = "", this.message = "", this.package = "", this.line = ""});
}

class ErrorMessage {
  String exception;
  String title;
  String message;
  String info;
  List<RowErrorStacktrace> stacktrace;

  ErrorMessage(FlutterErrorDetails errorDetails) {
    List<String> listStacktrace = errorDetails.stack.toString().split("\n");
    title =
        errorDetails.toString(minLevel: DiagnosticLevel.debug).split("\n")[2];
    message =
        errorDetails.toString(minLevel: DiagnosticLevel.info).split("\n")[3];
    info = errorDetails.toString(minLevel: DiagnosticLevel.info).split("\n")[5];
    exception = errorDetails.toStringShort();
    stacktrace = List();

    for (String stacktrace in listStacktrace) {
      List<String> msg = stacktrace.split("     ");
      if (msg.length > 1) {
        RowErrorStacktrace stack = RowErrorStacktrace();
        stack.package = stacktrace.split(" ").last;

        stack.number = msg[0];
        stack.message = msg[1];
        List<String> msgLine = stacktrace.split(":");
        stack.line = msgLine[msgLine.length - 2];

        this.stacktrace.add(stack);
      }
    }
  }
}
