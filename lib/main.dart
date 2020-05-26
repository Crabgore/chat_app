import 'package:chatapp/themes/custom_theme.dart';
import 'package:chatapp/themes/themes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Chat.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance().then((value) {
    prefs = value;
    if (prefs != null && prefs.get("isDarkTeme") != null) {
      isDarkTheme = prefs.get("isDarkTeme");
    }
  });
  isDarkTheme = isDarkTheme == null ? false : isDarkTheme;

  runApp(CustomTheme(
      initialThemeKey: isDarkTheme ? MyThemeKeys.DARK : MyThemeKeys.LIGHT,
      child: MyApp()));
}

Firestore fireStore = Firestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseUser user;
SharedPreferences prefs;
bool isDarkTheme = false;
bool isPhoneNumberCorrect = false;
String _verificationId;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: CustomTheme.of(context),
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
  bool isCodeSend = false;
  TextEditingController controllerCode = TextEditingController();
  TextEditingController controllerPhoneNumber = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _onVerifyCode() async {
    setState(() {
      isCodeSend = true;
    });
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      auth.signInWithCredential(phoneAuthCredential).then((AuthResult value) {
        if (value.user != null) {
          user = value.user;
          // Handle loogged in state
          print(value.user.phoneNumber);
          if (value.user.displayName != null) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Chat()));
          } else {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Chat()));
          }
        } else {
          showToast("error_validation_otp");
        }
      }).catchError((error) {
        showToast(error.toString());
      });
    };
    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      showToast(authException.message, color: Colors.red);
      setState(() {
        isCodeSend = false;
      });
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      _verificationId = verificationId;
      setState(() {
        _verificationId = verificationId;
      });
    };
    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
      setState(() {
        _verificationId = verificationId;
      });
    };

    // TODO: Change country code

    await auth.verifyPhoneNumber(
        phoneNumber: "+${controllerPhoneNumber.text}",
        timeout: const Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  void showToast(message, {Color color = Colors.black}) {
    print(message);
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _onFormSubmitted() async {
    AuthCredential _authCredential = PhoneAuthProvider.getCredential(
        verificationId: _verificationId, smsCode: controllerCode.text);

    auth.signInWithCredential(_authCredential).then((AuthResult value) {
      if (value.user != null) {
        user = value.user;
        // Handle loogged in state
        print(value.user.phoneNumber);
        if (value.user.displayName != null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Chat()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Chat()));
        }
      } else {
        showToast("error_validation_otp", color: Colors.red);
      }
    }).catchError((error) {
      showToast("something_went_wrong");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Регистрация'),
      ),
      body: isCodeSend
          ? Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Введите код из смс",
                    ),
                    TextField(
                      controller: controllerCode,
                      decoration: InputDecoration(
                          labelText: "Код из смс", hintText: "Код из смс"),
                    ),
                    FlatButton(
                        color: Theme.of(context).accentColor,
                        onPressed: () {
                          _onFormSubmitted();
                        },
                        child: Text(
                          "Подтвердить код",
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
                    Text(
                      "Введите номер телефона",
                    ),
                    TextField(
                      onChanged: (value) {
                        if (value == "8") controllerPhoneNumber.text = "7";
                        setState(() {
                          isPhoneNumberCorrect = value.length > 10;
                        });
                      },
                      controller: controllerPhoneNumber,
                      decoration: InputDecoration(
                          labelText: "Номер телефона", hintText: "+7"),
                    ),
                    Opacity(
                      opacity: isPhoneNumberCorrect ? 1.0 : 0.4,
                      child: FlatButton(
                          color: Colors.blueAccent,
                          key: null,
                          onPressed: () {
                            if (isPhoneNumberCorrect) {
                              setState(() {
                                _onVerifyCode();
                              });
                            }
                          },
                          child: Text(
                            "Получить код",
                          )),
                    )
                  ]),
            ),
    );
  }
}
