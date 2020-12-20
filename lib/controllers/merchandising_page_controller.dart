import 'package:get/get.dart';

enum MerchandisingTabs { VisitedOutlets, OutletRoutes, Profile }

final List _tabs = [];

class MerchandisingPageController extends GetxController
    with SingleGetTickerProviderMixin {
  //TabController _tabController;
  final _currentIndex = 0.obs;

  //TabController get tabBarController => _tabController;
  int get currentIndex => _currentIndex.value;

  @override
  void onInit() {
    //_tabController = TabController(length: 3, vsync: this);
    _currentIndex.value = 1;
    super.onInit();
  }

  @override
  void onClose() {
    //this._tabController?.dispose();
    super.onClose();
  }

  void changeTab(int index) {
    print("tab changed");
    //_tabController.index = index;
    _currentIndex.value = index;
    //update();
  }
}
