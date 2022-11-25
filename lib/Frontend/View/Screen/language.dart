import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/approutes.dart';
import 'package:mainflutterproject/Frontend/Core/Localization/changelocale.dart';

class Language extends GetView<LocaleController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Choose App Language"),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: AppColors.primarycolor)),
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRoutes.onboarding);
              },
              child: const Text("Arabic"),
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: AppColors.primarycolor)),
              onPressed: () {
                controller.changeLang("en");
                Get.toNamed(AppRoutes.onboarding);
              },
              child: const Text("English"),
            ),
          ],
        ),
      ),
    );
  }
}
