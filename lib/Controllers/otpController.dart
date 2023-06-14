import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  TextEditingController otpText = TextEditingController();
  RxBool isComplete = false.obs;
}
