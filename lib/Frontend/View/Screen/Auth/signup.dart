import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/handlingdataview.dart';
import 'package:mainflutterproject/Frontend/Controller/Auth/signup_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Functions/appvalidator.dart';
import 'package:mainflutterproject/Frontend/Core/Functions/exitappalert.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Auth/authbutton.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Auth/authpagebottom.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Auth/authpagetitle.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Auth/authtextformfield.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        body: WillPopScope(
          onWillPop: exitAppAlert,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: GetBuilder<SignUpControllerImp>(
                builder: (controller) => HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: ListView(
                      children: [
                        Image.asset("Assets/Images/signup.PNG"),
                        AuthPageTitle(authTitle: "SignUp".tr),
                        Form(
                            key: controller.formstate,
                            child: Column(
                              children: [
                                AuthTextFormField(
                                    hintText: "Username TBH".tr,
                                    iconFormField: Icons.person,
                                    type: "username",
                                    authvalidator: (val) =>
                                        inputValidator(val!, 6, 64, "username"),
                                    authcontroller: controller.username),
                                AuthTextFormField(
                                    hintText: "Email TBH".tr,
                                    iconFormField: Icons.alternate_email,
                                    type: "email",
                                    authvalidator: (val) =>
                                        inputValidator(val!, 3, 254, "email"),
                                    authcontroller: controller.email),
                                AuthTextFormField(
                                    hintText: "Phone TBH".tr,
                                    iconFormField: Icons.phone,
                                    type: "phone",
                                    authvalidator: (val) =>
                                        inputValidator(val!, 8, 14, "phone"),
                                    authcontroller: controller.phone),
                                GetBuilder<SignUpControllerImp>(
                                    builder: (signupcontroller) =>
                                        AuthTextFormField(
                                            hintText: "Password TBH".tr,
                                            iconFormField:
                                                Icons.lock_outline_rounded,
                                            type: "pass",
                                            authvalidator: (val) =>
                                                inputValidator(
                                                    val!, 8, 128, "password"),
                                            authcontroller:
                                                signupcontroller.pass,
                                            passShoweronPressed: () {
                                              signupcontroller.passShower();
                                            },
                                            obstcureTextChk:
                                                signupcontroller.hidePass,
                                            eyeIcon: signupcontroller.passIcon))
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        AuthButton(
                            authButtonText: "SignUp".tr,
                            authButtononPressed: () {
                              controller.signup();
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Color.fromARGB(255, 204, 204, 204),
                        ),
                        AuthPageFooter(
                            authPageFooter: "SignUp Footer 1".tr,
                            authPageFooterbtnText: "SignUp Footer 2".tr,
                            authPageFooteronTap: () {
                              controller.goToLogin();
                            })
                      ],
                    ))),
          ),
        ));
  }
}
