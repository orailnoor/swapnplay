import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapnplay/UI/Screens/postGameScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.grey,
      ),
      home: const PostGameScreen(),
    );
  }
}
