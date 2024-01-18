import 'package:flutter/material.dart';
import 'package:test_project/presentations/nav_bar/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BottomNavBar(),
    );
  }
}
//Mina jerde ozgeris boldy
