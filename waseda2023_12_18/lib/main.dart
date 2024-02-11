import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("first app bar"),
          backgroundColor: Colors.amber,
        ),
        body: Image.network("https://pbs.twimg.com/profile_images/1735129682725797888/fc72v_d2_400x400.jpg"),
        ),
    );
  }
}
