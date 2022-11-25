import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/approutes.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';
import 'package:mainflutterproject/Frontend/StaticData/onboardingpages.dart';

abstract class OnBoardingController extends GetxController {
  next();
  skip();
  onPageChange(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;
  late PageController pageController;
  MyServices myServices = Get.find();
  @override
  next() {
    currentPage++;
    if (currentPage > onboardingList.length - 1) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  @override
  skip() {
    myServices.sharedPreferences.setString("step", "1");
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  onPageChange(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
