import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:glass/glass.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:swapnplay/Controllers/otpController.dart';
import 'package:swapnplay/Controllers/otpController.dart';
import 'package:swapnplay/UI/Constants/colors.dart';
import 'package:swapnplay/UI/Screens/registerScreen.dart';
import 'package:swapnplay/UI/Screens/secondLayout.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  OtpController otpController = Get.put(OtpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Obx(() => InkWell(
            onTap: () {
              if (otpController.otpText.text.length == 4) {
                Get.to(() => const RegisterScreen());
              }
            },
            child: Container(
              alignment: Alignment.center,
              width: Get.width - 32,
              height: 50,
              decoration: BoxDecoration(
                  color: otpController.isComplete.value
                      ? AppColor.darkColor
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                'Continue',
                style: GoogleFonts.ubuntu(
                  color: Colors.white.withOpacity(.9),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * .2,
              ),
              Text(
                'Enter code sent\nto your number',
                style: GoogleFonts.ubuntu(
                  color: AppColor.darkColor,
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'we sent it to the number 84451 66556',
                style: GoogleFonts.ubuntu(
                  color: AppColor.darkColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Pinput(
                  controller: otpController.otpText,
                  onChanged: (v) {
                    if (v.length == 4) {
                      otpController.isComplete.value = true;
                    } else {
                      otpController.isComplete.value = false;
                    }
                  },
                  autofocus: true,
                  defaultPinTheme: PinTheme(
                      textStyle: GoogleFonts.ubuntu(
                        color: AppColor.darkColor.withOpacity(.9),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              spreadRadius: 2,
                              offset: const Offset(1, 2),
                              color: Colors.grey.withOpacity(.1),
                            )
                          ],
                          color: AppColor.backgroud,
                          borderRadius: BorderRadius.circular(12)),
                      height: 50,
                      width: 45)),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
