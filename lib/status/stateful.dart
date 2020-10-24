import 'package:flutter/material.dart';

import '../main.dart';

main() {
  runApp(new MaterialApp(
    title: "我的第一个APP",
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Material(
      child:Center(
        child: Text("我的按钮"),
      ),
    );
  }
}