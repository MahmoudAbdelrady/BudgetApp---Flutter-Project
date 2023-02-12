import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Profile/editprofileform.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ProfileController profileController = Get.put(ProfileController());
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 248, 245, 250),
          body: SafeArea(
              child: Column(children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                      // profileController.updateVar();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.primarycolor,
                    )),
                SizedBox(width: MediaQuery.of(context).size.width / 4),
                Text(
                  "Edit Profile".tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: AppColors.primarycolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )
              ],
            ),
            const EditProfileForm()
          ]))),
    );
  }
}
