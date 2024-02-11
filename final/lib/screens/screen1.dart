import 'package:flutter/material.dart';
import 'package:mobile_final/screens/Screen2.dart';
// import 'package:http/http.dart' as http;

class Screen1 extends StatelessWidget {
  final String name;
  final String fImg;
  final String bImg;
  final int height;
  final int weight;

  const Screen1(
      {super.key,
      required this.name,
      required this.fImg,
      required this.bImg,
      required this.height,
      required this.weight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Poké Info"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("name:[ $name ]"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //ポケモンの前側
                Hero(
                  tag: "fImg",
                  child: Image.network(
                    fImg,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                //ポケモンの後ろ側
                Hero(
                  tag: "bImg",
                  child: Image.network(
                    bImg,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            //高さと重さの情報。元の値が0.1(m)(kg)なので直した
            //あと、なんか計算で小数点のちっさいのが出てくるから、四捨五入の.toStoring~~~~つけてる。
            Text("height:[ ${(height * 0.1).toStringAsFixed(1)} ](m)"),
            Text("weight:[ ${(weight * 0.1).toStringAsFixed(1)} ](kg)"),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Next Pokémon"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Screen2(
              fImg: fImg,
              bImg: bImg,
            );
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

/*
* やる気があったら、ポケモンのタイプの情報も取得して、それに応じて背景の色が変わるようにする
* ２タイプあるポケモンは上下二色？
* めんどくさいかも
* */
