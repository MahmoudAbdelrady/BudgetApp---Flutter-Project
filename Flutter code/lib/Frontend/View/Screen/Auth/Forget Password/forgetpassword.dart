import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/handlingdataview.dart';
import 'package:mainflutterproject/Frontend/Controller/Auth/ForgetPassword/forgetpassword_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appassets.dart';
import 'package:mainflutterproject/Frontend/Core/Functions/appvalidator.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Auth/authbutton.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Auth/authpagetitle.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Auth/authtextformfield.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    Image.asset(
                      AppAssets.forgetpassword,
                    ),
                    ListTile(
                      title: AuthPageTitle(authTitle: "ForgetPass".tr),
                      subtitle: Container(
                        margin: const EdgeInsets.only(top: 7, bottom: 14),
                        child: Text(
                          "ForgetPassSub".tr,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Form(
                        key: controller.formstate,
                        child: AuthTextFormField(
                            hintText: "Email TBH".tr,
                            type: "email",
                            iconFormField: Icons.alternate_email,
                            authvalidator: (val) =>
                                inputValidator(val!, 3, 254, "email"),
                            authcontroller: controller.email)),
                    const SizedBox(
                      height: 38,
                    ),
                    AuthButton(
                        authButtonText: "Submit".tr,
                        authButtononPressed: () {
                          controller.checkEmail();
                        })
                  ],
                ),
              ))),
    );
  }
}
