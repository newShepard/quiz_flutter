import 'package:get/get.dart';
import 'package:quiz_flutter/helpers/dependecy_injector.dart';
import 'package:quiz_flutter/models/quiz/user.dart';
import 'package:quiz_flutter/services/auth_service.dart';
import 'package:quiz_flutter/services/user_service.dart';

class HomePageController extends GetxController {
  final userReady = false.obs;
  final error = dynamic.obs;
  final user = Rx<QuizUser>();

  UserService _userService;
  AuthService _authService;

  @override
  void onInit() {
    this._userService = sl<UserService>();
    this._authService = sl<AuthService>();
    super.onInit();
  }

  Future<void> initUser() async {
    try {
      await _userService?.init();
    } catch (error) {
      this.error.value = error;
    }
    this.user.value = this._userService.user;
  }

  bool userCanLogin() {
    var user = this.user.value;
    return user.employee != null && this._authService.hasAccessToQuiz();
  }
}
