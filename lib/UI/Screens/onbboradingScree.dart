import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:swapnplay/UI/Screens/loginScreen.dart';

class OnboradingScreen extends StatefulWidget {
  const OnboradingScreen({super.key});

  @override
  State<OnboradingScreen> createState() => _OnboradingScreenState();
}

class _OnboradingScreenState extends State<OnboradingScreen> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 1), () {
      Get.to(() => LoginScreen());
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
