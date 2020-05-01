import 'package:flutter/material.dart';
import 'Chat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isCodeSent = false;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Регистрация'),
      ),
      body: isCodeSent
          ? Container(
              padding: const EdgeInsets.all(24),
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      "Введите код из смс",
                      style: new TextStyle(
                          fontSize: 18.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w800,
                          fontFamily: "Roboto"),
                    ),
                    new TextField(
                      controller: controller,
                      decoration: InputDecoration(
                          labelText: "Код из смс", hintText: "Код из смс"),
                      style: new TextStyle(
                          fontSize: 18.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w800,
                          fontFamily: "Roboto"),
                    ),
                    new FlatButton(
                        color: Colors.blueAccent,
                        key: null,
                        onPressed: () {
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return Chat();
                            }));
                          });
                        },
                        child: new Text(
                          "Подтвердить код",
                          style: new TextStyle(
                              fontSize: 18.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w800,
                              fontFamily: "Roboto"),
                        ))
                  ]),
            )
          : Container(
              padding: const EdgeInsets.all(24),
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      "Введите номер телефона",
                      style: new TextStyle(
                          fontSize: 18.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w800,
                          fontFamily: "Roboto"),
                    ),
                    new TextField(
                      controller: controller,
                      decoration: InputDecoration(
                          labelText: "Номер телефона", hintText: "+7"),
                      style: new TextStyle(
                          fontSize: 18.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w800,
                          fontFamily: "Roboto"),
                    ),
                    new FlatButton(
                        color: Colors.blueAccent,
                        key: null,
                        onPressed: () {
                          setState(() {
                            isCodeSent = true;
                            controller.text = "";
                          });
                        },
                        child: new Text(
                          "Получить код",
                          style: new TextStyle(
                              fontSize: 18.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w800,
                              fontFamily: "Roboto"),
                        ))
                  ]),
            ),
    );
  }
}
