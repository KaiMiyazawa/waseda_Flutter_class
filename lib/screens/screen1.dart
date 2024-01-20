import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;


class Screen1 extends StatelessWidget {
  final String name;
  final String fImg;
  final String bImg;
  const Screen1({super.key, required this.name, required this.fImg, required this.bImg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 1"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, "String from Screen 2");
              },
              child: Text("to Screen 1"),
            ),
            Text("$name"),
            Image.network(fImg),
            Image.network(bImg),
          ],
        ),
      ),
    );;
  }
}
//
//
// class Screen1 extends StatefulWidget {
//   // final String idFromS0;
//   const Screen1({super.key});
//
//   @override
//   State<Screen1> createState() => _Screen1State();
// }
//
// class _Screen1State extends State<Screen1> {
//   String result = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Screen 1"),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: () async {
//                 result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return Screen2();
//                 }));
//                 setState(() {
//                   result;
//                 });
//               },
//               child: Text("To Screen 2"),
//             ),
//             Text("var:[$result]"),
//             Text("id:[]")
//           ],
//         )
//       ),
//     );
//   }
// }


// class Screen1 extends StatelessWidget {
//   const Screen1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Screen 1"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             final String result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
//               return Screen2();
//             }));
//             print("backed to Screen 1. var:[$result]");
//           },
//           child: Text("To Screen 2"),
//         ),
//       ),
//     );
//   }
// }
