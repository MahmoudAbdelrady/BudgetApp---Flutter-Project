import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/handlingdataview.dart';
import 'package:mainflutterproject/Frontend/Controller/Auth/login_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/approutes.dart';
import 'package:mainflutterproject/Frontend/Core/Functions/appvalidator.dart';
import 'package:mainflutterproject/Frontend/Core/Functions/exitappalert.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Auth/authbutton.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Auth/authpagebottom.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Auth/authpagetitle.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Auth/authtextformfield.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        body: WillPopScope(
          onWillPop: exitAppAlert,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: GetBuilder<LoginControllerImp>(
                builder: (controller) => HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: ListView(
                      children: [
                        Image.asset("Assets/Images/loginpage.PNG"),
                        AuthPageTitle(authTitle: "Login".tr),
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
                                  authcontroller: controller.username,
                                ),
                                GetBuilder<LoginControllerImp>(
                                    builder: (logincontroller) =>
                                        AuthTextFormField(
                                            hintText: "Password TBH".tr,
                                            iconFormField:
                                                Icons.lock_outline_rounded,
                                            type: "pass",
                                            authvalidator: (val) =>
                                                inputValidator(
                                                    val!, 8, 128, "password"),
                                            authcontroller:
                                                logincontroller.pass,
                                            passShoweronPressed: () {
                                              logincontroller.passShower();
                                            },
                                            obstcureTextChk:
                                                logincontroller.hidePass,
                                            eyeIcon: logincontroller.passIcon)),
                              ],
                            )),
                        Container(
                          margin: const EdgeInsets.only(bottom: 15, top: 10),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.forgetpass);
                            },
                            child: Text("Login ForgetPass".tr,
                                textAlign: TextAlign.end,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 15,
                                        color: AppColors.thirdcolor,
                                        fontWeight: FontWeight.bold)),
                          ),
                        ),
                        AuthButton(
                            authButtonText: "Login".tr,
                            authButtononPressed: () {
                              controller.login();
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
                            authPageFooter: "Login Footer 1".tr,
                            authPageFooterbtnText: "Login Footer 2".tr,
                            authPageFooteronTap: () {
                              controller.goToSignUp();
                            })
                      ],
                    ))),
          ),
        ));
  }
}
