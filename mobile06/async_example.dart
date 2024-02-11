import 'dart:io';
// import 'package:flutter/gestures.dart';

void main() {
  do3tasks();
}

void do3tasks() async {
  task1();
  String result = await task2();
  task3(result);
}

void task1() {
  print('1');
}
Future<String> task2() async {
  Duration threeSeconds =  Duration(seconds: 3);
  // sleep(threeSeconds);

  String result = "";

  await Future.delayed(threeSeconds, () {
    result = "this is string 2";
    print("2");
  });

  return result;
}
void task3(String PrevResult) {
  print('3: 2 result was [$PrevResult].');
}