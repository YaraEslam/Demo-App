import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color.dart';
import '../../../../common/ui.dart';
import '../controllers/cart_page_controller.dart';

class CartPageView extends GetView {
  const CartPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Ui.appBar("Oxford Street"),
            Text(
              "Cart",
              style: Ui.textStyle.copyWith(
                  color: black, fontSize: 16, fontWeight: FontWeight.bold),
            ).paddingSymmetric(horizontal: 16),
            GetBuilder<CartPageController>(
                init: CartPageController(),
                builder: (controller) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: controller.cartList.length,
                    itemBuilder: (context, index) => item(index),
                  );
                }).paddingSymmetric(horizontal: 16),
          ],
        ), //.paddingSymmetric(horizontal: 16)
      ),
    );
  }

  item(int index) {
    return GetBuilder<CartPageController>(
        init: CartPageController(),
        builder: (controller) {
          return Row(
            children: [
              Container(
                width: MediaQuery.of(Get.context!).size.width / 6,
                height: MediaQuery.of(Get.context!).size.width / 6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: controller.cartList[index].color!),
                child: Text(""),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.cartList[index].name!,
                    style: Ui.textStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: black3),
                  ).paddingSymmetric(horizontal: 8, vertical: 4),
                  Text(
                    controller.cartList[index].description!,
                    style: Ui.textStyle.copyWith(fontSize: 12),
                  ).paddingSymmetric(horizontal: 8, vertical: 4),
                  Text(
                    "\$ ${(double.parse(controller.cartList[index].price!) * controller.cartList[index].quantity!).toString()}",
                    style: Ui.textStyle.copyWith(fontSize: 12, color: orange),
                  ).paddingSymmetric(horizontal: 8, vertical: 4),
                ],
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  controller.decreaseItem(index);
                },
                child: Container(
                  width: MediaQuery.of(Get.context!).size.width / 12,
                  height: MediaQuery.of(Get.context!).size.width / 12,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: blue),
                  child: const Center(
                    child: Icon(Icons.remove, color: blueBtn),
                  ),
                ).paddingSymmetric(horizontal: 8),
              ),
              Text(
                "${controller.cartList[index].quantity!}",
                style: Ui.textStyle.copyWith(fontSize: 12),
              ).paddingSymmetric(horizontal: 8),
              InkWell(
                onTap: () {
                  controller.increaseItem(index);
                },
                child: Container(
                  width: MediaQuery.of(Get.context!).size.width / 12,
                  height: MediaQuery.of(Get.context!).size.width / 12,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: blue),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: blueBtn,
                    ),
                  ),
                ).paddingSymmetric(horizontal: 8),
              ),
            ],
          ).paddingSymmetric(vertical: 16);
        });
  }
}
