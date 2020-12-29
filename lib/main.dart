import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quiz_flutter/helpers/dependecy_injector.dart';
import 'package:quiz_flutter/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarBrightness: Brightness.dark,
  //     statusBarColor: Colors.red,
  //   ),
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      title: 'ICS Quiz',
      initialRoute: '/',
      theme: ThemeData(
        scaffoldBackgroundColor: HexColor('e8f0f3'),
        primaryColor: HexColor('29abe2'),
      ),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
    );
  }
}
