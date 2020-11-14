import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  @override
  _InputFieldState createState() {
    return _InputFieldState();
  }
}

class _InputFieldState extends State<InputField> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.center,
      color: Colors.white,
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: "Введите e-mail",
          contentPadding: EdgeInsets.only(left: 0),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(0))),
          suffixIcon: IconButton(
            padding: EdgeInsets.all(0),
            hoverColor: Colors.black,
            splashColor: Colors.yellow,
            alignment: Alignment.centerRight,
            icon: Icon(
              Icons.clear,
              size: 16,
            ),
            onPressed: () =>
                {_controller.clear(), FocusScope.of(context).unfocus()},
          ),
        ),
      ),
    );
  }
}

// class CustomInput extends TextField {
//   CustomInput() : super()
//   //return Container();
// };
