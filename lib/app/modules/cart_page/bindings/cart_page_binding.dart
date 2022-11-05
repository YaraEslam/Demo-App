import 'package:get/get.dart';

import '../../home_page/controllers/home_page_controller.dart';
import '../controllers/cart_page_controller.dart';

class CartPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CartPageController>(
      CartPageController(),
    );
    Get.put<HomePageController>(
      HomePageController(),
    );
  }
}
