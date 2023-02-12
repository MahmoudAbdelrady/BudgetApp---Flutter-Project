import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Home/budget/AccountWallet/accountwallet.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Home/budget/autotransactions.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Home/budget/history.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Budget/budgetcustomcard.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/customappbar.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/homecustomcard.dart';

class Budget extends StatelessWidget {
  const Budget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(),
          Expanded(
            child: ListView(
              children: [
                const HomeCustomCard(),
                BudgetCustomCard(
                    cardTitle: "Bank accounts & wallets".tr,
                    cardIcon: Icons.monetization_on_outlined,
                    cardOnTap: () {
                      Get.to(() => const AccountWallet());
                    }),
                BudgetCustomCard(
                    cardTitle: "My auto transactions".tr,
                    cardIcon: Icons.autorenew_rounded,
                    cardOnTap: () {
                      Get.to(() => const AutoTransactions());
                    }),
                BudgetCustomCard(
                    cardTitle: "History".tr,
                    cardIcon: Icons.history,
                    cardOnTap: () {
                      Get.to(() => const History());
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
