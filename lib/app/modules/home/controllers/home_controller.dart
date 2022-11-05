import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/modules/home_page/views/home_page_view.dart';

import '../../cart_page/views/cart_page_view.dart';

class HomeController extends GetxController {
  int currentIndex = 0;
  List<Widget>? children;

  @override
  void onInit() {
    super.onInit();
    children = [
      HomePageView(),
      const Center(child: Text("1")),
      const Center(child: Text("2")),
      const CartPageView(),
    ];
  }

  onTabTapped(int index) {
    currentIndex = index;
    update();
  }
}
