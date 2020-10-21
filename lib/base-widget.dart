import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
/*基础widget*/
void main()=>runApp(new MaterialApp(
  title: "旺仔app",
  home: new MyScaffold(),
)) ;
class MyScaffold extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: Column(
        children: [
          new MyAppBar(
            title:new Text("我的第一个导航栏目",style: Theme.of(context).primaryTextTheme.title,)
          ),
          Expanded(child: Center(
            child: Text("我的第一个App页面"),
          ))
        ],
      ),
    );
  }
}
class MyAppBar extends StatelessWidget{
  final Widget title;


  MyAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.menu), onPressed: null,tooltip: '菜单',),
          Expanded(child: title),
          IconButton(icon: Icon(Icons.search), onPressed:null,tooltip: '搜索',)
        ],
      ),
    );
  }
}