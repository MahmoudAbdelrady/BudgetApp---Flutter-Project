import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/statusrequest.dart';
import 'package:mainflutterproject/Backend/RemoteData/Auth/ForgetPassword/resetpassword.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Functions/handlingdata.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';

class ChangePasswordController extends GetxController {
  late TextEditingController pass;
  late TextEditingController repass;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  bool hidepass = true;
  bool hiderepass = true;
  IconData passIcon = Icons.visibility;
  IconData repassIcon = Icons.visibility;
  MyServices myServices = Get.find();
  passShower() {
    hidepass = hidepass == true ? false : true;
    passIcon =
        passIcon == Icons.visibility ? Icons.visibility_off : Icons.visibility;
    update();
  }

  repassShower() {
    hiderepass = hiderepass == true ? false : true;
    repassIcon = repassIcon == Icons.visibility
        ? Icons.visibility_off
        : Icons.visibility;
    update();
  }

  changePassword() async {
    if (pass.text != repass.text) {
      return Get.defaultDialog(
          title: "Attention".tr,
          middleText: "PassMatch".tr,
          onConfirm: () {
            Get.back();
          });
    } else {
      var formdata = formstate.currentState;
      if (formdata!.validate()) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await resetPasswordData.postData(
            myServices.sharedPreferences.getString("email")!, pass.text);
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response['status'] == "success") {
            Get.back();
            Get.defaultDialog(
                title: "Status".tr,
                content: Text("Successful reset".tr),
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
            Get.defaultDialog(title: "Error".tr, middleText: "UnexError".tr);
          }
        }
        update();
      } else {}
    }
  }

  @override
  void onInit() {
    pass = TextEditingController();
    repass = TextEditingController();
    super.onInit();
  }
}
