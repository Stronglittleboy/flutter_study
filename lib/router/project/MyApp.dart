import 'package:flutter/material.dart';
import 'page/login.dart';
import 'page/server_setting.dart';
import 'page/product.dart';
import 'page/product_detail.dart';

void main() =>
    runApp(
        MaterialApp(
          home: Login(),
          routes: {
            '/': (context) => Login(),
            '/login': (context) => Login(),
            '/serverSetting': (context) => ServerSetting(),
            '/productList': (context) => Product(),
            '/productDetail': (context) => ProductDetail(),
          },
        )
    );