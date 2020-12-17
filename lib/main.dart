import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_flutter/bindings/login_page_bindings.dart';
import 'package:quiz_flutter/helpers/dependecy_injector.dart';
import 'package:quiz_flutter/pages/forgot_password_page.dart';
import 'package:quiz_flutter/pages/login_page.dart';
import 'package:quiz_flutter/pages/registration_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LoginPageBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    print("PAGE1");
    return GetMaterialApp(
      title: 'ICS Quiz',
      initialRoute: '/login',
      initialBinding: LoginPageBinding(),
      defaultTransition: Transition.fadeIn,
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginPage(),
          binding: LoginPageBinding(),
        ),
        GetPage(name: '/forgot-password', page: () => ForgotPasswordPage()),
        GetPage(name: '/registration', page: () => RegistrationPage())
      ],
    );
  }
}
