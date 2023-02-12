import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/statusrequest.dart';
import 'package:mainflutterproject/Backend/RemoteData/Auth/signup.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/approutes.dart';
import 'package:mainflutterproject/Frontend/Core/Functions/handlingdata.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';

abstract class SignUpController extends GetxController {
  passShower();
  signup();
  goToLogin();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController pass;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool hidePass = true;
  IconData passIcon = Icons.visibility;
  SignUpData signUpData = SignUpData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  @override
  signup() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      StatusRequest.loading;
      update();
      var response = await signUpData.postData(
          username.text, email.text, phone.text, pass.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.verifycode, arguments: {"Email": email.text});
        } else {
          Get.defaultDialog(title: "Alert".tr, middleText: "SignUp failed".tr);
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
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    pass = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    pass.dispose();
    super.dispose();
  }
}
