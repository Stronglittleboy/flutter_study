import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter study',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  String userName;
  String passWord;

  void login() {
    var loginFrom = loginKey.currentState;
    if (loginFrom.validate()) {
      loginFrom.save();
      print('userName' + userName + 'password' + passWord);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(children: [
        Container(
          constraints: // 容器的大小将被限制在[100*100 ~ 200*200]内
              BoxConstraints(
            minWidth: 100,
            maxWidth: 200,
            minHeight: 100,
            maxHeight: 200,
          ),
          alignment: Alignment.center,
          child: Form(
              key: loginKey,
              child: Column(
                children: [
                  Image(image: AssetImage("images/touxiang.png")),
                  TextFormField(
                    decoration: InputDecoration(labelText: "请输入用户名称"),
                    onSaved: (value) {
                      userName = value;
                    },
                    onFieldSubmitted: (value) {},
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "请输入密码"),
                    obscureText: true,
                    validator: (value) {
                      return value.length < 6 ? "密码长度不能小于6位" : null;
                    },
                    onSaved: (value) {
                      passWord = value;
                    },
                  ),
                  new RaisedButton(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      "点击",
                      textAlign: TextAlign.left,
                    ),
                    onPressed: () {
                      print('测试');
                    },
                  )
                ],
              )),
        )
      ]),
    ));
  }
}
