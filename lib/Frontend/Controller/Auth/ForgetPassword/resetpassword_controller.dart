import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/statusrequest.dart';
import 'package:mainflutterproject/Backend/RemoteData/Auth/ForgetPassword/resetpassword.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/approutes.dart';
import 'package:mainflutterproject/Frontend/Core/Functions/handlingdata.dart';

abstract class ResetPasswordController extends GetxController {
  passShower();
  repassShower();
  goToSuccessReset();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  String? email;
  late TextEditingController pass;
  late TextEditingController repass;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  bool hidepass = true;
  bool hiderepass = true;
  IconData passIcon = Icons.visibility;
  IconData repassIcon = Icons.visibility;
  @override
  passShower() {
    hidepass = hidepass == true ? false : true;
    passIcon =
        passIcon == Icons.visibility ? Icons.visibility_off : Icons.visibility;
    update();
  }

  @override
  repassShower() {
    hiderepass = hiderepass == true ? false : true;
    repassIcon = repassIcon == Icons.visibility
        ? Icons.visibility_off
        : Icons.visibility;
    update();
  }

  @override
  goToSuccessReset() async {
    if (pass.text != repass.text) {
      return Get.defaultDialog(
          title: "Attention".tr, middleText: "PassMatch".tr);
    } else {
      var formdata = formstate.currentState;
      if (formdata!.validate()) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await resetPasswordData.postData(email!, pass.text);
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response['status'] == "success") {
            Get.offAllNamed(AppRoutes.successreset);
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
    email = Get.arguments["Email"];
    pass = TextEditingController();
    repass = TextEditingController();
    super.onInit();
  }
}
