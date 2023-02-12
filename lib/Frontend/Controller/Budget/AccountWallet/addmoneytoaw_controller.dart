import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/statusrequest.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/AccountWallet/addaccountwallet.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/AccountWallet/viewaccountwallet.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/AccountWallet/accountwalletdialog_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';

class AddMoneyToAWController extends AccountWalletDialogController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  String awType = "";
  String awData = "";
  late TextEditingController awAmount;
  bool fstate = true;
  List awList = [];
  MyServices myServices = Get.find();
  AddAccountWalletData addAccountWalletData = AddAccountWalletData(Get.find());
  ViewAccountWalletData viewAccountWalletData =
      ViewAccountWalletData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  @override
  addAW() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      if (awType != "" && awData != "") {
        statusRequest = StatusRequest.loading;
        update();
        var response = await addAccountWalletData.postData(
            awData,
            awAmount.text,
            awType == "Bank Account".tr ? "Bank Account" : "Wallet",
            myServices.sharedPreferences.getString("id")!);
        if (response['status'] == "success") {
          statusRequest = StatusRequest.success;
          Get.back();
          Get.defaultDialog(
              title: "Status".tr,
              middleText: myServices.sharedPreferences.getString("Lang") == "en"
                  ? "${awAmount.text} added successfully to $awData ${awType.tr}"
                  : "تمت إضافة ${awAmount.text} بنجاح إلى $awData",
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonscolor),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Ok".tr))
              ]);
          // awName.clear();
          awAmount.clear();
          changeAWType("");
          changeAWData("");
          fstate = true;
        } else {
          Get.defaultDialog(
              title: "Alert".tr,
              middleText: myServices.sharedPreferences.getString("Lang") == "en"
                  ? "${awAmount.text} adding failed"
                  : "فشل إضافة ${awAmount.text}",
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
        if (awType == "") {
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
        } else {
          Get.defaultDialog(
              title: "Alert".tr,
              middleText: "ChooseAWAlert".tr,
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

        fstate = false;
        update();
      }
    } else {
      fstate = false;
      update();
    }
  }

  getAW(int tabType) async {
    String type = tabType == 0 ? "Bank Account" : "Wallet";
    awList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewAccountWalletData.postData(
        myServices.sharedPreferences.getString("id")!, type);
    if (response['status'] == "success") {
      awList.addAll(response['data']);
      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  clearFields() {
    changeAWType("");
    changeAWData("");
    fstate = true;
    awAmount.clear();
    update();
  }

  @override
  changeAWType(String type) {
    awType = type;
    update();
  }

  changeAWData(String data) {
    awData = data;
    update();
  }

  @override
  void onInit() {
    awAmount = TextEditingController();
    super.onInit();
  }
}
