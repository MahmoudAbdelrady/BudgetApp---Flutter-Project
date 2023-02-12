import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appassets.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/approutes.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Auth/authbutton.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(children: [
          Lottie.asset(AppAssets.success, repeat: false),
          Text(
            "Successful Create".tr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          AuthButton(
              authButtonText: "Login".tr,
              authButtononPressed: () {
                Get.offAllNamed(AppRoutes.login);
              })
        ]),
      ),
    );
  }
}
