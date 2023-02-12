import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

class AccountWalletSelectBar extends StatelessWidget {
  const AccountWalletSelectBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 230,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 110,
            decoration: BoxDecoration(
                color: AppColors.primarycolor,
                borderRadius: BorderRadius.circular(50)),
            child: InkWell(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Bank Accounts",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
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
          InkWell(
            onTap: () {},
            child: const Text(
              "Wallets",
              style: TextStyle(
                  color: AppColors.primarycolor, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
