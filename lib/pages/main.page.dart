import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ближайшие'),
        //automaticallyImplyLeading: false, // backlink
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  'assets/icons/main_page_tab_bar/visits_history.svg',
                  color: Colors.black),
              backgroundColor: Colors.red,
              label: 'visits'),
          BottomNavigationBarItem(
              icon:
                  SvgPicture.asset('assets/icons/main_page_tab_bar/outlet.svg'),
              label: 'routes'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  'assets/icons/main_page_tab_bar/profile.svg'),
              label: 'profile'),
        ],
      ),
    );
  }
}
