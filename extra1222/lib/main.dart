import 'dart:math';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String msg = "hihihi";
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            nouns[Random().nextInt(nouns.length)]
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Text(msg,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.green,
                // decoration: TextDecoration.underline,
                // decoration: TextDecoration.overline,
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.purpleAccent,
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
