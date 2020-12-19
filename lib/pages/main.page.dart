import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ближайшие'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'visits'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'routes'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'profile'),
        ],
      ),
    );
  }
}
