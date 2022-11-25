import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> exitAppAlert() {
  Get.defaultDialog(
      title: "Exit Alert".tr,
      middleText: "ConfExit".tr,
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: Text("Yes".tr)),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text("No".tr))
      ]);
  return Future.value(true);
}
