import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/Profile/profile_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

class ProfileAppBar extends GetView<ProfileController> {
  const ProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: AppColors.primarycolor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Stack(
        children: [
          SafeArea(
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 26,
                )),
          ),
          Positioned(
              top: -73,
              right:
                  controller.myServices.sharedPreferences.getString("Lang") ==
                          "en"
                      ? -42
                      : null,
              left: controller.myServices.sharedPreferences.getString("Lang") ==
                      "ar"
                  ? -42
                  : null,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 44, 0, 92),
                    borderRadius: BorderRadius.circular(160)),
              )),
          Positioned(
              top: -50,
              right:
                  controller.myServices.sharedPreferences.getString("Lang") ==
                          "en"
                      ? -20
                      : null,
              left: controller.myServices.sharedPreferences.getString("Lang") ==
                      "ar"
                  ? -20
                  : null,
              child: Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 37, 0, 77),
                    borderRadius: BorderRadius.circular(160)),
              )),
          SafeArea(
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 26,
                )),
          ),
          GetBuilder<ProfileController>(builder: (controller) {
            return Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage("Assets/Images/defaultuser.png"),
                      backgroundColor: AppColors.secondarycolor,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        controller.username,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ));
          }),
        ],
      ),
    );
  }
}
