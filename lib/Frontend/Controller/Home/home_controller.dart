import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Home/budget/budget.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Home/home.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Home/settings.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Home/stats.dart';

abstract class HomeScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  late final TabController tabController;
  int currentPage = 0;
  List<Widget> listPage = [
    const Home(),
    const Stats(),
    const Budget(),
    const Settings()
  ];
  List<Widget> tabspages = [
    Tab(
      child: GetBuilder<HomeScreenControllerImp>(builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [Expanded(child: Text("Home".tr)), const Icon(Icons.home)],
        );
      }),
    ),
    Tab(
      child: GetBuilder<HomeScreenControllerImp>(builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: Text("Stats".tr)),
            const Icon(Icons.bar_chart_outlined)
          ],
        );
      }),
    ),
    Tab(
      child: GetBuilder<HomeScreenControllerImp>(builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: Text("Budget".tr)),
            const Icon(Icons.account_balance_wallet_outlined)
          ],
        );
      }),
    ),
    Tab(
      child: GetBuilder<HomeScreenControllerImp>(builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: Text("Settings".tr)),
            const Icon(Icons.settings_outlined)
          ],
        );
      }),
    )
  ];
  @override
  changePage(int i) {
    currentPage = i;
    update();
  }

  @override
  void onInit() {
    tabController = TabController(length: tabspages.length, vsync: this);
    super.onInit();
  }
}
