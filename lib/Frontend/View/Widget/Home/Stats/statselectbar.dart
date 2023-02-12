import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/Stats/stats_controller.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Stats/selectbartab.dart';

class StatsSelectBar extends StatelessWidget {
  const StatsSelectBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 1.1,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(50)),
      child: GetBuilder<StatsController>(builder: (controller) {
        return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SelectBarTab(
              title: "This Week".tr,
              selected: controller.selectedTab == 0 ? true : false,
              onTap: () {
                controller.changeTab(0);
              }),
          const VerticalDivider(
            thickness: 1,
            color: Colors.grey,
          ),
          SelectBarTab(
              title: "This Month".tr,
              selected: controller.selectedTab == 1 ? true : false,
              onTap: () {
                controller.changeTab(1);
              }),
          const VerticalDivider(
            thickness: 1,
            color: Colors.grey,
          ),
          SelectBarTab(
              title: "This Year".tr,
              selected: controller.selectedTab == 2 ? true : false,
              onTap: () {
                controller.changeTab(2);
              })
        ]);
      }),
    );
  }
}
