import 'package:flutter/material.dart';
import 'package:multi_page/screens/screen_b.dart';

class ScreenA extends StatefulWidget {
  const ScreenA({super.key});

  @override
  State<ScreenA> createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  String _inputText = "hi";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 1"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "text here",
              ),
              onChanged: (value) {
                setState(() {
                  _inputText = value;
                });
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("move to Screen 0"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ScreenB(textPassedFromScreenA: _inputText);
              }));
            },
            child: Text("move to Screen 2"),
          ),
          Text(_inputText),
        ],
      ),
    );
  }
}
