import 'package:flutter/material.dart';
import 'package:flutter_custom_error_page/error_message.dart';

class BlueScreenErrorMessageTheme {

  static Widget build(ErrorMessage errorMessage) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: ListView(scrollDirection: Axis.vertical,
            children: <Widget>[Container(padding: EdgeInsets.only(top: 24),
                color: Color(0xff2067b2),
                child: Column(
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
                      Container(
                          constraints: BoxConstraints(minWidth: double.infinity),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              textDirection: TextDirection.ltr,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 32),
                                  child: Text(
                                    "):",
                                    textDirection: TextDirection.ltr,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.white, fontSize: 100, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.all(12),
                                    constraints: BoxConstraints(minWidth: double.infinity),
                                    child: Text(
                                      errorMessage.exception,
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(color: Colors.white, fontSize: 18),
                                    )),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                                  child: Text(
                                    errorMessage.title,
                                    textDirection: TextDirection.ltr,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.white, fontSize: 36),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Text(
                                    errorMessage.message,
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(color: Colors.white, fontSize: 16),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                                  child: Text(
                                    errorMessage.info,
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(color: Colors.white, fontSize: 16),
                                  ),
                                )
                              ])),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Column(children: buildRowStacktraceWidget(errorMessage),
                          textDirection: TextDirection.ltr,),
                      )
                    ]))
            ]));
  }

  static List<Widget> buildRowStacktraceWidget(ErrorMessage errorMessage) {
    List<Widget> listWidget = List();
    for (RowErrorStacktrace row in errorMessage.stacktrace) {
      listWidget.add(Container(padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: Color(0xff4ba5e1)),
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Container(padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(row.number, style: TextStyle(color: Colors.blue))),
                Expanded(child: Text(row.message,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold)))
              ]),
              Text(row.message,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.8))),
              Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(row.package,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(fontSize: 16, color: Colors.white))),
              Row(children: <Widget>[
                Spacer(),
                Container(padding: EdgeInsets.all(6),
                  margin: EdgeInsets.only(top: 6),
                  decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text("line " + row.line,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(fontSize: 16, color: Color(0xff2067b2))),
                )
              ],)
            ]),
      ));
    }
    return listWidget;
  }
}