import 'package:chatapp/OneChat.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => new _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Сам чат'),
        ),
        body: new ListView(
          itemExtent: 80,
          padding: EdgeInsets.all(24),
          children: <Widget>[
            new GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return OneChat();
                }));
              },
              child: new Container(
                  margin: EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      border: Border.all(color: Colors.blueAccent)),
                  child: Column(children: <Widget>[
                    new Text(
                      "Название чата",
                      style: new TextStyle(
                          fontSize: 16.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w600,
                          fontFamily: "Roboto"),
                    ),
                    new Text(
                      "Сообщение чата",
                      style: new TextStyle(
                          fontSize: 14.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto"),
                    ),
                  ])),
            ),
            new GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return OneChat();
                }));
              },
              child: new Container(
                  margin: EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      border: Border.all(color: Colors.blueAccent)),
                  child: Column(children: <Widget>[
                    new Text(
                      "Название чата",
                      style: new TextStyle(
                          fontSize: 16.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w600,
                          fontFamily: "Roboto"),
                    ),
                    new Text(
                      "Сообщение чата",
                      style: new TextStyle(
                          fontSize: 14.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto"),
                    ),
                  ])),
            ),
            new GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return OneChat();
                }));
              },
              child: new Container(
                  margin: EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      border: Border.all(color: Colors.blueAccent)),
                  child: Column(children: <Widget>[
                    new Text(
                      "Название чата",
                      style: new TextStyle(
                          fontSize: 16.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w600,
                          fontFamily: "Roboto"),
                    ),
                    new Text(
                      "Сообщение чата",
                      style: new TextStyle(
                          fontSize: 14.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto"),
                    ),
                  ])),
            ),
            new GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return OneChat();
                  }));
                },
                child: new Container(
                    margin: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        border: Border.all(color: Colors.blueAccent)),
                    child: Column(children: <Widget>[
                      new Text(
                        "Название чата",
                        style: new TextStyle(
                            fontSize: 16.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w600,
                            fontFamily: "Roboto"),
                      ),
                      new Text(
                        "Сообщение чата",
                        style: new TextStyle(
                            fontSize: 14.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto"),
                      ),
                    ])))
          ],
        ));
  }
}
