import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: Text("Container 1"),
                      color: Colors.amber,
                      width: 100,
                      height: 100,
                    ),
                    Container(
                      child: Text("Container 2"),
                      color: Colors.blue,
                      width: 100,
                      height: 100,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: Text("Container 3"),
                      color: Colors.blue,
                      width: 100,
                      height: 100,
                    ),
                    Container(
                      child: Text("Container 4"),
                      color: Colors.amber,
                      width: 100,
                      height: 100,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}