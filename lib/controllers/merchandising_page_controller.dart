import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum MerchandisingTabs { VisitedOutlets, OutletRoutes, Profile }

final List _tabs = [];

class MainPageController extends GetxController {
  TabController _tabController;

  TabController get getTabBatController => _tabController;

  @override
  void onInit() {
    _tabController = new TabController(length: 3, vsync: null);
    super.onInit();
  }
}
