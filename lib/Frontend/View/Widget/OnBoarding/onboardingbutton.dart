import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/OnBoarding/onboarding_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/StaticData/onboardingpages.dart';

class OnBoardingButtons extends StatelessWidget {
  const OnBoardingButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) =>
            controller.currentPage < onboardingList.length - 1
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          controller.skip();
                        },
                        child: Text("SkipButton".tr),
                      ),
                      MaterialButton(
                        onPressed: () {
                          controller.next();
                        },
                        child: Text(
                          "NextButton".tr,
                          style: const TextStyle(color: AppColors.buttonscolor),
                        ),
                      )
                    ],
                  )
                : Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: MaterialButton(
                        color: AppColors.buttonscolor,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 13),
                        onPressed: () {
                          controller.next();
                        },
                        child: Text("GetSButton".tr)),
                  ));
  }
}
