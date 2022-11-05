import 'package:get/get.dart';
import 'package:untitled/app/modules/home_page/controllers/home_page_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<HomePageController>(HomePageController());
  }
}
