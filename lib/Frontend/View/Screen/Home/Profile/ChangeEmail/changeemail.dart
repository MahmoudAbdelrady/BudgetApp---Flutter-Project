import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/handlingdataview.dart';
import 'package:mainflutterproject/Frontend/Controller/Profile/ChangeEmail/changeemail_controller.dart';
import 'package:mainflutterproject/Frontend/Controller/Profile/profile_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appassets.dart';
import 'package:mainflutterproject/Frontend/Core/Functions/appvalidator.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Auth/authbutton.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Auth/authpagetitle.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Auth/authtextformfield.dart';

class ChangeEmail extends StatelessWidget {
  const ChangeEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ChangeEmailController());
    ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<ChangeEmailController>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(children: [
                  Image.asset(
                    AppAssets.changeemail,
                    height: 200,
                    width: 200,
                  ),
                  AuthPageTitle(authTitle: "Change your email".tr),
                  Form(
                      key: controller.formstate,
                      child: Column(
                        children: [
                          AuthTextFormField(
                              hintText: "Enter email".tr,
                              type: "email",
                              iconFormField: Icons.alternate_email_outlined,
                              authvalidator: (val) =>
                                  inputValidator(val!, 3, 254, "email"),
                              authcontroller: controller.email),
                          AuthTextFormField(
                            hintText: "ReEnter email".tr,
                            type: "email",
                            iconFormField: Icons.alternate_email_outlined,
                            authvalidator: (val) =>
                                inputValidator(val!, 3, 254, "email"),
                            authcontroller: controller.reEmail,
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 38,
                  ),
                  AuthButton(
                      authButtonText: "Change email".tr,
                      authButtononPressed: () async {
                        await controller.changeEmail();
                        profileController.updateVar();
                      })
                ]),
              ))),
    );
  }
}
