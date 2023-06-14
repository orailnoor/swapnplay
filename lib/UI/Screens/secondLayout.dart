import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:swapnplay/Controllers/feedController.dart';
import 'package:swapnplay/UI/Constants/colors.dart';
import 'dart:math';

class SecondLayout extends StatefulWidget {
  const SecondLayout({super.key});

  @override
  State<SecondLayout> createState() => _SecondLayoutState();
}

class _SecondLayoutState extends State<SecondLayout> {
  final HomeController _homeController = Get.put(HomeController());

  List<String> cds = [
    'https://i.ytimg.com/vi/Rus6lAbybaw/maxresdefault.jpg',
    'https://i.ytimg.com/vi/kHjAGn3zeSI/hqdefault.jpg',
    'https://image.api.playstation.com/vulcan/ap/rnd/202207/1117/jYTE1oP2Xx79MR7kTf4HofTK.png',
    'https://i.ytimg.com/vi/-BP6oBd9b8Y/maxresdefault.jpg',
    'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/91Wjtmyrg9L._SL1500_.jpg',
    'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/71m3t89CjXL._SL1024_.jpg',
    'https://i.ytimg.com/vi/bS9uawiB2LE/maxresdefault.jpg',
    'https://image.api.playstation.com/vulcan/ap/rnd/202109/0911/TqGd7LvYmdBSL88tZXce925I.png'
  ];
  final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Obx(
        () => AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: !_homeController.isScrolling.value
              ? DotNavigationBar(
                  enableFloatingNavBar: true,
                  currentIndex: 0,
                  onTap: (v) {},
                  // dotIndicatorColor: Colors.black,
                  items: [
                    /// Home
                    DotNavigationBarItem(
                      icon: Icon(Icons.home),
                      selectedColor: Colors.orange,
                    ),

                    /// Likes
                    DotNavigationBarItem(
                      icon: Icon(Icons.favorite_border),
                      selectedColor: Colors.amber,
                    ),

                    /// Search
                    DotNavigationBarItem(
                      icon: Icon(Icons.search),
                      selectedColor: Colors.orange,
                    ),

                    /// Profile
                    DotNavigationBarItem(
                      icon: Icon(Icons.person),
                      selectedColor: Colors.teal,
                    ),
                  ],
                )
              : Container(),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _homeController.scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: kToolbarHeight * 1.2,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: Get.width / 3,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                  ),
                  items: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        alignment: Alignment.center,
                        height: Get.width / 3,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [Colors.amber, Colors.red],
                          ),
                        ),
                        child: Text(
                          'New Arrivals',
                          style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        alignment: Alignment.center,
                        height: Get.width / 3,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [Colors.purple, Colors.blue],
                          ),
                        ),
                        child: Text(
                          'On Sale',
                          style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        alignment: Alignment.center,
                        height: Get.width / 3,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [Colors.green, Colors.teal],
                          ),
                        ),
                        child: Text(
                          'Best Sellers',
                          style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: kToolbarHeight / 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: Get.width,
                    height: 60,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.amber),
                            ),
                          );
                        }),
                  ),
                ),
                const SizedBox(
                  height: kToolbarHeight / 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Explore',
                    style: GoogleFonts.ubuntu(
                        color: AppColor.darkColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: kToolbarHeight / 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: MasonryGridView.count(
                      padding: EdgeInsets.zero,
                      // controller: _homeController.scrollController,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cds.length,
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      itemBuilder: (context, index) {
                        final height = _random.nextInt(100) + 150;
                        final width = _random.nextInt(100) + 100;
                        return SizedBox(
                            height: height.toDouble(),
                            width: Get.width,
                            child: Stack(
                              children: [
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  // height: height.toDouble(),
                                  // width: Get.width,
                                  foregroundDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: const LinearGradient(
                                          begin: Alignment.center,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color.fromARGB(1, 0, 0, 0),
                                            Color.fromARGB(1, 0, 0, 0),
                                            Color.fromARGB(1, 0, 0, 0),
                                            Color.fromARGB(10, 0, 0, 0),
                                            Color.fromARGB(20, 0, 0, 0),
                                            Color.fromARGB(40, 0, 0, 0),
                                            Color.fromARGB(70, 0, 0, 0),
                                            Color.fromARGB(100, 0, 0, 0),
                                            Color.fromARGB(130, 0, 0, 0),
                                            Color.fromARGB(160, 0, 0, 0),
                                            Color.fromARGB(190, 0, 0, 0),
                                            Color.fromARGB(220, 0, 0, 0),
                                            Color.fromARGB(250, 0, 0, 0),
                                          ])),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(cds[index]),
                                          fit: BoxFit.cover),
                                      color: Colors.black.withOpacity(.1),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    width: Get.width,
                                    child: Text(
                                      'Assasin creed valhala  ',
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                // Align(
                                //     alignment: Alignment.topLeft,
                                //     child: Image.asset(
                                //       height: 20,
                                //       'assets/images/liked.png',
                                //       color: 1 == 1
                                //           ? Colors.red
                                //           : AppColor.darkColor,
                                //     ))
                              ],
                            ));
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
