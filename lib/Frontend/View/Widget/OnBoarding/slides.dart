import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/OnBoarding/onboarding_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/StaticData/onboardingpages.dart';

class Slides extends GetView<OnBoardingControllerImp> {
  const Slides({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChange(value);
      },
      itemCount: onboardingList.length,
      itemBuilder: (context, index) => Column(
        children: [
          Text(
            onboardingList[index].title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primarycolor,
              fontSize: 21,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            onboardingList[index].image,
            height: 320,
            width: 320,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            onboardingList[index].body,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
