

import 'package:flutter/material.dart';
import 'package:flutter_app/menu_dashboard.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Тур агенство '100 дорог' ",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuDashBoardpage(),
    );
  }
}
