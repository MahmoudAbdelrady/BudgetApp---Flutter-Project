import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/statusrequest.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/AccountWallet/addaccountwallet.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/AccountWallet/accountwalletdialog_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';

class NewAccountWalletController extends AccountWalletDialogController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController awName;
  late TextEditingController awAmount;
  String awType = "";
  bool fstate = true;
  MyServices myServices = Get.find();
  AddAccountWalletData addAccountWalletData = AddAccountWalletData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  @override
  addAW() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      if (awType != "") {
        statusRequest = StatusRequest.loading;
        update();
        var response = await addAccountWalletData.postData(
            awName.text,
            awAmount.text,
            awType == "Bank Account".tr ? "Bank Account" : "Wallet",
            myServices.sharedPreferences.getString("id")!);
        if (response['status'] == "success") {
          statusRequest = StatusRequest.success;
          Get.back();
          Get.defaultDialog(
            title: "Status".tr,
            middleText: myServices.sharedPreferences.getString("Lang") == "en"
                ? "${awType.tr} added successfully"
                : "تمت إضافة ${awType.tr} بنجاح",
            onConfirm: () => Get.back(),
          );
          awName.clear();
          awAmount.clear();
          changeAWType("");
          fstate = true;
        } else {
          Get.defaultDialog(
            title: "Alert".tr,
            middleText: myServices.sharedPreferences.getString("Lang") == "en"
                ? "${awType.tr} adding failed"
                : "فشل إضافة ${awType.tr}",
            onConfirm: () => Get.back(),
          );
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
        fstate = false;
        update();
      }
    } else {
      fstate = false;
      update();
    }
  }

  @override
  changeAWType(String type) {
    awType = type;
    update();
  }

  @override
  clearFields() {
    awName.clear();
    awAmount.clear();
    changeAWType("");
    fstate = true;
    update();
  }

  @override
  void onInit() {
    awName = TextEditingController();
    awAmount = TextEditingController();
    super.onInit();
  }
}
