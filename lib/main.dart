import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_final/screens/screen1.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(
    title: "Pokemon Search",
    home: MyApp(),
  ));
}

//ボタンをおした時に値の更新があるので、Stateful
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //値を取得するためのポケモンの図鑑番号。何も入力してないと 1 (フシギダネ？)になるように初期化されている。
  String _id = "1";

  //PokeAPIによって持ってくるポケモンの情報たち。
  //名前、前後の姿イメージ、高さ、重さ。
  String _p_name = "failed";
  String _p_fImg = "failed";
  String _p_bImg = "failed";
  int _p_h = -1;
  int _p_w = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar 特に言うことなし
      appBar: AppBar(
        title: const Text('PokéAPI Flutter App'),
      ),
      //Body 水平方向に中央よせ
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(150.0, 60.0, 150.0, 80.0),
              child: TextField(
                decoration: const InputDecoration(hintText: " 1~899"),
                onChanged: (value) {
                  setState(() {
                    _id = value;
                  });
                },
              ),
            ),
            const Text(
              'ボタンを押すと、\n入力した図鑑番号のポケモンの詳細を見れます。',
            ),
            const SizedBox(
              height: 20,
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
                    _p_h = jsonDecode(response.body)['height'];
                    _p_w = jsonDecode(response.body)['weight'];
                  });
                } else {
                  throw Exception('Failed to load Pokémon');
                }
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Screen1(
                    name: _p_name,
                    fImg: _p_fImg,
                    bImg: _p_bImg,
                    height: _p_h,
                    weight: _p_w,
                  );
                }));
              },
              child: Text("Get Pokémon's Info! (pass [ $_id ])"),
            ),
          ],
        ),
      ),
    );
  }
}
