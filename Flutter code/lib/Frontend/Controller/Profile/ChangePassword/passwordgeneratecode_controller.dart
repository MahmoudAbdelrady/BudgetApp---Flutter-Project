import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/statusrequest.dart';
import 'package:mainflutterproject/Backend/RemoteData/Profile/generatevcode.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Home/Profile/ChangePassword/passwordverifycode.dart';

class PasswordGenerateCodeController extends GetxController {
  MyServices myServices = Get.find();
  GenerateVCodeData generateVCodeData = GenerateVCodeData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  generateVCode() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await generateVCodeData
        .postData(myServices.sharedPreferences.getString("id")!);
    if (response['status'] == "success") {
      statusRequest = StatusRequest.success;
      update();
      Get.to(() => const PasswordVerifyCode());
    } else {
      statusRequest = StatusRequest.failure;
      update();
      Get.defaultDialog(
          title: "Alert".tr,
          content: Text("ErrorOccur".tr),
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
