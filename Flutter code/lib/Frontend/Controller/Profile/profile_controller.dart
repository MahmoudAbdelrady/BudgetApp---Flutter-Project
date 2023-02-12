import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';

class ProfileController extends GetxController {
  late String username;
  late String email;
  late String phone;
  MyServices myServices = Get.find();
  updateVar() {
    username = myServices.sharedPreferences.getString("username")!;
    email = myServices.sharedPreferences.getString("email")!;
    phone = myServices.sharedPreferences.getString("phone")!;
    update();
  }

  logout() {
    Get.defaultDialog(
        title: "Alert".tr,
        content: Text("LogoutConfirm".tr),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonscolor),
              onPressed: () {
                myServices.sharedPreferences.clear();
                Get.offAllNamed("login");
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
  }

  @override
  void onInit() {
    username = myServices.sharedPreferences.getString("username")!;
    email = myServices.sharedPreferences.getString("email")!;
    phone = myServices.sharedPreferences.getString("phone")!;
    super.onInit();
  }
}
