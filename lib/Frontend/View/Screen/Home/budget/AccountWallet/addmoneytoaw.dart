import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/AccountWallet/addmoneytoaw_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Functions/appvalidator.dart';
import 'package:mainflutterproject/Frontend/Model/accountwalletmodel.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Budget/AccountWallet/awbutton.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Budget/AccountWallet/batextformfield.dart';

class AddMoneyToAW extends StatelessWidget {
  const AddMoneyToAW({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddMoneyToAWController());
    List options = ["Bank Account".tr, "Wallet".tr];
    return GetBuilder<AddMoneyToAWController>(builder: (controller) {
      return Form(
          key: controller.formstate,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "AWType".tr,
                    style: const TextStyle(color: AppColors.primarycolor),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppColors.buttonscolor)),
                      child: DropdownButton(
                        isExpanded: true,
                        underline: const SizedBox(),
                        items: options
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      e,
                                      textAlign: TextAlign.center,
                                    ))))
                            .toList(),
                        onChanged: (value) {
                          controller.changeAWType(value.toString());
                          controller.getAW(options.indexOf(value.toString()));
                          /*accountWalletController
                              .getAW(options.indexOf(value.toString()));*/
                        },
                        value:
                            controller.awType == "" ? null : controller.awType,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "SAW".tr,
                    style: const TextStyle(color: AppColors.primarycolor),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: AppColors.buttonscolor)),
                child: DropdownButton(
                  isExpanded: true,
                  underline: const SizedBox(),
                  items: controller.awList
                      .map((e) => DropdownMenuItem(
                          value: AccountWalletModel.fromJson(e).name,
                          child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                AccountWalletModel.fromJson(e).name!,
                                textAlign: TextAlign.center,
                              ))))
                      .toList(),
                  onChanged: (value) {
                    controller.changeAWData(value.toString());
                  },
                  value: controller.awData == "" ? null : controller.awData,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("AWAmount".tr,
                      style: const TextStyle(
                        color: AppColors.primarycolor,
                      )),
                  Expanded(
                      child: BATextFormField(
                    textboxType: "num",
                    awValidator: (val) => inputValidator(val!, 1, 12, "num"),
                    awtextController: controller.awAmount,
                  ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AWButton("Save".tr, () {
                    controller.addAW();
                  }, AppColors.buttonscolor),
                  AWButton("Clear".tr, () {
                    controller.clearFields();
                  }, AppColors.secondarycolor)
                ],
              ),
            ],
          ));
    });
  }
}
