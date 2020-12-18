import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_flutter/helpers/dependecy_injector.dart';
import 'package:quiz_flutter/services/auth_service.dart';

class LoginPageController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();

  dynamic error;

  AuthService _authService;

  @override
  void onInit() {
    this._authService = sl<AuthService>();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }

  void changeEmail(String value) {
    this.email.text = value;
  }

  void clearEmail() {
    this.email.text = "";
  }

  void changePassword(String value) {
    this.password.text = value;
  }

  void clearPassword() {
    this.password.text = "";
  }

  Future<void> singIn() async {
    await this
        ._authService
        .signIn(
            login: this.email.value.text, password: this.password.value.text)
        .then((value) => null)
        .catchError((error) {
      this.error = error;
      update();
    });
  }
}
