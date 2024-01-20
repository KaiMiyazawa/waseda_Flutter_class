import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_final/screens/screen1.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    title: "Screen 0",
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _id = "1";

  String _p_name = "";
  String _p_fImg = "";
  String _p_bImg = "";

  void fetchPokemon(String id) async {
    Uri url = Uri.parse("https://pokeapi.co/api/v2/pokemon/" + id);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        _p_name = jsonDecode(response.body)['name'];
        _p_fImg = jsonDecode(response.body)['sprites']['front_default'];
        _p_bImg = jsonDecode(response.body)['sprites']['back_default'];
      });
      print(_p_bImg);
      print(_p_fImg);
    } else {
      throw Exception('Failed to load Pokemon');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PokeAPI Flutter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: " 1~899 の半角で数字を入れてください。"
                ),
                onChanged: (value) {
                  setState(() {
                    _id = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'You have fetched this Pokemon:',
            ),
            ElevatedButton(
              onPressed: () async {
                Uri url = Uri.parse("https://pokeapi.co/api/v2/pokemon/" + _id);
                final response = await http.get(url);
                if (response.statusCode == 200) {
                  setState(() {
                    _p_name = jsonDecode(response.body)['name'];
                    _p_fImg =
                    jsonDecode(response.body)['sprites']['front_default'];
                    _p_bImg =
                    jsonDecode(response.body)['sprites']['back_default'];
                  });
                  print(_p_bImg);
                  print(_p_fImg);
                } else {
                  throw Exception('Failed to load Pokemon');
                }
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Screen1(name: _p_name, fImg: _p_fImg, bImg: _p_bImg,);
                }));
              },
              child: Text("Screen 1に移動 & pass [$_id]"),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: fetchPokemon,
      //   tooltip: 'Fetch Pokemon',
      //   child: Icon(Icons.download),
      // ),
    );
  }
}