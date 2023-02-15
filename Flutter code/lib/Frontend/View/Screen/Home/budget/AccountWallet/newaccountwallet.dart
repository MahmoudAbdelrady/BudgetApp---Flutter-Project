import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/Core/Classes/handlingdataview.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/AccountWallet/newaccountwallet_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Functions/appvalidator.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Budget/AccountWallet/awbutton.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Budget/AccountWallet/batextformfield.dart';

class NewAccountWallet extends StatelessWidget {
  const NewAccountWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(NewAccountWalletController());
    return GetBuilder<NewAccountWalletController>(builder: (controller) {
      return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Form(
            key: controller.formstate,
            child: SizedBox(
              height: controller.fstate ? 340 : 380,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("AWName".tr,
                          style: const TextStyle(
                            color: AppColors.primarycolor,
                          )),
                    ],
                  ),
                  BATextFormField(
                    awValidator: (val) => inputValidator(val!, 1, 40, "text"),
                    awtextController: controller.awName,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("AWAmount".tr,
                          style: const TextStyle(
                            color: AppColors.primarycolor,
                          )),
                    ],
                  ),
                  BATextFormField(
                    textboxType: "num",
                    awValidator: (val) => inputValidator(val!, 1, 12, "num"),
                    awtextController: controller.awAmount,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "AWType".tr,
                        style: const TextStyle(color: AppColors.primarycolor),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      width: 180,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppColors.buttonscolor)),
                      child: DropdownButton(
                        isExpanded: true,
                        underline: const SizedBox(),
                        items: ["Bank Account".tr, "Wallet".tr]
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        e,
                                        textAlign: TextAlign.center,
                                      )),
                                ))
                            .toList(),
                        onChanged: (val) {
                          controller.changeAWType(val.toString());
                        },
                        value:
                            controller.awType == "" ? null : controller.awType,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AWButton("Save".tr, () {
                        controller.addAW();
                      }, Colors.green),
                      AWButton("Clear".tr, () {
                        controller.clearFields();
                      }, AppColors.buttonscolor)
                    ],
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
