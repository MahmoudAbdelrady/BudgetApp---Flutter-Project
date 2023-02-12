import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/View/viewbudget_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

class HomeCustomCard extends StatelessWidget {
  const HomeCustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ViewBudgetController());
    return GetBuilder<ViewBudgetController>(builder: (controller) {
      controller.viewBudget();
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.primarycolor,
            borderRadius: BorderRadius.circular(20)),
        child: Stack(children: [
          Positioned(
              top: -73,
              right:
                  controller.myServices.sharedPreferences.getString("Lang") ==
                          "en"
                      ? -42
                      : null,
              left: controller.myServices.sharedPreferences.getString("Lang") ==
                      "ar"
                  ? -42
                  : null,
              child: Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 44, 0, 92),
                    // color: const Color.fromARGB(255, 0, 105, 92),
                    borderRadius: BorderRadius.circular(160)),
              )),
          Positioned(
              top: -50,
              right:
                  controller.myServices.sharedPreferences.getString("Lang") ==
                          "en"
                      ? -20
                      : null,
              left: controller.myServices.sharedPreferences.getString("Lang") ==
                      "ar"
                  ? -20
                  : null,
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 37, 0, 77),
                    // color: const Color.fromARGB(255, 0, 77, 64),
                    borderRadius: BorderRadius.circular(160)),
              )),
          Container(
              alignment: Alignment.center,
              child: ListTile(
                title: Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    "${controller.budget}\$",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                ),
                subtitle: Text(
                  "Available Balance".tr,
                  style: const TextStyle(color: Colors.white),
                ),
              ))
        ]),
      );
    });
  }
}
