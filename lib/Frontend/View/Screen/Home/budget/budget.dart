import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Home/budget/bankaccounts.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Home/budget/history.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Containers/customcontainer.dart';
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
                CustomContainer(
                    contHeight: 70,
                    contChild: InkWell(
                        onTap: () {
                          // Edit it
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const BankAccounts()));
                        },
                        child: Row(
                          children: const [
                            Expanded(
                                child: ListTile(
                              title: Text(
                                "Bank accounts & wallets",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.primarycolor,
                                    fontWeight: FontWeight.bold),
                              ),
                              leading: Icon(
                                Icons.monetization_on_outlined,
                                color: AppColors.primarycolor,
                              ),
                            )),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ))),
                CustomContainer(
                    contHeight: 70,
                    contChild: InkWell(
                        onTap: () {
                          // Edit it
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const History()));
                        },
                        child: Row(
                          children: const [
                            Expanded(
                                child: ListTile(
                              title: Text(
                                "History",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.primarycolor,
                                    fontWeight: FontWeight.bold),
                              ),
                              leading: Icon(
                                Icons.history,
                                color: AppColors.primarycolor,
                              ),
                            )),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        )))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
