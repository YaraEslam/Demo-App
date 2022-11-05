import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/common/color.dart';
import 'package:untitled/common/ui.dart';

import '../../home_page/controllers/home_page_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Stack(
            children: [
              controller.children![controller.currentIndex],
              Positioned(bottom: 1, child: navigationBar(context)),
              Positioned(
                  right: 50,
                  left: 50,
                  bottom: 20,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.red,
                    child: Stack(
                      children: [
                        SvgPicture.asset("assets/icons/total.svg"),
                        GetBuilder<HomePageController>(
                            init: HomePageController(),
                            builder: (cont) {
                              return Text(
                                "\$${cont.totalPrice.toInt()}",
                                style: Ui.textStyle.copyWith(color: white),
                              );
                            })
                      ],
                    ),
                  )),
            ],
          );
        },
      )),
      // bottomNavigationBar: navigationBar(),
    );
  }

  navigationBar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return BottomNavigationBar(
            elevation: 1.0,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            selectedLabelStyle: Ui.textStyle.copyWith(fontSize: 12),
            unselectedFontSize: 12,
            unselectedLabelStyle: Ui.textStyle.copyWith(fontSize: 12),
            currentIndex: controller.currentIndex,
            onTap: controller.onTabTapped,
            selectedItemColor: primary,
            unselectedItemColor: grey,
            unselectedIconTheme: const IconThemeData(color: grey),
            selectedIconTheme: const IconThemeData(
              color: primary,
            ), // Colors.white
            showUnselectedLabels: true,
            showSelectedLabels: true,
            backgroundColor: white1,
            items: [
              BottomNavigationBarItem(
                icon: Ui.svgIcon("home", grey),
                activeIcon: Ui.svgIcon("home", primary),
                label: "Grocery",
              ),
              BottomNavigationBarItem(
                icon: Ui.svgIcon("news", grey),
                activeIcon: Ui.svgIcon("news", primary),
                label: "News".tr,
              ),
              BottomNavigationBarItem(
                icon: Ui.svgIcon("heart", grey),
                activeIcon: Ui.svgIcon("heart", primary),
                label: "Favourite",
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.wallet,
                  color: grey,
                ),
                activeIcon: Icon(
                  Icons.wallet,
                  color: primary,
                ),
                label: "Cart",
              ),
            ],
          );
        },
      ),
    );
  }
}
