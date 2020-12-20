import 'package:get/get.dart';
import 'package:quiz_flutter/controllers/initial_page_controller.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitialPageController>(() {
      return InitialPageController();
    });
  }
}