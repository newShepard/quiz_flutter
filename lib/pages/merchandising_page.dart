import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quiz_flutter/controllers/merchandising_page_controller.dart';
import 'package:quiz_flutter/tabs/outlets_tab.dart';
import 'package:quiz_flutter/tabs/profile_tab.dart';
import 'package:quiz_flutter/tabs/visits_history_tab.dart';

class MerchandisingPage extends GetView<MerchandisingPageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Торговые точки',
            style: TextStyle(
                color: HexColor('345b6c'), fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false, // backlink
        ),
        body: Obx(() => IndexedStack(
              index: controller.currentIndex,
              children: [
                VisitedOutletsTab(),
                OutletsTab(),
                ProfileTab(),
              ],
            )),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            onTap: (index) => controller.changeTab(index),
            currentIndex: controller.currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.format_list_bulleted,
                  size: 48,
                ),
                label: 'visits',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.storefront_outlined,
                  size: 48,
                ),
                label: 'outlets',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                  size: 48,
                ),
                label: 'profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
