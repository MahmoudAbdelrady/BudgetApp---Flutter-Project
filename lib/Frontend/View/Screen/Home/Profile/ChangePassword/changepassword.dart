import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/handlingdataview.dart';
import 'package:mainflutterproject/Frontend/Controller/Profile/ChangePassword/changepassword_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appassets.dart';
import 'package:mainflutterproject/Frontend/Core/Functions/appvalidator.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Auth/authbutton.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Auth/authpagetitle.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Auth/authtextformfield.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ChangePasswordController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<ChangePasswordController>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(children: [
                  Image.asset(AppAssets.resetpassword),
                  AuthPageTitle(authTitle: "ResetPass".tr),
                  Form(
                      key: controller.formstate,
                      child: Column(
                        children: [
                          AuthTextFormField(
                              hintText: "Password TBH".tr,
                              type: "pass",
                              iconFormField: Icons.lock_outline_rounded,
                              authvalidator: (val) =>
                                  inputValidator(val!, 8, 128, "password"),
                              authcontroller: controller.pass,
                              passShoweronPressed: () {
                                controller.passShower();
                              },
                              obstcureTextChk: controller.hidepass,
                              eyeIcon: controller.passIcon),
                          AuthTextFormField(
                            hintText: "RePassword TBH".tr,
                            type: "pass",
                            iconFormField: Icons.lock_outline_rounded,
                            authvalidator: (val) =>
                                inputValidator(val!, 8, 128, "password"),
                            authcontroller: controller.repass,
                            passShoweronPressed: () {
                              controller.repassShower();
                            },
                            obstcureTextChk: controller.hiderepass,
                            eyeIcon: controller.repassIcon,
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 38,
                  ),
                  AuthButton(
                      authButtonText: "ChangePass".tr,
                      authButtononPressed: () {
                        controller.changePassword();
                      })
                ]),
              ))),
    );
  }
}
