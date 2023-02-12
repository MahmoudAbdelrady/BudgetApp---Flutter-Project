import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/statusrequest.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/AccountWallet/editaccountwallet.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/AccountWallet/accountwallet_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';

class EditAWController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController awName = TextEditingController();
  TextEditingController awAmount = TextEditingController();
  String awType = "";
  String awID = "";
  bool fstate = true;
  MyServices myServices = Get.find();
  EditAccountWalletData editAccountWalletData =
      EditAccountWalletData(Get.find());
  AccountWalletController accountWalletController =
      Get.put(AccountWalletController());
  StatusRequest statusRequest = StatusRequest.none;
  editAW() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      if (awType != "") {
        statusRequest = StatusRequest.loading;
        update();
        var response = await editAccountWalletData.postData(
            awName.text,
            awAmount.text,
            awType == "Bank Account".tr ? "Bank Account" : "Wallet",
            myServices.sharedPreferences.getString("id")!,
            awID);
        if (response['status'] == "success") {
          statusRequest = StatusRequest.success;
          Get.back();
          Get.defaultDialog(
              title: "Status".tr,
              middleText: myServices.sharedPreferences.getString("Lang") == "en"
                  ? "Your $awType has been edited successfully"
                  : "تمت عملية التعديل بنجاح",
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonscolor),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Ok".tr))
              ]);
          accountWalletController.getAW(accountWalletController.selectedTab);
          awName.clear();
          awAmount.clear();
          changeAWType("");
          fstate = true;
        } else {
          Get.defaultDialog(
              title: "Alert".tr,
              middleText: myServices.sharedPreferences.getString("Lang") == "en"
                  ? "Your $awType editing has failed. Please try again"
                  : "فشلت عملية التعديل. من فضلك حاول مرة أخرى",
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonscolor),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Ok".tr))
              ]);
          statusRequest = StatusRequest.failure;
        }
        update();
      } else {
        Get.defaultDialog(
            title: "Alert".tr,
            middleText: "ChooseTypeAlert".tr,
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
    } else {
      fstate = false;
      update();
    }
  }

  changeAWType(String type) {
    awType = type;
    update();
  }

  updateControllerValues(
      String acwaName, String acwaAmount, String acwaType, String acwaID) {
    awName.text = acwaName;
    awAmount.text = acwaAmount;
    awType = acwaType;
    awID = acwaID;
    update();
  }

  clearFields() {
    awName.clear();
    awAmount.clear();
    changeAWType("");
    fstate = true;
  }
}
