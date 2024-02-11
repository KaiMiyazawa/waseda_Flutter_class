import 'package:flutter/material.dart';
import 'package:multi_page/screens/screen_a.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Screen 0",
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 0"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ScreenA();
            }));
          },
          child: Text("Screen 1に移動"),
        ),
      ),
    );
  }
}
