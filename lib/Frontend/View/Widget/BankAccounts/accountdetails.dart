import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                "Bank Name",
                style: TextStyle(color: AppColors.primarycolor, fontSize: 17),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "1562\$",
                style: TextStyle(color: AppColors.thirdcolor, fontSize: 17),
              )
            ],
          ),
        )
      ],
    ));
  }
}
