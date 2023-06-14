// ignore: file_names

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isScrolling = false.obs;

  ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isScrolling.value == false) {
          print('orailnoor');
          isScrolling.value = true;
        }
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrolling.value == true) {
          print('orailnoor up');
          isScrolling.value = false;
        }
      }
    });

    super.onInit();
  }
}
