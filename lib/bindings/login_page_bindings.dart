import 'package:get/get.dart';
import 'package:quiz_flutter/controllers/login_page_controller.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(() {
      return LoginPageController();
    });
  }
}
