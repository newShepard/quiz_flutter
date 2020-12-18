import 'package:get/get.dart';
import 'package:quiz_flutter/controllers/home_page_controller.dart';
import 'package:quiz_flutter/controllers/login_page_controller.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() {
      return HomePageController();
    });
    Get.lazyPut<LoginPageController>(() {
      return LoginPageController();
    });
  }
}
