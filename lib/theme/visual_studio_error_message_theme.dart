import 'package:flutter/material.dart';
import 'package:flutter_custom_error_page/error_message.dart';

class VisualStudioErrorMessageTheme {
  static Widget build(ErrorMessage errorMessage) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 24),
              color: Color(0xffeeeeee),
              child:
                  Column(textDirection: TextDirection.ltr, children: <Widget>[
                Container(
                    constraints: BoxConstraints(minWidth: double.infinity),
                    color: Color(0xffdce2e4),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textDirection: TextDirection.ltr,
                        children: <Widget>[
                          Container(
                              color: Color(0xffbcc8d5),
                              padding: EdgeInsets.all(8),
                              constraints:
                                  BoxConstraints(minWidth: double.infinity),
                              child: Text(
                                errorMessage.exception,
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16),
                            child: Text(
                              errorMessage.title,
                              textDirection: TextDirection.ltr,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 36),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              errorMessage.message,
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16),
                            child: Text(
                              errorMessage.info,
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16),
                            ),
                          )
                        ])),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    children: buildRowStacktraceWidget(errorMessage),
                    textDirection: TextDirection.ltr,
                  ),
                )
              ]))
        ]));
  }

  static List<Widget> buildRowStacktraceWidget(ErrorMessage errorMessage) {
    List<Widget> listWidget = List();
    for (RowErrorStacktrace row in errorMessage.stacktrace) {
      listWidget.add(Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white),
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Column(children: <Widget>[
          Row(children: <Widget>[
            Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Colors.yellow[200],
                    borderRadius: BorderRadius.circular(8)),
                child: Text(row.number,
                    style: TextStyle(color: Colors.grey[800]))),
            Expanded(
                child: Text(row.message,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 22,
                        color: Color(0xff6eb1ee),
                        fontWeight: FontWeight.bold)))
          ]),
          Text(row.message,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontSize: 16, color: Color(0xff6eb1ee).withOpacity(0.8))),
          Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(row.package,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(fontSize: 16, color: Colors.black54))),
          Row(
            children: <Widget>[
              Spacer(),
              Container(
                padding: EdgeInsets.all(6),
                margin: EdgeInsets.only(top: 6),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8)),
                child: Text("line " + row.line,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontSize: 16, color: Colors.black54)),
              )
            ],
          )
        ]),
      ));
    }
    return listWidget;
  }
}
