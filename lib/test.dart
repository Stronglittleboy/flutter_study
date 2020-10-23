import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

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
        body: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 30.0,
          padding: const EdgeInsets.all(10.0),
          crossAxisSpacing: 10.0,
          childAspectRatio: 2.0,
          children: getWidgetList(),
        )
      ),
    );
  }


  List<String> getDataList() {
    List<String> list = [];
    for (int i = 0; i < 100; i++) {
      list.add(i.toString());
    }
    return list;
  }

  List<Widget> getWidgetList() {
    return getDataList().map((item) => getItemContainer(item)).toList();
  }

  Widget getItemContainer(String item) {
    return Container(
      width: 5.0,
      height: 5.0,
      alignment: Alignment.center,
      child: Text(
        item,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      color: Colors.blue,
    );
  }

}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Hello, World!', style: Theme.of(context).textTheme.headline4);
  }

  MyWidget() {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response =  http.get(dataURL) as http.Response;
    print(response);
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