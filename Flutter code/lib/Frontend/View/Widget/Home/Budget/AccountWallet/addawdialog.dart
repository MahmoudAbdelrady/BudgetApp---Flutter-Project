import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/AccountWallet/accountwallet_controller.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/AccountWallet/accountwalletdialogtab_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Home/budget/AccountWallet/addmoneytoaw.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Home/budget/AccountWallet/newaccountwallet.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Budget/AccountWallet/awdialogselectbar.dart';

class AddWalletAccountDialog extends StatelessWidget {
  const AddWalletAccountDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AccountWalletDialogTabController awdController =
        Get.put(AccountWalletDialogTabController());
    AccountWalletController accountWalletController =
        Get.put(AccountWalletController());
    return InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return GetBuilder<AccountWalletDialogTabController>(
                    builder: (context) {
                  return AlertDialog(
                    scrollable: true,
                    title: const AWDialogSelectBar(),
                    content: Column(
                      children: [
                        SizedBox(
                          height: awdController.selectedTab == 0 ? 0 : 10,
                        ),
                        awdController.selectedTab == 0
                            ? const NewAccountWallet()
                            : const AddMoneyToAW(),
                      ],
                    ),
                  );
                });
              }).then((value) {
            awdController.selectedTab = 0;
            accountWalletController.getAW(accountWalletController.selectedTab);
          });
        },
        child: const Icon(
          Icons.add,
          color: AppColors.buttonscolor,
        ));
  }
}
