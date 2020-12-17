import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  final email = TextEditingController().obs;
  final password = TextEditingController().obs;
  final ready = false.obs;
  Rx<dynamic> error = null.obs;

  @override
  void onInit() {
    print("INITED");
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void changeEmail(String value) {
    this.email.value.text = value;
  }

  void clearEmail() {
    this.email.value.text = "";
  }

  void changePassword(String value) {
    this.password.value.text = value;
  }

  void clearPassword() {
    this.password.value.text = "";
  }

  Future<void> onSignIn() async {
    print("SignIn");
  }
}
