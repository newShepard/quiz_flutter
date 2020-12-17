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
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.minHeight,
                maxHeight: constraints.maxHeight,
              ),
              child: Container(
                color: HexColor("e8f0f3"),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Container(
                            child: SvgPicture.asset('assets/quiz_logo.svg'),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 32),
                        child: Flexible(
                          flex: 1,
                          child: DividedGroup(
                            children: [
                              InputTile(
                                hintText: "Введите e-mail",
                                controller: controller.email.value,
                                onClear: () {
                                  controller.clearEmail();
                                },
                              ),
                              InputTile(
                                hintText: "Введите пароль",
                                controller: controller.password.value,
                                onClear: () {
                                  controller.clearPassword();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              //margin: EdgeInsets.only(bottom: 40),
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
