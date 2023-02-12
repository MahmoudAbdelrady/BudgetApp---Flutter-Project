import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/OnBoarding/onboarding_controller.dart';
import 'package:mainflutterproject/Frontend/View/Widget/OnBoarding/dots.dart';
import 'package:mainflutterproject/Frontend/View/Widget/OnBoarding/onboardingbutton.dart';
import 'package:mainflutterproject/Frontend/View/Widget/OnBoarding/slides.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(flex: 4, child: Slides()),
            Expanded(
                flex: 1,
                child: Column(
                  children: const [
                    DotsOB(),
                    SizedBox(
                      height: 10,
                    ),
                    OnBoardingButtons()
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
