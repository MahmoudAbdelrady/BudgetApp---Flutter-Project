import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mainflutterproject/Frontend/Controller/Profile/profile_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Home/Profile/editprofile.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Containers/customcontainerheader.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Profile/inforow.dart';

class ProfileCustomCard extends StatelessWidget {
  const ProfileCustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return GetBuilder<ProfileController>(builder: (controller) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 27),
            // height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomContainerHeader(headerText: "Profile Info".tr),
                    const SizedBox(
                      width: 15,
                    ),
                    MaterialButton(
                      color: AppColors.buttonscolor,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      onPressed: () {
                        Get.to(() => const EditProfile(), arguments: {
                          "Username": controller.myServices.sharedPreferences
                              .getString("username"),
                          "Phone": controller.myServices.sharedPreferences
                              .getString("phone")
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.edit),
                          const SizedBox(
                            width: 5,
                          ),
                          Text("Edit".tr)
                        ],
                      ),
                    )
                  ],
                ),
                InfoRow(
                    mainInfo: "Email".tr,
                    linkInfo: controller.email,
                    type: "info"),
                InfoRow(
                    mainInfo: "Phone".tr,
                    linkInfo: controller.phone,
                    type: "info"),
                const SizedBox(
                  height: 8,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 98),
            child: MaterialButton(
              color: AppColors.buttonscolor,
              textColor: Colors.white,
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onPressed: () {
                controller.logout(
                    controller.myServices.sharedPreferences.getString("Lang")!);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.logout_rounded),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Logout".tr,
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}
