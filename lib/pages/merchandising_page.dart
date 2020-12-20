import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MerchandisingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Ближайшие'),
          //automaticallyImplyLeading: false, // backlink
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
