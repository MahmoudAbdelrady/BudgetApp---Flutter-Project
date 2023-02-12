import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/Home/home_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

class CustomBottomAppBar extends GetView<HomeScreenControllerImp> {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller.tabController,
      tabs: controller.tabspages,
      indicatorColor: AppColors.primarycolor,
      labelColor: AppColors.primarycolor,
      unselectedLabelColor: AppColors.secondarycolor,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 4,
      physics: const NeverScrollableScrollPhysics(),
      onTap: (index) {
        controller.changePage(index);
      },
    );
  }
}
