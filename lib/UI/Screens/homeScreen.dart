// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:swapnplay/Controllers/feedController.dart';
// import 'package:swapnplay/UI/Constants/colors.dart';
// import 'package:swapnplay/UI/Constants/screenUtils.dart';
// import 'dart:math';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final HomeController homeController = Get.put(HomeController());
//   final Random _random = Random();
//   bool _visible = true;
//   @override
//   Widget build(BuildContext context) {
//     // print(homeController.scrollController.dire);
//     return Scaffold(
//       body: NotificationListener<UserScrollNotification>(
//         onNotification: (notification) {
//           final ScrollDirection direction = notification.direction;
//           setState(() {
//             if (direction == ScrollDirection.reverse) {
//               print(_visible);
//               _visible = false;
//             } else if (direction == ScrollDirection.forward) {
//               _visible = true;
//               print(_visible);
//             }
//           });
//           return true;
//         },
//         child: Container(
//           alignment: Alignment.bottomCenter,
//           height: ScreenUtils.height,
//           width: ScreenUtils.width,
//           color: AppColor.backgroud,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 25, right: 25),
//                 child: SizedBox(
//                   height: AppBar().preferredSize.height * 2,
//                   width: ScreenUtils.width,
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 32),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.drag_handle_outlined,
//                             color: AppColor.darkColor,
//                           ),
//                           Icon(
//                             Icons.search,
//                             size: 20,
//                             color: AppColor.darkColor,
//                           )
//                         ]),
//                   ),
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                     color: AppColor.darkColor,
//                     borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(47),
//                         topRight: Radius.circular(47))),
//                 height:
//                     ScreenUtils.height - (AppBar().preferredSize.height * 2),
//                 width: ScreenUtils.width,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(
//                         height: kToolbarHeight / 2,
//                       ),
//                       Text(
//                         'Explore',
//                         style: GoogleFonts.ubuntu(
//                             color: AppColor.backgroud,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600),
//                       ),
//                       Expanded(
//                         child: 1 == 1
//                             ? MasonryGridView.count(
//                                 // padding: const EdgeInsets.only(top: 13),
//                                 shrinkWrap: true,
//                                 itemCount: 10,
//                                 crossAxisCount: 2,
//                                 mainAxisSpacing: 3,
//                                 crossAxisSpacing: 2,
//                                 itemBuilder: (context, index) {
//                                   final height = _random.nextInt(100) + 100;
//                                   final width = _random.nextInt(100) + 100;
//                                   return Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 4, right: 4, bottom: 4),
//                                     child: SizedBox(
//                                         height: height.toDouble(),
//                                         width: width.toDouble(),
//                                         child: Container(
//                                           color: Colors.amber,
//                                         )),
//                                   );
//                                 })
//                             : GridView.builder(
//                                 // controller: homeController.scrollController,
//                                 key: const PageStorageKey('myListView'),
//                                 physics: const ClampingScrollPhysics(),
//                                 shrinkWrap: true,
//                                 itemCount: 10,
//                                 gridDelegate:
//                                     const SliverGridDelegateWithFixedCrossAxisCount(
//                                         crossAxisSpacing: 20.0,
//                                         crossAxisCount: 2,
//                                         childAspectRatio: 1 / 1.3,
//                                         mainAxisSpacing: 20),
//                                 itemBuilder: (context, index) {
//                                   return InkWell(
//                                     onLongPress: () {
//                                       HapticFeedback.mediumImpact();
//                                     },
//                                     child: Stack(
//                                       children: [
//                                         Container(
//                                           alignment: Alignment.bottomLeft,
//                                           foregroundDecoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               gradient: const LinearGradient(
//                                                   begin: Alignment.center,
//                                                   end: Alignment.bottomCenter,
//                                                   colors: [
//                                                     Color.fromARGB(1, 0, 0, 0),
//                                                     Color.fromARGB(1, 0, 0, 0),
//                                                     Color.fromARGB(1, 0, 0, 0),
//                                                     Color.fromARGB(10, 0, 0, 0),
//                                                     Color.fromARGB(20, 0, 0, 0),
//                                                     Color.fromARGB(40, 0, 0, 0),
//                                                     Color.fromARGB(70, 0, 0, 0),
//                                                     Color.fromARGB(
//                                                         100, 0, 0, 0),
//                                                     Color.fromARGB(
//                                                         130, 0, 0, 0),
//                                                     Color.fromARGB(
//                                                         160, 0, 0, 0),
//                                                     Color.fromARGB(
//                                                         190, 0, 0, 0),
//                                                     Color.fromARGB(
//                                                         220, 0, 0, 0),
//                                                     Color.fromARGB(
//                                                         250, 0, 0, 0),
//                                                   ])),
//                                           decoration: BoxDecoration(
//                                               image: DecorationImage(
//                                                   onError:
//                                                       (exception, stackTrace) {
//                                                     // print(exception);
//                                                     const NetworkImage(
//                                                         'https://www.classify24.com/wp-content/uploads/2015/11/no-image.png');
//                                                   },
//                                                   image: const AssetImage(
//                                                       'assets/images/NicePng_spiderman-png_466405.png'),
//                                                   fit: BoxFit.cover),
//                                               color: Colors.grey.shade100,
//                                               borderRadius:
//                                                   BorderRadius.circular(10)),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.all(14.0),
//                                           child: Align(
//                                               alignment: Alignment.bottomLeft,
//                                               child: Column(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.end,
//                                                 children: [
//                                                   Flexible(
//                                                     child: Text(
//                                                       'Rangnarok'.split(' ')[0],
//                                                       maxLines: 1,
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       style: const TextStyle(
//                                                           color: Colors.white,
//                                                           fontWeight:
//                                                               FontWeight.w600,
//                                                           fontSize: 17),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               )),
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 }),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
