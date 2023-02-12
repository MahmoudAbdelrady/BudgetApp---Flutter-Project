import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/statusrequest.dart';
import 'package:mainflutterproject/Backend/RemoteData/Profile/editpusernamephone.dart';
import 'package:mainflutterproject/Frontend/Controller/Profile/profile_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';

class EditProfileController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();
  EditPUsernamePhoneData editPUsernamePhoneData =
      EditPUsernamePhoneData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  ProfileController profileController = ProfileController();
  changeusnamephone() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await editPUsernamePhoneData.postData(username.text,
          phone.text, myServices.sharedPreferences.getString("id")!);
      if (response['status'] == "success") {
        statusRequest = StatusRequest.success;
        myServices.sharedPreferences
            .setString("username", response['data']['Username']);
        myServices.sharedPreferences
            .setString("phone", response['data']['Phone']);

        // Get.off(const );
        update();
        Get.back();
        Get.defaultDialog(
            title: "Status".tr,
            content: Text("ProfileUpdateSuccess".tr),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonscolor),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Ok".tr))
            ]);
      }
    }
  }

  @override
  void onInit() {
    username.text = Get.arguments['Username'];
    phone.text = Get.arguments['Phone'];
    super.onInit();
  }
}
