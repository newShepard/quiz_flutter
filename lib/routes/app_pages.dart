import 'package:get/route_manager.dart';
import 'package:quiz_flutter/bindings/home_page_bindings.dart';
import 'package:quiz_flutter/bindings/login_page_bindings.dart';
import 'package:quiz_flutter/bindings/merchandiser_page_bindings.dart';
import 'package:quiz_flutter/pages/forgot_password_page.dart';
import 'package:quiz_flutter/pages/home_page.dart';
import 'package:quiz_flutter/pages/login_page.dart';
import 'package:quiz_flutter/pages/merchandising_page.dart';
import 'package:quiz_flutter/pages/registration_page.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomePageBindings(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => ForgotPasswordPage(),
    ),
    GetPage(
      name: Routes.REGISTRATION,
      page: () => RegistrationPage(),
    ),
    GetPage(
      name: Routes.MERCHAINDISING,
      page: () => MerchandisingPage(),
      binding: MerchandiserPageBindings(),
    )
  ];
}
