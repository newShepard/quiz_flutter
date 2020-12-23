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
    email = TextEditingController();
    password = TextEditingController();
    _authService = sl<AuthService>();
    super.onInit();
  }

  @override
  void onClose() {
    email?.dispose();
    password?.dispose();
    super.onClose();
  }

  void changeEmail(String value) => email.text = value;

  void clearEmail() => email.text = '';

  void changePassword(String value) => password.text = value;

  void clearPassword() => password.text = '';

  Future<void> singIn() async {
    await _authService
        .signIn(login: email.value.text, password: password.value.text)
        .then((value) {
      errorMessage.value = '';
      Get.toNamed('/merchandising');
    }).catchError((error) {
      errorMessage.value = error?.message ?? '';
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
