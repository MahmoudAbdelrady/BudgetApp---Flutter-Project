import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/Home/home_controller.dart';
import 'package:mainflutterproject/Frontend/Controller/Stats/stats_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Containers/customcontainerheader.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Containers/customdivider.dart';

class HomeStatsCard extends StatelessWidget {
  const HomeStatsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(StatsController());
    HomeScreenControllerImp homeScreenControllerImp =
        Get.put(HomeScreenControllerImp());
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: GetBuilder<StatsController>(builder: (controller) {
          controller.getWeekData();
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomContainerHeader(headerText: "This week stats".tr),
                  MaterialButton(
                    height: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    color: AppColors.buttonscolor,
                    textColor: Colors.white,
                    onPressed: () {
                      homeScreenControllerImp.changePage(1);
                      homeScreenControllerImp.tabController.animateTo(1);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.analytics_outlined,
                          color: AppColors.primarycolor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "View Stats".tr,
                          style: const TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const CustomDivider(marginWidth: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Income".tr),
                  Text(
                    "${controller.totalInc}\$",
                    style: const TextStyle(color: Colors.green),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Expence".tr),
                  Text(
                    "${controller.totalExp}\$",
                    style: const TextStyle(color: Colors.red),
                  )
                ],
              )
            ],
          );
        }));
  }
}
