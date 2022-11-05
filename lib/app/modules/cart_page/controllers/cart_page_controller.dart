import 'package:get/get.dart';
import 'package:untitled/app/models/item_model.dart';
import 'package:untitled/app/modules/home_page/controllers/home_page_controller.dart';

class CartPageController extends GetxController {
  List<ItemData> cartList = [];

  @override
  onInit() async {
    super.onInit();
    getItems();
  }

  getItems() {
    HomePageController controller = Get.find<HomePageController>();
    for (var element in controller.itemList) {
      if (element.added!) {
        cartList.add(element);
      }
    }
    update();
  }

  increaseItem(int index) {
    HomePageController controller = Get.find<HomePageController>();
    cartList[index].quantity = cartList[index].quantity! + 1;
    controller.totalPrice += double.parse(cartList[index].price!);
    update();
  }

  decreaseItem(int index) {
    if (cartList[index].quantity != 0) {
      HomePageController controller = Get.find<HomePageController>();
      cartList[index].quantity = cartList[index].quantity! - 1;
      controller.totalPrice -= double.parse(cartList[index].price!);
    }
    update();
  }
}
