import 'package:get/get.dart';
import 'package:quiz_flutter/controllers/merchandising_page_controller.dart';

class MerchandiserPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MerchandisingPageController>(() {
      return MerchandisingPageController();
    });
  }
}
