import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:get/get.dart';
import 'package:glass/glass.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:pinput/pinput.dart';
import 'package:swapnplay/Controllers/otpController.dart';
import 'package:swapnplay/Controllers/otpController.dart';
import 'package:swapnplay/Controllers/registerController.dart';
import 'package:swapnplay/UI/Constants/colors.dart';
import 'package:swapnplay/UI/Screens/postGameScreen.dart';
import 'package:swapnplay/UI/Screens/secondLayout.dart';
import 'dart:math';

import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterController registerController = Get.put(RegisterController());
  OtpController otpController = Get.put(OtpController());
  List<String> _selectedChips = [];

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (RawKeyEvent event) {
        print('callllled if');
        if (event is RawKeyUpEvent &&
            event.logicalKey == LogicalKeyboardKey.enter) {
          // trigger a search based on the current search text
          setState(() {
            print('callllled if');
            // update the UI with search results
          });
        } else {
          setState(() {
            print('callllled else');
          });
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        floatingActionButton: Obx(() => InkWell(
              onTap: () {
                registerController.validateForm();
                if (otpController.otpText.text.length == 4) {
                  Get.to(() => const PostGameScreen());
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Obx(
                        () => Container(
                            height: 200,
                            width: 200,
                            decoration: registerController.imagePath.value == ''
                                ? BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/profile-placeholder.webp'),
                                        fit: BoxFit.cover),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        spreadRadius: 2,
                                        offset: const Offset(1, 2),
                                        color: Colors.grey.withOpacity(.1),
                                      )
                                    ],
                                    color: AppColor.backgroud,
                                    borderRadius: BorderRadius.circular(70))
                                : BoxDecoration(
                                    image: DecorationImage(
                                        image: FileImage(File(registerController
                                            .imagePath.value)),
                                        fit: BoxFit.cover),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        spreadRadius: 2,
                                        offset: const Offset(1, 2),
                                        color: Colors.grey.withOpacity(.1),
                                      )
                                    ],
                                    color: AppColor.backgroud,
                                    borderRadius: BorderRadius.circular(70))),
                      ),
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {
                              print('it worked');
                              registerController.pickImage();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                      offset: const Offset(1, 2),
                                      color: Colors.grey.withOpacity(.4),
                                    )
                                  ],
                                  color: AppColor.darkColor,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Icon(
                                Icons.add,
                                color: AppColor.backgroud,
                                size: 26,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: Get.width,
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                      color: AppColor.darkColor.withOpacity(.9),
                      fontSize: 26,
                      fontWeight: FontWeight.w400,
                    ),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                        hintText: 'Name',
                        hintStyle: GoogleFonts.ubuntu(
                          color: AppColor.darkColor.withOpacity(.5),
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: Get.width,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '   Email',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.ubuntu(
                      color: AppColor.darkColor.withOpacity(.9),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  alignment: Alignment.center,
                  width: Get.width,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          spreadRadius: 2,
                          offset: const Offset(1, 2),
                          color: Colors.grey.withOpacity(.1),
                        )
                      ],
                      color: AppColor.backgroud.withOpacity(.5),
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (v) {
                            if (v.isEmpty) {
                              registerController.isEmail.value = true;
                            } else {
                              registerController.isEmail.value = false;
                            }
                          },
                          controller: registerController.emailController,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.ubuntu(
                            color: AppColor.darkColor.withOpacity(.9),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              suffixIcon: GetBuilder<RegisterController>(
                                  builder: (controller) {
                                if (controller.isEmail.value) {
                                  // Vibration.vibrate(duration: 500);
                                  return TweenAnimationBuilder<double>(
                                    tween: Tween(begin: 0, end: 1),
                                    duration: Duration(milliseconds: 300),
                                    builder: (BuildContext context,
                                        double value, Widget? child) {
                                      return Transform.translate(
                                        offset:
                                            Offset(sin(value * pi * 20) * 5, 0),
                                        child: child!,
                                      );
                                    },
                                    child: Icon(
                                      Icons.info_outline_rounded,
                                      color: Colors.redAccent.withOpacity(.8),
                                    ),
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              }),
                              suffixIconConstraints: const BoxConstraints(
                                maxHeight: 24,
                                maxWidth: 24,
                              ),
                              isDense: true,
                              counterText: '',
                              border: InputBorder.none,
                              hintText: 'eg. user@swapnplay.com',
                              hintStyle: GoogleFonts.ubuntu(
                                color: AppColor.darkColor.withOpacity(.5),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              )),
                        ),

                        // const SizedBox(
                        //   height: 24,
                        // ),

                        // const SizedBox(
                        //   height: 10,
                        // ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '   Address',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.ubuntu(
                          color: AppColor.darkColor.withOpacity(.9),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.map_outlined,
                      size: 20,
                      color: Color.fromARGB(255, 69, 112, 72),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        ' open map   ',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.ubuntu(
                          color: const Color.fromARGB(255, 69, 112, 72)
                              .withOpacity(.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          spreadRadius: 2,
                          offset: const Offset(1, 2),
                          color: Colors.grey.withOpacity(.1),
                        )
                      ],
                      color: AppColor.backgroud.withOpacity(.5),
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 22,
                          child: GooglePlaceAutoCompleteTextField(
                            googleAPIKey:
                                "AIzaSyBhPteA6FOMIaQqRIpHk7xLM5I4BN3_zMs",
                            inputDecoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: GetBuilder<RegisterController>(
                                      builder: (controller) {
                                    if (controller.isLocation.value) {
                                      // Vibration.vibrate(duration: 500);
                                      return TweenAnimationBuilder<double>(
                                        tween: Tween(begin: 0, end: 1),
                                        duration:
                                            const Duration(milliseconds: 300),
                                        builder: (BuildContext context,
                                            double value, Widget? child) {
                                          return Transform.translate(
                                            offset: Offset(
                                                sin(value * pi * 20) * 5, 0),
                                            child: child!,
                                          );
                                        },
                                        child: Icon(
                                          Icons.info_outline_rounded,
                                          // size: 18,
                                          color:
                                              Colors.redAccent.withOpacity(.8),
                                        ),
                                      );
                                    } else {
                                      return const SizedBox();
                                    }
                                  }),
                                ),
                                suffixIconConstraints: const BoxConstraints(
                                  maxHeight: 24,
                                  maxWidth: 24,
                                ),
                                counterText: '',
                                isDense: true,
                                border: InputBorder.none,
                                hintText: 'eg. Jamia nagar',
                                hintStyle: GoogleFonts.ubuntu(
                                  color: AppColor.darkColor.withOpacity(.5),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                )),
                            debounceTime: 800,
                            countries: const [
                              "in",
                            ], // optional by default null is set
                            isLatLngRequired:
                                true, // if you required coordinates from place detail
                            getPlaceDetailWithLatLng: (Prediction prediction) {
                              // this method will return latlng with place detail
                              if (kDebugMode) {
                                print("placeDetails${prediction.lng}");
                              }
                            }, // this callback is called when isLatLngRequired is true
                            itmClick: (Prediction prediction) {
                              registerController.addressController.text =
                                  prediction.description!;
                              registerController.addressController.selection =
                                  TextSelection.fromPosition(TextPosition(
                                      offset: prediction.description!.length));
                            },
                            textEditingController:
                                registerController.addressController,
                          ),
                        ),
                        // const SizedBox(
                        //   height: 24,
                        // ),
                        // SizedBox(
                        //   height: 20,
                        //   child: GooglePlaceAutoCompleteTextField(
                        //     googleAPIKey:
                        //         "AIzaSyBhPteA6FOMIaQqRIpHk7xLM5I4BN3_zMs",
                        //     inputDecoration: InputDecoration(
                        //         counterText: '',
                        //         // border: InputBorder.none,
                        //         hintText: 'Address',
                        //         hintStyle: GoogleFonts.ubuntu(
                        //           color: AppColor.darkColor.withOpacity(.5),
                        //           fontSize: 16,
                        //           fontWeight: FontWeight.w400,
                        //         )),
                        //     debounceTime: 800,
                        //     countries: const [
                        //       "in",
                        //     ], // optional by default null is set
                        //     isLatLngRequired:
                        //         true, // if you required coordinates from place detail
                        //     getPlaceDetailWithLatLng: (Prediction prediction) {
                        //       // this method will return latlng with place detail
                        //       if (kDebugMode) {
                        //         print(
                        //             "placeDetails" + prediction.lng.toString());
                        //       }
                        //     }, // this callback is called when isLatLngRequired is true
                        //     itmClick: (Prediction prediction) {
                        //       registerController.addressController.text =
                        //           prediction.description!;
                        //       registerController.addressController.selection =
                        //           TextSelection.fromPosition(TextPosition(
                        //               offset: prediction.description!.length));
                        //     },
                        //     textEditingController:
                        //         registerController.addressController,
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: Get.width,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '   Playing on ? ',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.ubuntu(
                      color: AppColor.darkColor.withOpacity(.9),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Wrap(
                  spacing: 8.0,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selectedChips.contains('PlayStation')) {
                            _selectedChips.remove('PlayStation');
                          } else {
                            _selectedChips.add('PlayStation');
                          }
                        });
                      },
                      child: Chip(
                        label: Text(
                          'PlayStation',
                          style: GoogleFonts.ubuntu(
                            color: _selectedChips.contains('PlayStation')
                                ? AppColor.backgroud
                                : AppColor.darkColor.withOpacity(.9),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        backgroundColor: _selectedChips.contains('PlayStation')
                            ? AppColor.darkColor
                            : AppColor.backgroud,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selectedChips.contains('Nintendo')) {
                            _selectedChips.remove('Nintendo');
                          } else {
                            _selectedChips.add('Nintendo');
                          }
                        });
                      },
                      child: Chip(
                        label: Text(
                          'Nintendo',
                          style: GoogleFonts.ubuntu(
                            color: _selectedChips.contains('Nintendo')
                                ? AppColor.backgroud
                                : AppColor.darkColor.withOpacity(.9),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        backgroundColor: _selectedChips.contains('Nintendo')
                            ? AppColor.darkColor
                            : AppColor.backgroud,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selectedChips.contains('Xbox')) {
                            _selectedChips.remove('Xbox');
                          } else {
                            _selectedChips.add('Xbox');
                          }
                        });
                      },
                      child: Chip(
                        label: Text(
                          'Xbox',
                          style: GoogleFonts.ubuntu(
                            color: _selectedChips.contains('Xbox')
                                ? AppColor.backgroud
                                : AppColor.darkColor.withOpacity(.9),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        backgroundColor: _selectedChips.contains('Xbox')
                            ? AppColor.darkColor
                            : AppColor.backgroud,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
