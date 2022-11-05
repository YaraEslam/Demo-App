import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_routes.dart';
import 'app/routes/theme1_app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "",
      initialRoute: Routes.Home,
      getPages: Theme1AppPages.routes,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino
    );
  }
}
