import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/statusrequest.dart';
import 'package:mainflutterproject/Backend/RemoteData/Auth/ForgetPassword/verifycodeforgetpass.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/approutes.dart';
import 'package:mainflutterproject/Frontend/Core/Functions/handlingdata.dart';

abstract class ForgetPassVerifyCodeController extends GetxController {
  checkCode(String pin);
}

class ForgetPassVerifyCodeControllerImp extends ForgetPassVerifyCodeController {
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  VerifyCodeForgetPassData verifyCodeForgetPassData =
      VerifyCodeForgetPassData(Get.find());
  @override
  checkCode(String pin) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeForgetPassData.postData(email!, pin);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.resetpassword, arguments: {"Email": email});
      } else {
        Get.defaultDialog(title: "Alert".tr, middleText: "VerifyCodeFailed".tr);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["Email"];
    super.onInit();
  }
}
