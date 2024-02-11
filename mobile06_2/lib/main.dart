 import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(
    MaterialApp(
      title: "http example",
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String pref = "";
  String city = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("http example"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () async {
              Uri url = Uri.parse("https://zipcloud.ibsnet.co.jp/api/search?zipcode=7830060");
              http.Response res = await http.get(url);
              var resJson = jsonDecode(res.body);
              setState(() {
                pref = resJson["results"][0]["address1"];
                city = resJson["results"][0]["address2"];
              });
            }, child: Text("fetch"),),
            SizedBox(
              height: 50,
            ),
            Text("prefecture:[$pref]"),
            Text("city:[$city]"),
          ],
        ),
      ),
    );
  }
}

