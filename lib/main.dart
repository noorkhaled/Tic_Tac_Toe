import 'package:flutter/material.dart';
import 'package:xo_game/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'XO-Game',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF0061a),
        shadowColor: Color(0xFF001456),
        splashColor: Color(0xFF4169e8),
      ),
      home: HomePage(),
    );
  }
}