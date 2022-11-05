import 'package:get/get.dart';
import '../modules/cart_page/bindings/cart_page_binding.dart';
import '../modules/cart_page/views/cart_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_page/bindings/home_page_binding.dart';
import '../modules/home_page/views/home_page_view.dart';
import 'app_routes.dart';

class Theme1AppPages {
  static final routes = [
    GetPage(name: Routes.Home, page: () => const HomeView(), binding: HomeBinding()),
    GetPage(name: Routes.HomePageView, page: () => HomePageView(), binding: HomePageBinding()),
    GetPage(name: Routes.CartPageView, page: () => CartPageView(), binding: CartPageBinding()),
  ];
}
