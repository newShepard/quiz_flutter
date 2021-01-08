import 'package:get/get.dart';
import 'package:quiz_flutter/helpers/dependecy_injector.dart';
import 'package:quiz_flutter/models/quiz/user.dart';
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
    _userService = sl<UserService>();
    _authService = sl<AuthService>();
    super.onInit();
  }

  @override
  void onReady() {
    initUser().then((value) {
      super.onReady();
    });
  }

  Future<void> initUser() async {
    try {
      await _userService?.init();
    } catch (error) {
      this.error.value = error;
    }
    user.value = _userService.user;
    print(user.value);

    if (!(user?.value?.isAnonymous ?? false) &&
        _authService.hasAccessToQuiz()) {
      userCanLogin.value = true;
      await Get.offNamed('/login');
    } else {
      userCanLogin.value = false;
      await Get.offNamed('/merchandising');
    }
  }
}
