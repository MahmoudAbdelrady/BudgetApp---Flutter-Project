import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/AccountWallet/accountwalletdialogtab_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

class AWDialogSelectBar extends StatelessWidget {
  const AWDialogSelectBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AccountWalletDialogTabController awdController =
        Get.put(AccountWalletDialogTabController());
    Object? selectedType = "New account/wallet".tr;
    return GetBuilder<AccountWalletDialogTabController>(builder: (context) {
      return Container(
        color: Colors.grey[200],
        child: DropdownButton(
          isExpanded: true,
          icon: const Icon(Icons.expand_more),
          underline: const SizedBox(),
          items: ["New account/wallet".tr, "Add money".tr]
              .map((e) => DropdownMenuItem(
                  value: e,
                  child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        e,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: AppColors.primarycolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ))))
              .toList(),
          onChanged: (value) {
            selectedType = value;
            awdController.changeTab(value.toString());
          },
          value: selectedType,
        ),
      );
    });
  }
}
