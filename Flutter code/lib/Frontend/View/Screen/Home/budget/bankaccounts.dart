import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/View/Widget/BankAccounts/accountdetails.dart';
import 'package:mainflutterproject/Frontend/View/Widget/BankAccounts/accountwalletselectbar.dart';
import 'package:mainflutterproject/Frontend/View/Widget/BankAccounts/addwadialog.dart';

class BankAccounts extends StatelessWidget {
  const BankAccounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 245, 250),
      body: SafeArea(
        child: Column(children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.primarycolor,
                  )),
              SizedBox(width: MediaQuery.of(context).size.width / 15),
              const Text(
                "Bank accounts & wallets",
                textAlign: TextAlign.center,
                style: TextStyle(
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
          const AccountDetails(),
        ]),
      ),
    );
  }
}
