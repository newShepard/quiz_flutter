import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quiz_flutter/bindings/login_page_bindings.dart';
import 'package:quiz_flutter/helpers/dependecy_injector.dart';
import 'package:quiz_flutter/pages/forgot_password_page.dart';
import 'package:quiz_flutter/pages/login_page.dart';
import 'package:quiz_flutter/pages/registration_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarBrightness: Brightness.dark,
  //     statusBarColor: Colors.red,
  //   ),
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    print("PAGE1");
    return GetMaterialApp(
      title: 'ICS Quiz',
      initialRoute: '/login',
      initialBinding: LoginPageBinding(),
      theme: ThemeData(scaffoldBackgroundColor: HexColor("e8f0f3")),
      defaultTransition: Transition.rightToLeftWithFade,
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
