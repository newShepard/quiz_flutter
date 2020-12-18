import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_flutter/helpers/dependecy_injector.dart';
import 'package:quiz_flutter/services/auth_service.dart';

class LoginPageController extends GetxController {
  TextEditingController email;
  TextEditingController password;
  AuthService _authService;

  var errorMessage = RxString('');

  @override
  void onInit() {
    this.email = TextEditingController();
    this.password = TextEditingController();
    this._authService = sl<AuthService>();
    ever(errorMessage, (_) => print('Ever: ${_}'));
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
      this.errorMessage.value = error?.message ?? "";
    });
  }
}

// List<dynamic> getApiError(dynamic e) {
//   var erz = (e['reason'] ?? const {});

//   var error = (e['message'] ?? e['reason'] ?? e);
//   var data = e['reason']['data']?.err?.data ?? e?.data ?? e;

//   if ((data?.Message ?? false) &&
//       (data?.Code ?? false) &&
//       (data?.Args ?? false)) {
//     error = ['error:${data?.Code}', data?.Args];
//   } else if ((data?.Message ?? false) &&
//       (data?.Args ?? false) &&
//       !(data?.Code ?? false)) {
//     error = [data?.Message, data?.Args];
//   }

//   return error;
// }
