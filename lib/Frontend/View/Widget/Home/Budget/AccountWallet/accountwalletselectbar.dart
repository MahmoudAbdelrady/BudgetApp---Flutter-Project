import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/AccountWallet/accountwallet_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

class AccountWalletSelectBar extends StatelessWidget {
  const AccountWalletSelectBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AccountWalletController());
    return Container(
      height: 50,
      width: 230,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(50)),
      child: GetBuilder<AccountWalletController>(builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 110,
              decoration: controller.selectedTab == 0
                  ? BoxDecoration(
                      color: AppColors.primarycolor,
                      borderRadius: BorderRadius.circular(50))
                  : null,
              child: InkWell(
                onTap: () {
                  controller.changeTab(0);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Bank Accounts".tr,
                      style: TextStyle(
                          color: controller.selectedTab == 0
                              ? Colors.white
                              : AppColors.primarycolor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const VerticalDivider(
              width: 26,
              color: Colors.black,
              thickness: 0.5,
            ),
            Container(
              height: double.infinity,
              width: 85,
              decoration: controller.selectedTab == 1
                  ? BoxDecoration(
                      color: AppColors.primarycolor,
                      borderRadius: BorderRadius.circular(50))
                  : null,
              child: InkWell(
                onTap: () {
                  controller.changeTab(1);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Wallets".tr,
                      style: TextStyle(
                          color: controller.selectedTab == 1
                              ? Colors.white
                              : AppColors.primarycolor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
