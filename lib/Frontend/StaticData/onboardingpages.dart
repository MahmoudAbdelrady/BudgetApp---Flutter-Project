import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/AppAssets.dart';
import 'package:mainflutterproject/Frontend/Model/onboardingmodel.dart';

List<OnBoardingModel> onboardingList = [
  OnBoardingModel(
      title: "Onboarding_Title1".tr,
      image: AppAssets.onboardingImageOne,
      body: "Onboarding_Body1".tr),
  OnBoardingModel(
      title: "Onboarding_Title2".tr,
      image: AppAssets.onboardingImageTwo,
      body: "Onboarding_Body2".tr),
  OnBoardingModel(
      title: "Onboarding_Title3".tr,
      image: AppAssets.onboardingImageThree,
      body: "Onboarding_Body3".tr)
];
