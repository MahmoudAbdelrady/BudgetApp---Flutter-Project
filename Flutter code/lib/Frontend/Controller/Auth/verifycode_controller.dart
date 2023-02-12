import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/statusrequest.dart';
import 'package:mainflutterproject/Backend/RemoteData/Auth/verifycode.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/approutes.dart';
import 'package:mainflutterproject/Frontend/Core/Functions/handlingdata.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode(String pin);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());
  @override
  checkCode(String pin) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeData.postData(email!, pin);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.successsignup);
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
