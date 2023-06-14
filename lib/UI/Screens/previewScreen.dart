import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swapnplay/Controllers/previewController.dart';
import 'package:swapnplay/UI/Constants/colors.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({super.key});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  PreviewController previewController = Get.put(PreviewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        alignment: Alignment.center,
        width: Get.width - 32,
        height: 50,
        decoration: BoxDecoration(
            color: AppColor.darkColor, borderRadius: BorderRadius.circular(20)),
        child: Text(
          'Make offer',
          style: GoogleFonts.ubuntu(
            color: Colors.white.withOpacity(.9),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Obx(
                () => GestureDetector(
                    onTap: () {
                      previewController.isFull.value =
                          !previewController.isFull.value;
                    },
                    child: Container(
                      height: Get.height / 2,
                      width: Get.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: const NetworkImage(
                                  'https://www.allkeyshop.com/blog/wp-content/uploads/assassins-creed-valhalla-build.jpg'),
                              fit: previewController.isFull.value
                                  ? BoxFit.cover
                                  : BoxFit.contain)),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: Get.height / 2,
                            width: Get.width,
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            height: kToolbarHeight * 2,
                            width: Get.width,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            AppColor.backgroud.withOpacity(.4)),
                                    child: Icon(
                                      Icons.arrow_back_ios_outlined,
                                      color: AppColor.darkColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onLongPress: () {
                                      previewController.fetch();
                                    },
                                    onTap: () {
                                      previewController.insert(
                                          name: 'Flutter',
                                          desc: 'Flutter homepage',
                                          url: 'https://flutter.dev/');
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.backgroud
                                              .withOpacity(.4)),
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: AppColor.darkColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
          Positioned(
            top: Get.height / 2 - 30,
            child: Obx(
              () => Container(
                decoration: BoxDecoration(
                    color: !previewController.isFull.value
                        ? AppColor.backgroud.withOpacity(.5)
                        : Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                height: Get.height / 2 + 30,
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 26, 20, 26),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width - 150,
                              child: Text(
                                'Assasing creed walhala',
                                style: GoogleFonts.ubuntu(
                                    fontSize: 20,
                                    color: AppColor.darkColor.withOpacity(.8),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Spacer(),
                            const Icon(Icons.bubble_chart_outlined),
                            Text(
                              ' XBox',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 16,
                                  color: AppColor.darkColor.withOpacity(.8),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 26,
                        ),
                        Text(
                          "Assassin's Creed Valhalla is a 2020 action role-playing video game developed by Ubisoft Montreal and published by Ubisoft. It is the twelfth major installment in the Assassin's Creed series, and the successor to 2018's Assassin's Creed Odyssey.",
                          style: GoogleFonts.ubuntu(
                              height: 1.3,
                              fontSize: 14,
                              color: AppColor.darkColor.withOpacity(.5),
                              fontWeight: FontWeight.w400),
                        ),
                      ]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
