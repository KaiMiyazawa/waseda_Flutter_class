import 'package:flutter/material.dart';

class ScreenB extends StatelessWidget {
  final String textPassedFromScreenA;
  const ScreenB({super.key, required this.textPassedFromScreenA});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 2"),
      ),
      body: Center(
        child: Text("Screen 1から渡されたテキストは $textPassedFromScreenA です。"),
      ),
    );
  }
}
