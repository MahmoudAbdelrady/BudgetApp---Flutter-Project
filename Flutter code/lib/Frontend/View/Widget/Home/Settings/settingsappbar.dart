import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Localization/changelocale.dart';

class SettingsAppBar extends GetView<LocaleController> {
  const SettingsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: AppColors.primarycolor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Stack(
        children: [
          Positioned(
              top: -35,
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
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 44, 0, 92),
                    // color: const Color.fromARGB(255, 0, 105, 92),
                    borderRadius: BorderRadius.circular(160)),
              )),
          Positioned(
              top: -23,
              right:
                  controller.myServices.sharedPreferences.getString("Lang") ==
                          "en"
                      ? -10
                      : null,
              left: controller.myServices.sharedPreferences.getString("Lang") ==
                      "ar"
                  ? -10
                  : null,
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 37, 0, 77),
                    // color: const Color.fromARGB(255, 0, 77, 64),
                    borderRadius: BorderRadius.circular(160)),
              )),
          Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Settings".tr,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
