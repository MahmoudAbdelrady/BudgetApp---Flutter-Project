import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Containers/customcontainerheader.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Containers/customdivider.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Profile/inforow.dart';

class ProfileCustomCard extends StatelessWidget {
  const ProfileCustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 27),
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CustomContainerHeader(headerText: "Profile Info"),
              const SizedBox(
                width: 15,
              ),
              MaterialButton(
                color: AppColors.buttonscolor,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(Icons.edit),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Edit")
                  ],
                ),
              )
            ],
          ),
          const InfoRow(
              mainInfo: "Email", linkInfo: "email here", type: "info"),
          const InfoRow(
              mainInfo: "Phone", linkInfo: "phone here", type: "info"),
          const CustomContainerHeader(headerText: "Social Accounts"),
          const CustomDivider(marginWidth: 50),
          const InfoRow(
              mainInfo: "Facebook",
              linkInfo: "link here",
              type: "social",
              socialmediaIcon: Icons.share),
          const InfoRow(
              mainInfo: "Twitter",
              linkInfo: "link here",
              type: "social",
              socialmediaIcon: Icons.share),
          const InfoRow(
              mainInfo: "Whatsapp",
              linkInfo: "number here",
              type: "social",
              socialmediaIcon: Icons.share),
        ],
      ),
    );
  }
}
