import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'Авторизация',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Container(
        color: HexColor("e8f0f3"),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: SvgPicture.asset('assets/quiz_logo.svg'),
              ),
              TextField()
            ],
          ),
        ),
      ),
    );
  }
}
