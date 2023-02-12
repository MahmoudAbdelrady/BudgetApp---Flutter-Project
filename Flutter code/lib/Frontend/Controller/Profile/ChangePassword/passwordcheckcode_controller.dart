import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/statusrequest.dart';
import 'package:mainflutterproject/Backend/RemoteData/Profile/profileverifycode.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Home/Profile/ChangePassword/changepassword.dart';

class PasswordCheckCodeController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  ProfileVerifyCodeData profileVerifyCodeData =
      ProfileVerifyCodeData(Get.find());
  MyServices myServices = Get.find();
  checkCode(String pin) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await profileVerifyCodeData.postData(
        myServices.sharedPreferences.getString("id")!, pin);
    if (response['status'] == "success") {
      statusRequest = StatusRequest.success;
      update();
      Get.off(() => const ChangePassword());
    } else {
      statusRequest = StatusRequest.failure;
      update();
      Get.defaultDialog(
          title: "Alert".tr,
          content: Text("VerifyCodeFailed".tr),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonscolor),
                onPressed: () {
                  Get.back();
                },
                child: Text("Ok".tr))
          ]);
    }
  }
}
