import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/AccountWallet/accountwallet_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Budget/AccountWallet/accountwalletcard.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Budget/AccountWallet/accountwalletselectbar.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Budget/AccountWallet/addawdialog.dart';

class AccountWallet extends StatelessWidget {
  const AccountWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AccountWalletController());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 245, 250),
      body: SafeArea(
        child: Column(children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.primarycolor,
                  )),
              SizedBox(width: MediaQuery.of(context).size.width / 15),
              Text(
                "Bank accounts & wallets".tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: AppColors.primarycolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AccountWalletSelectBar(),
              const SizedBox(
                width: 10,
              ),
              Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                  ),
                  child: const AddWalletAccountDialog())
            ],
          ),
          const AccountWalletCard(),
        ]),
      ),
    );
  }
}
