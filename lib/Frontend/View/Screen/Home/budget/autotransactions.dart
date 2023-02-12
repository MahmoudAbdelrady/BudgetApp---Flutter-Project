import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/autotransactions_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Budget/autotransactioncard.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Budget/autotransactionselectbar.dart';

class AutoTransactions extends StatelessWidget {
  const AutoTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AutoTransactionsController());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 245, 250),
      body: SafeArea(
          child: Column(
        children: [
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
              SizedBox(width: MediaQuery.of(context).size.width / 7.5),
              Text(
                "Auto Transactions".tr,
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
            children: const [
              AutoTransactionsSelectBar(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const AutoTransactionCard()
        ],
      )),
    );
  }
}
