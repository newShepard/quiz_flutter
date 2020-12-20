import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Ближайшие'),
          //automaticallyImplyLeading: false, // backlink
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Center(
            child: Text("Hello"),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.format_list_bulleted,
                  size: 48,
                ),
                label: 'visits'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.storefront_outlined,
                  size: 48,
                ),
                label: 'routes'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                  size: 48,
                ),
                label: 'profile'),
          ],
        ),
      ),
    );
  }
}
