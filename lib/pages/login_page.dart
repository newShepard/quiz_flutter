import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quiz_flutter/controllers/login_page_controller.dart';
import 'package:quiz_flutter/widgets/buttons_divided_group.dart';
import 'package:quiz_flutter/widgets/input_tile.dart';

class LoginPage extends GetView<LoginPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Авторизация'),
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset('assets/quiz_logo.svg'),
                  ),
                  Expanded(
                    flex: 1,
                    child: DividedGroup(
                      children: [
                        InputTile(
                          hintText: 'Введите e-mail',
                          controller: controller.email,
                          onClear: controller.clearEmail,
                        ),
                        InputTile(
                          hintText: 'Введите пароль',
                          controller: controller.password,
                          onClear: controller.clearPassword,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Obx(() => Text(controller.errorMessage.value)),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ButtonTheme(
                            minWidth: double.infinity,
                            height: 40,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            child: RaisedButton.icon(
                              color: HexColor('29abe2'),
                              elevation: 0,
                              label: const Text(
                                'Войти',
                                style: TextStyle(color: Colors.white),
                              ),
                              icon: const Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                await controller.singIn();
                              },
                            ),
                          ),
                        ),
                        Container(
                          child: ButtonTheme(
                            height: 40,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            child: FlatButton(
                              child: Text(
                                'Забыли пароль?',
                                style: TextStyle(
                                  color: HexColor('#345B6C'),
                                ),
                              ),
                              onPressed: () => Get.toNamed('/forgot-password'),
                            ),
                          ),
                        ),
                        Container(
                          child: ButtonTheme(
                            height: 40,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            child: FlatButton(
                              child: Text(
                                'Регистрация',
                                style: TextStyle(
                                  color: HexColor('#345B6C'),
                                ),
                              ),
                              onPressed: () => Get.toNamed('/registration'),
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
