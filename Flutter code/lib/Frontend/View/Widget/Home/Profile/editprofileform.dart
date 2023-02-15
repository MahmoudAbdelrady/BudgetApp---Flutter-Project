import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/handlingdataview.dart';
import 'package:mainflutterproject/Frontend/Controller/Profile/ChangeEmail/generatecode_controller.dart';
import 'package:mainflutterproject/Frontend/Controller/Profile/ChangePassword/passwordgeneratecode_controller.dart';
import 'package:mainflutterproject/Frontend/Controller/Profile/editprofile_controller.dart';
import 'package:mainflutterproject/Frontend/Controller/Profile/profile_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Functions/appvalidator.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Profile/profiletextfield.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileController());
    ProfileController profileController = Get.put(ProfileController());
    GenerateCodeController generateCodeController =
        Get.put(GenerateCodeController());
    PasswordGenerateCodeController passwordGenerateCodeController =
        Get.put(PasswordGenerateCodeController());
    return GetBuilder<EditProfileController>(builder: (controller) {
      return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Expanded(
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 27),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Form(
                      key: controller.formstate,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "UsName".tr,
                                    style: const TextStyle(
                                        color: AppColors.primarycolor,
                                        fontSize: 15),
                                  )),
                              Expanded(
                                child: ProfileTextField(
                                  textboxType: "text",
                                  profileTextController: controller.username,
                                  profileTextValidator: (val) =>
                                      inputValidator(val!, 6, 64, "username"),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Email:".tr,
                                  style: const TextStyle(
                                      color: AppColors.primarycolor,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GetBuilder<ProfileController>(
                                  builder: (pcontroller) {
                                return Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      pcontroller.email,
                                      style: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                );
                              }),
                              MaterialButton(
                                color: AppColors.buttonscolor,
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                onPressed: () {
                                  generateCodeController.generateVCode();
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Icon(Icons.alternate_email_outlined),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text("Change Email".tr)
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Password".tr,
                                    style: const TextStyle(
                                        color: AppColors.primarycolor,
                                        fontSize: 15),
                                  )),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: MaterialButton(
                                  color: AppColors.buttonscolor,
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  onPressed: () {
                                    passwordGenerateCodeController
                                        .generateVCode();
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Icon(Icons.lock_reset_outlined),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text("Change Password".tr)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Phone: ".tr,
                                    style: const TextStyle(
                                        color: AppColors.primarycolor,
                                        fontSize: 15),
                                  )),
                              Expanded(
                                child: ProfileTextField(
                                  textboxType: "num",
                                  profileTextController: controller.phone,
                                  profileTextValidator: (val) =>
                                      inputValidator(val!, 8, 14, "phone"),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 110),
                  child: MaterialButton(
                    color: AppColors.buttonscolor,
                    textColor: Colors.white,
                    height: 45,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    onPressed: () async {
                      await controller.changeusnamephone();
                      profileController.updateVar();
                    },
                    child: Text("Save".tr),
                  ),
                )
              ],
            ),
          ));
    });
  }
}
