import 'package:get/get.dart';
import 'package:quiz_flutter/helpers/dependecy_injector.dart';
import 'package:quiz_flutter/models/quiz/user.dart';
import 'package:quiz_flutter/pages/forgot_password_page.dart';
import 'package:quiz_flutter/pages/login_page.dart';
import 'package:quiz_flutter/services/auth_service.dart';
import 'package:quiz_flutter/services/user_service.dart';

class HomePageController extends GetxController {
  final userReady = false.obs;
  final error = dynamic.obs;
  final user = Rx<QuizUser>();
  final userCanLogin = false.obs;

  UserService _userService;
  AuthService _authService;

  @override
  void onInit() async {
    this._userService = sl<UserService>();
    this._authService = sl<AuthService>();
    super.onInit();
  }

  @override
  void onReady() {
    this.initUser().then((value) {
      super.onReady();
    });
  }

  Future<void> initUser() async {
    try {
      await _userService?.init();
    } catch (error) {
      this.error.value = error;
    }
    this.user.value = this._userService.user;
    print(this.user.value);

    if (!(this.user?.value?.isAnonymous ?? false) &&
        this._authService.hasAccessToQuiz()) {
      this.userCanLogin.value = true;
      print('true');
      Get.offNamed('/forgot-password');
    } else {
      this.userCanLogin.value = false;
      print('false');
      Get.offNamed('/login');
    }
  }
}
