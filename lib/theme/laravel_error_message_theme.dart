import 'package:flutter/material.dart';
import 'package:flutter_custom_error_page/error_message.dart';

class LaravelErrorMessageTheme {
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
                    color: Color(0xff2a2a2a),
                    padding: EdgeInsets.all(24),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textDirection: TextDirection.ltr,
                        children: <Widget>[
                          Text(
                            errorMessage.exception,
                            textDirection: TextDirection.ltr,
                            style:
                                TextStyle(color: Colors.red[300], fontSize: 18),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              errorMessage.title,
                              textDirection: TextDirection.ltr,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.grey[200], fontSize: 36),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              errorMessage.message,
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  color: Colors.grey[300], fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              errorMessage.info,
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  color: Colors.yellow[300], fontSize: 16),
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
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8)),
                child: Text(row.number,
                    style: TextStyle(color: Colors.grey[500]))),
            Expanded(
                child: Text(row.message,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold)))
          ]),
          Text(row.message,
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 16, color: Colors.black26)),
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
