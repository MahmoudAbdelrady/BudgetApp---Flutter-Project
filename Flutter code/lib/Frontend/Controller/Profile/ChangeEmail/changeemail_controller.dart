import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/statusrequest.dart';
import 'package:mainflutterproject/Backend/RemoteData/Profile/profilechangeemail.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';

class ChangeEmailController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController reEmail;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  ProfileChangeEmailData profileChangeEmailData =
      ProfileChangeEmailData(Get.find());
  changeEmail() async {
    if (email.text != reEmail.text) {
      return Get.defaultDialog(
          title: "Alert".tr,
          content: Text("EmailMatchAlert".tr),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonscolor),
                onPressed: () {
                  Get.back();
                },
                child: Text("Ok".tr))
          ]);
    } else if (email.text == myServices.sharedPreferences.getString("email")) {
      return Get.defaultDialog(
          title: "Alert".tr,
          content: Text("PrevEmailAlert".tr),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonscolor),
                onPressed: () {
                  Get.back();
                },
                child: Text("Ok".tr))
          ]);
    } else {
      var formdata = formstate.currentState;
      if (formdata!.validate()) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await profileChangeEmailData.postData(
            email.text, myServices.sharedPreferences.getString("id")!);
        if (response['status'] == "success") {
          statusRequest = StatusRequest.success;
          myServices.sharedPreferences.setString("email", email.text);
          update();
          Get.back();
          Get.defaultDialog(
              title: "Status".tr,
              content: Text("EmailUpdateSuccess".tr),
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonscolor),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Ok".tr))
              ]);
        } else {
          statusRequest = StatusRequest.failure;
          update();
        }
      }
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    reEmail = TextEditingController();
    super.onInit();
  }
}
