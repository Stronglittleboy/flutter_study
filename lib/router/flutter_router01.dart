import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);
/*简单路由页面跳转*/
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyTextButton(),
          ),
        )
    );
  }
}

class MyTextButton extends StatefulWidget{

  @override
  State createState() => PageRouterState();
}

class PageRouterState extends State<MyTextButton>{

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Text("跳转到第二个页面"),
        onPressed: () {
          //导航到新路由
          Navigator.push( context,
              MaterialPageRoute(builder: (context) {
                return NewRoute();
              }));
        });
  }
}


class NewRoute extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的新页面"),
      ),
      body:Center(
        child: Text("我的第二个页面"),
      ),
    );
  }
}