import 'package:flutter/material.dart';

class InputTile extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final void Function() onClear;
  final bool obscureText;

  const InputTile({
    @required this.hintText,
    @required this.controller,
    @required this.onClear,
    this.obscureText = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.center,
      color: Colors.white,
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.only(left: 0),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          suffixIcon: Material(
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            child: InkWell(
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
              hoverColor: Colors.black,
              splashColor: Colors.yellow,
              onTap: () {
                onClear.call();
                FocusScope.of(context).unfocus();
              },
              child: const Icon(
                Icons.clear,
                size: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
