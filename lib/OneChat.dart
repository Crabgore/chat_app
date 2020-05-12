import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'main.dart';

class OneChat extends StatefulWidget {
  final String id;

  OneChat(this.id);

  @override
  _OneChatState createState() => new _OneChatState(id);
}

class _OneChatState extends State<OneChat> {
  TextEditingController controller = TextEditingController();
  final String id;
  List<Map<String, dynamic>> chatData = [];

  _OneChatState(this.id);

  @override
  void initState() {
    fireStore
        .collection("chats")
        .document(id)
        .collection("messages")
        .snapshots()
        .listen((event) {
      List<Map<String, dynamic>> data = [];
      event.documents.forEach((documentSnapshot) {
        data.add(documentSnapshot.data);
      });
      setState(() {
        data.sort((a, b) {
          var aDate = a["date"];
          var bDate = b["date"];
          return aDate.compareTo(bDate);
        });
        chatData = data;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Имя собеседника'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemCount: chatData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildRow(chatData[index]);
                  }),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 10,
                  child: Container(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(hintText: "сообщение"),
                      style: new TextStyle(
                          fontSize: 18.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w800,
                          fontFamily: "Roboto"),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      child: FlatButton(
                          color: Colors.blueAccent,
                          key: null,
                          onPressed: () {
                            setState(() {
                              sendMessage();
                            });
                          },
                          child: Icon(Icons.arrow_forward))),
                )
              ],
            )
          ],
        ));
  }

  Row buildRow(Map<String, dynamic> chatData) {
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm').format(chatData["date"].toDate());
    return chatData["author"]
        ? Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Wrap(
                  children: <Widget>[
                    new Text(
                      chatData["message"] + "\n(" + formattedDate + ")",
                      style: new TextStyle(
                          fontSize: 14.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto"),
                    )
                  ],
                ))
          ])
        : Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Wrap(
                  children: <Widget>[
                    new Text(
                      chatData["message"],
                      style: new TextStyle(
                          fontSize: 14.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto"),
                    )
                  ],
                ))
          ]);
  }

  void sendMessage() {
    DateTime now = DateTime.now();

    Map<String, dynamic> data = {
      "author": true,
      "message": controller.text,
      "date": now
    };

    fireStore.collection("chats").document(id).collection("messages").add(data);
    controller.text = "";
  }
}
