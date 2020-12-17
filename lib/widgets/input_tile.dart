import 'package:flutter/material.dart';

class InputTile extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final void Function() onClear;

  const InputTile(
      {@required this.hintText,
      @required this.controller,
      @required this.onClear});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 56,
      padding: EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.center,
      color: Colors.white,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: this.hintText,
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
            onPressed: () {
              this.onClear.call();
              FocusScope.of(context).unfocus();
            },
          ),
        ),
      ),
    );
  }
}
