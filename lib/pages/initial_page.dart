import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_flutter/controllers/initial_page_controller.dart';

class InitialPage extends GetView<InitialPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.initUser(),
        builder: (_, __) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
