import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:quiz_flutter/utils/constants.dart';
import 'package:quiz_flutter/widgets/input_field.dart';
import 'package:quiz_flutter/widgets/buttons_divided_group.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  MdtApiClient _apiClient = new MdtApiClient(Consts.api_url, Consts.app_url);
  String email = "";
  String password = "";
  Object error;
  bool ready = false;

  void _onEmailChange(String v) {
    setState(() {
      email = v;
    });
  }

  void _onPasswordChange(String v) {
    setState(() {
      password = v;
    });
  }

  bool _signInIsEnabled() {
    return this.email != null && this.password != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: AppBar(
          elevation: 10,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'Авторизация',
            style: TextStyle(color: Colors.black),
          ),
        ),
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
                            children: [InputField(), InputField()],
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
                                    var r = await this
                                        ._apiClient
                                        .request("security/signin", data: {
                                      "login": "svoinkov",
                                      "password": "Rb12rb",
                                      "rememberMe": true
                                    });
                                    print(r.statusCode);
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
                                  onPressed: () => print("Hello"),
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
