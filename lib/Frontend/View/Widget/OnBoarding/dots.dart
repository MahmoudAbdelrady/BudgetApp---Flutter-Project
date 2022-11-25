import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/OnBoarding/onboarding_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/StaticData/onboardingpages.dart';

class DotsOB extends StatelessWidget {
  const DotsOB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onboardingList.length,
                    (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          margin: const EdgeInsets.only(right: 5, top: 15),
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                              color: controller.currentPage == index
                                  ? AppColors.primarycolor
                                  : Colors.transparent,
                              border: Border.all(color: AppColors.primarycolor),
                              borderRadius: BorderRadius.circular(20)),
                        ))
              ],
            ));
  }
}
