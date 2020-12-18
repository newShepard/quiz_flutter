import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quiz_flutter/controllers/login_page_controller.dart';
import 'package:quiz_flutter/pages/forgot_password_page.dart';
import 'package:quiz_flutter/pages/registration_page.dart';
import 'package:quiz_flutter/widgets/input_field.dart';
import 'package:quiz_flutter/widgets/buttons_divided_group.dart';
import 'package:quiz_flutter/widgets/input_tile.dart';

class LoginPage extends GetView<LoginPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Авторизация'),
      ),
      body: SafeArea(
        child: CustomScrollView(
          //ClampingScrollPhysics
          //RangeMaintainingScrollPhysics
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 2,
                    child: SvgPicture.asset('assets/quiz_logo.svg'),
                  ),
                  Expanded(
                    flex: 1,
                    child: DividedGroup(
                      children: [
                        InputTile(
                          hintText: "Введите e-mail",
                          controller: controller.email.value,
                          onClear: controller.clearEmail,
                        ),
                        InputTile(
                          hintText: "Введите пароль",
                          controller: controller.password.value,
                          onClear: controller.clearPassword,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: ButtonTheme(
                            minWidth: double.infinity,
                            height: 40,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            child: RaisedButton.icon(
                              elevation: 0,
                              label: Text(
                                "Войти",
                                style: TextStyle(color: Colors.white),
                              ),
                              icon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                await controller.onSignIn();
                                print(Get.routing.args);
                              },
                            ),
                          ),
                        ),
                        Container(
                          child: ButtonTheme(
                            height: 40,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            child: FlatButton(
                              child: Text(
                                "Забыли пароль?",
                                style: TextStyle(
                                  color: HexColor("#345B6C"),
                                ),
                              ),
                              onPressed: () => Get.to(ForgotPasswordPage()),
                            ),
                          ),
                        ),
                        Container(
                          child: ButtonTheme(
                            height: 40,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            child: FlatButton(
                              child: Text(
                                "Регистрация",
                                style: TextStyle(
                                  color: HexColor("#345B6C"),
                                ),
                              ),
                              onPressed: () => Get.to(RegistrationPage()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
