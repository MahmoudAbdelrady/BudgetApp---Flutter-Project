import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/handlingdataview.dart';
import 'package:mainflutterproject/Frontend/Controller/Auth/ForgetPassword/forgetpassverifycode_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appassets.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Auth/authpagetitle.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class ForgetPassVerifyCode extends StatelessWidget {
  const ForgetPassVerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPassVerifyCodeControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<ForgetPassVerifyCodeControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(children: [
                  Image.asset(AppAssets.otp),
                  ListTile(
                      title: AuthPageTitle(authTitle: "OTP Title".tr),
                      subtitle: Container(
                        margin: const EdgeInsets.only(top: 7, bottom: 14),
                        child: Text(
                          "OTP Subtitle".tr,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
                  OTPTextField(
                    length: 5,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 40,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 15,
                    otpFieldStyle: OtpFieldStyle(
                        enabledBorderColor: AppColors.primarycolor,
                        focusBorderColor: AppColors.buttonscolor),
                    onCompleted: (pin) {
                      controller.checkCode(pin);
                    },
                  ),
                ]),
              ))),
    );
  }
}
