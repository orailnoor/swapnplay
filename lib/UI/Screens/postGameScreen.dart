import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swapnplay/Controllers/postGameController.dart';
import 'package:swapnplay/Controllers/registerController.dart';
import 'package:swapnplay/UI/Constants/colors.dart';

class PostGameScreen extends StatefulWidget {
  const PostGameScreen({super.key});

  @override
  State<PostGameScreen> createState() => _PostGameScreenState();
}

class _PostGameScreenState extends State<PostGameScreen> {
  final RegisterController _registerController = Get.put(RegisterController());
  final PostGameController postGameController = Get.put(PostGameController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Post Game',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: Get.width,
              alignment: Alignment.centerLeft,
              child: Text(
                '   AD Title',
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
                      onChanged: (v) {},
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
                                builder: (BuildContext context, double value,
                                    Widget? child) {
                                  return Transform.translate(
                                    offset: Offset(sin(value * pi * 20) * 5, 0),
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
                          hintText: 'FIFA 2021',
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
            Container(
              width: Get.width,
              alignment: Alignment.centerLeft,
              child: Text(
                '   Description',
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
                      onChanged: (v) {},
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
                                duration: const Duration(milliseconds: 300),
                                builder: (BuildContext context, double value,
                                    Widget? child) {
                                  return Transform.translate(
                                    offset: Offset(sin(value * pi * 20) * 5, 0),
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
                          hintText: 'Describe what are you selling',
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
            Container(
              width: Get.width,
              alignment: Alignment.centerLeft,
              child: Text(
                '   Category',
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
                      onChanged: (v) {},
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
                                duration: const Duration(milliseconds: 300),
                                builder: (BuildContext context, double value,
                                    Widget? child) {
                                  return Transform.translate(
                                    offset: Offset(sin(value * pi * 20) * 5, 0),
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
                          hintText: 'Choose a category',
                          hintStyle: GoogleFonts.ubuntu(
                            color: AppColor.darkColor.withOpacity(.5),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '   Upload Images',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.ubuntu(
                      color: AppColor.darkColor.withOpacity(.9),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  GetBuilder<PostGameController>(builder: (controller) {
                    return controller.pickedImages!.isEmpty
                        ? const SizedBox()
                        : GestureDetector(
                            onTap: () {
                              showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) =>
                                    CupertinoActionSheet(
                                  actions: [
                                    CupertinoActionSheetAction(
                                      onPressed: () {
                                        // Add your remove image logic here
                                        Navigator.pop(
                                            context); // Close the action sheet
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text('1. Tap to select cover image'),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text('2. Longpress to remove image'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.info_outline_rounded,
                            ),
                          );
                  }),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            GetBuilder<PostGameController>(builder: (pgc) {
              return Expanded(
                child: Stack(
                  children: [
                    GridView.builder(
                      padding: const EdgeInsets.all(0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      itemCount: postGameController.pickedImages!.length < 6
                          ? postGameController.pickedImages!.length + 1
                          : postGameController.pickedImages!.length,
                      // Add 1 for the upload button if there are less than 6 images
                      itemBuilder: (context, index) {
                        if (index == 0 &&
                            postGameController.pickedImages!.length < 6) {
                          // Display the upload button at index 0 if there are less than 6 images
                          return InkWell(
                            onTap: () {
                              postGameController.getImage();
                            },
                            child: SizedBox(
                              width: 110,
                              height: 110,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.cloud_upload),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Upload')
                                ],
                              ),
                            ),
                          );
                        } else {
                          final imageIndex = index >= 1 ? index - 1 : index;
                          // Adjust the image index to account for the upload button
                          return Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: GestureDetector(
                                  onLongPress: () {
                                    if (index == pgc.coverPhoto) {
                                      Fluttertoast.showToast(
                                          msg: "You can't remove cover photo");
                                    } else {
                                      pgc.pickedImages!.removeAt(imageIndex);
                                      if (pgc.pickedImages!.length == 1) {
                                        pgc.coverPhoto = 1;
                                      }
                                      pgc.update();
                                    }
                                  },
                                  onTap: () {
                                    pgc.coverPhoto = index;
                                    pgc.update();
                                  },
                                  child: SizedBox(
                                    width: 110,
                                    height: 110,
                                    child: Image.file(
                                      File(postGameController
                                          .pickedImages![postGameController
                                                      .pickedImages!.length ==
                                                  6
                                              ? index
                                              : imageIndex]
                                          .path),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              if (index == pgc.coverPhoto) ...[
                                // Display the profile image button for the first image
                                Positioned(
                                  top: 6,
                                  right: 12,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.black.withOpacity(.4)),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8.0, 4, 8, 4),
                                        child: Text(
                                          'Cover',
                                          style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(.9)),
                                        ),
                                      )),
                                ),
                              ],
                            ],
                          );
                        }
                      },
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
