import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

Future<bool> exitAppAlert() {
  Get.defaultDialog(
      title: "Exit Alert".tr,
      middleText: "ConfExit".tr,
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonscolor),
            onPressed: () {
              exit(0);
            },
            child: Text("Yes".tr)),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondarycolor),
            onPressed: () {
              Get.back();
            },
            child: Text("No".tr))
      ]);
  return Future.value(true);
}
