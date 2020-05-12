import 'package:chatapp/OneChat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class CreateChat extends StatefulWidget {
  @override
  _CreateChatState createState() => new _CreateChatState();
}

class _CreateChatState extends State<CreateChat> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  createNewChat() {
    var title = controller.text;

    Map<String, dynamic> newChat = {
      "id" : title,
      "title" : title,
    };

    fireStore.collection("chats").document(title).setData(newChat).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) {
            return OneChat(title);
          }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Создать новый чат'),
      ),
      body: Container(
          padding: const EdgeInsets.all(24),
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Введите название чата",
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w800,
                      fontFamily: "Roboto"),
                ),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      labelText: "Введите название чата",
                      hintText: "название чата"),
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w800,
                      fontFamily: "Roboto"),
                ),
                FlatButton(
                    color: Colors.blueAccent,
                    key: null,
                    onPressed: () {
                      createNewChat();
                    },
                    child: new Text(
                      "Создать",
                      style: new TextStyle(
                          fontSize: 18.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w800,
                          fontFamily: "Roboto"),
                    ))
              ])),
    );
  }
}
