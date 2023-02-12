import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/statusrequest.dart';
import 'package:mainflutterproject/Backend/RemoteData/Budget/editautotransaction.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';

class EditAutoTransactionController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController title;
  late TextEditingController titleType;
  late TextEditingController amount;
  late TextEditingController actionDate;
  String autoTransID = "";
  String transType = "Choose transaction type";
  String actionRate = "Choose rate";
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  EditAutoTransactionData editAutoTransactionData =
      EditAutoTransactionData(Get.find());
  editAutoTransaction() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      if (transType != "Choose transaction type" &&
          actionRate != "Choose rate") {
        statusRequest = StatusRequest.loading;
        update();
        var response = await editAutoTransactionData.postData(
            autoTransID,
            myServices.sharedPreferences.getString("id")!,
            title.text,
            titleType.text,
            amount.text,
            transType,
            actionRate);
        if (response['status'] == "success") {
          statusRequest = StatusRequest.success;
          Get.back();
          Get.defaultDialog(
              title: "Status".tr,
              middleText: "AutoTransEditSuccess".tr,
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
              middleText: "AutoTransEditFail".tr,
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
            content: Text("ChooseTypeAlert".tr),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonscolor),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Ok".tr))
            ]);
        update();
      }
    }
  }

  clearFields() {
    title.clear();
    titleType.clear();
    amount.clear();
    changeTransType("Choose transaction type");
    changeRate("Choose rate");
    update();
  }

  changeTransType(String type) {
    transType = type;
    update();
  }

  changeRate(String rate) {
    actionRate = rate;
    update();
  }

  updateControllerValues(
      String autoTitle,
      String autoTitleType,
      String autoAmount,
      String autoTransType,
      String autoRate,
      String autoTransID,
      String autoTransDate) {
    title.text = autoTitle;
    titleType.text = autoTitleType;
    amount.text = autoAmount;
    transType = autoTransType;
    actionRate = autoRate;
    autoTransID = autoTransID;
    actionDate.text = autoTransDate;
    update();
  }

  @override
  void onInit() {
    title = TextEditingController();
    titleType = TextEditingController();
    amount = TextEditingController();
    actionDate = TextEditingController();
    super.onInit();
  }
}
