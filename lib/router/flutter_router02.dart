import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);
/*简单路由页面跳转 传值*/
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
        onPressed: () async {
          //导航到新路由
          var result = Navigator.push( context,
              MaterialPageRoute(builder: (context) {
                return NewRoute(text: "老子是鼎天",);
              }));
          print("返回值的参数:$result");
        });
  }
}


class NewRoute extends StatelessWidget{

  final String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("页面传值"),
      ),
      body:Center(
        child: Column(
          children: [
            Text((text)),
            RaisedButton(onPressed: ()=>Navigator.pop(context,"返回参数携带"),
            child: Text("返回"),)
          ],
        )
      ),
    );
  }

  NewRoute({@required this.text});
}