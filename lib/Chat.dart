import 'package:chatapp/CreateChat.dart';
import 'package:chatapp/OneChat.dart';
import 'package:chatapp/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => new _ChatState();
}

class _ChatState extends State<Chat> {
  List<Map<String, dynamic>> chatsData = [];

  @override
  void initState() {
    fireStore
        .collection("chats")
//        .where("prvate", isEqualTo: true)
        .snapshots()
        .listen((event) {
      List<Map<String, dynamic>> data = [];
//      //только новые
//      event.documentChanges.forEach((element) {
//        if (element.type == DocumentChangeType.added) {
//          data.add(element.document.data);
//        }
//      });
//      //измененные
//      event.documentChanges.forEach((element) {
//        if (element.type == DocumentChangeType.modified) {
//          data.insert(data.indexOf(element.document.data), element.document.data);
//        }
//      });
//      //удалённые
//      event.documentChanges.forEach((element) {
//        if (element.type == DocumentChangeType.removed) {
//          data.remove(element.document.data);
//        }
//      });
      //все чаты
      event.documents.forEach((documentSnapshot) {
        data.add(documentSnapshot.data);
      });
      setState(() {
        chatsData = data;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Сам чат'),
      ),
      body: Center(
        child: chatsData.isEmpty
            ? Text("Loading...")
            : ListView.builder(
                itemCount: chatsData.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildChat(context,
                      id: chatsData[index]["id"],
                      title: chatsData[index]["title"].toString(),
                      isPrivate: chatsData[index]["privacy"]);
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return CreateChat();
          }));
        },
      ),
    );
  }

  Widget buildChat(BuildContext context,
      {String id,
      String title = "Название чата",
      String message = "Последнее сообщение",
      bool isPrivate = false}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return OneChat(id);
        }));
      },
      child: Container(
          height: 45,
          margin: EdgeInsets.all(8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white10,
              border: Border.all(color: Colors.blueAccent)),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w600,
                        fontFamily: "Roboto"),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
//                child: isPrivate ? Icon(Icons.lock) : Container(),
              ),
            ],
          )),
    );
  }
}
