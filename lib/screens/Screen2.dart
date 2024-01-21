import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  final String fImg;
  final String bImg;

  const Screen2({super.key, required this.fImg, required this.bImg,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Poké Img"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(tag: "fImg", child: Image.network(
              fImg,
              width: 400,
              height: 400,
              fit: BoxFit.cover,
            ),),
            //ポケモンの後ろ側
            Hero(tag: "bImg", child: Image.network(
              bImg,
              width: 400,
              height: 400,
              fit: BoxFit.cover,
            ),),
          ],
        ),
      ),
    );
  }
}