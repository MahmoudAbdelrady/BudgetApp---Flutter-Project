import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/statusrequest.dart';
import 'package:mainflutterproject/Backend/RemoteData/Auth/login.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/approutes.dart';
import 'package:mainflutterproject/Frontend/Core/Functions/handlingdata.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';

abstract class LoginController extends GetxController {
  passShower();
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController username;
  late TextEditingController pass;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool hidePass = true;
  IconData passIcon = Icons.visibility;
  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();
  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      StatusRequest.loading;
      update();
      var response = await loginData.postData(username.text, pass.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          myServices.sharedPreferences
              .setString("id", response['data']['User_ID'].toString());
          myServices.sharedPreferences
              .setString("username", response['data']['Username']);
          myServices.sharedPreferences
              .setString("email", response['data']['Email']);
          myServices.sharedPreferences
              .setString("phone", response['data']['Phone']);
          myServices.sharedPreferences.setString("step", "2");
          Get.offAllNamed("home");
        } else {
          Get.defaultDialog(title: "Alert".tr, middleText: "Login failed".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  passShower() {
    hidePass = hidePass == true ? false : true;
    passIcon =
        passIcon == Icons.visibility ? Icons.visibility_off : Icons.visibility;
    update();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetpass);
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signup);
  }

  @override
  void onInit() {
    username = TextEditingController();
    pass = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    pass.dispose();
    super.dispose();
  }
}
