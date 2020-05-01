import 'package:flutter/material.dart';

class OneChat extends StatefulWidget {
  @override
  _OneChatState createState() => new _OneChatState();
}

class _OneChatState extends State<OneChat> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Имя собеседника'),
      ),
      body: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Wrap(
                    children: <Widget>[
                      new Text(
                        "Привет! Как дела?",
                        style: new TextStyle(
                            fontSize: 14.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto"),
                      )
                    ],
                  ))
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Wrap(
                    children: <Widget>[
                      new Text(
                        "Да вроде ничего. Сам как?",
                        style: new TextStyle(
                            fontSize: 14.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto"),
                      )
                    ],
                  ))
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Wrap(
                    children: <Widget>[
                      new Text(
                        "И у меня нормально",
                        style: new TextStyle(
                            fontSize: 14.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto"),
                      )
                    ],
                  ))
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Wrap(
                    children: <Widget>[
                      new Text(
                        "Очень интересный и креативный дилог",
                        style: new TextStyle(
                            fontSize: 14.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto"),
                      )
                    ],
                  ))
            ])
          ]),
    );
  }
}
