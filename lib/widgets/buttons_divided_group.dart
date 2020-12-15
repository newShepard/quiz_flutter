import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DividedGroup extends StatefulWidget {
  DividedGroup({@required this.children});

  final List<Widget> children;
  @override
  _DividedGroupState createState() {
    return _DividedGroupState();
  }
}

class _DividedGroupState extends State<DividedGroup> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: widget.children.asMap().entries.map((e) {
        if (e.key == widget.children.length - 1) return e.value;
        return Column(children: [
          e.value,
          Divider(
            color: Colors.grey,
            height: 1,
            thickness: 1,
          )
        ]);
      }).toList(),
    ));
  }
}
