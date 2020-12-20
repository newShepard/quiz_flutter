import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_flutter/controllers/home_page_controller.dart';
import 'package:quiz_flutter/pages/login_page.dart';

class HomePage extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.initUser(),
        builder: (_, __) => Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
