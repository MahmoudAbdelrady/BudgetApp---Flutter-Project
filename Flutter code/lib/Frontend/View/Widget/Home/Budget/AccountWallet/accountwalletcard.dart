import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/handlingdataview.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/AccountWallet/accountwallet_controller.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/AccountWallet/accountwalletcard_controller.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/AccountWallet/editaccountwallet_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Model/accountwalletmodel.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Home/budget/AccountWallet/editaccountwallet.dart';

class AccountWalletCard extends StatelessWidget {
  const AccountWalletCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AccountWalletController());
    EditAWController editAWController = Get.put(EditAWController());
    AccountWalletCardController accountWalletCardController =
        Get.put(AccountWalletCardController());
    return GetBuilder<AccountWalletController>(builder: (controller) {
      return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Expanded(
              child: ListView.builder(
            itemCount: controller.awList.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Flexible(
                      child: ListTile(
                    title: Text(
                      "${AccountWalletModel.fromJson(controller.awList[index]).name}",
                      style: const TextStyle(
                          color: AppColors.primarycolor, fontSize: 17),
                    ),
                    trailing: Text(
                      "${AccountWalletModel.fromJson(controller.awList[index]).amount.toString()}\$",
                      style: const TextStyle(
                          color: AppColors.thirdcolor, fontSize: 17),
                    ),
                  )),
                  InkWell(
                      onTap: () {
                        editAWController.updateControllerValues(
                            AccountWalletModel.fromJson(
                                    controller.awList[index])
                                .name!,
                            AccountWalletModel.fromJson(
                                    controller.awList[index])
                                .amount!,
                            AccountWalletModel.fromJson(
                                    controller.awList[index])
                                .type!
                                .tr,
                            AccountWalletModel.fromJson(
                                    controller.awList[index])
                                .iD!
                                .toString());
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              scrollable: true,
                              title: Text(
                                  "${"Edit".tr} ${AccountWalletModel.fromJson(controller.awList[index]).type.toString().tr}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: AppColors.primarycolor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17)),
                              content: const EditAccountWallet(),
                            );
                          },
                        );
                        // controller.getAW(controller.selectedTab);
                      },
                      child: const Icon(
                        Icons.border_color_rounded,
                        color: Colors.green,
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                      onTap: () {
                        Get.defaultDialog(
                          title: "Alert".tr,
                          middleText: controller.myServices.sharedPreferences
                                      .getString("Lang") ==
                                  "en"
                              ? "Do you want to delete this ${AccountWalletModel.fromJson(controller.awList[index]).type} ?"
                              : "هل تريد أن تقوم بحذف هذا الحساب/المحفظة ؟",
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.buttonscolor),
                                onPressed: () async {
                                  accountWalletCardController.awName =
                                      AccountWalletModel.fromJson(
                                              controller.awList[index])
                                          .name;
                                  accountWalletCardController.awType =
                                      AccountWalletModel.fromJson(
                                              controller.awList[index])
                                          .type;
                                  await accountWalletCardController.deleteAW();
                                  controller.getAW(controller.selectedTab);
                                  Get.back();
                                },
                                child: Text("Yes".tr)),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.secondarycolor),
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text("No".tr))
                          ],
                        );
                      },
                      child: const Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.red,
                        size: 30,
                      )),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
          )));
    });
  }
}
