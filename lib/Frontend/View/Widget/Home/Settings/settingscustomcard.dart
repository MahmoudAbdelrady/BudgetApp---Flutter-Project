import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appassets.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Containers/customcontainer.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Containers/customcontainerheader.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Containers/customdivider.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Settings/settingsthemecard.dart';

class SettingsCustomCard extends StatelessWidget {
  const SettingsCustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomContainer(
          contHeight: 250,
          contChild: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const CustomContainerHeader(headerText: "Theme"),
              const CustomDivider(marginWidth: 100),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const SizedBox(
                          height: 150,
                          width: 150,
                          child: Card(
                            child: SettingsThemeCard(
                              first: AppColors.primarycolor,
                              second: AppColors.secondarycolor,
                              themeIcon: Icons.light_mode,
                              themeIconColor: Colors.yellow,
                            ),
                          )),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const SizedBox(
                          height: 150,
                          width: 150,
                          child: Card(
                            child: SettingsThemeCard(
                              first: AppColors.primarycolor,
                              second: Color.fromARGB(255, 47, 46, 46),
                              themeIcon: Icons.dark_mode,
                              themeIconColor: Colors.yellow,
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        CustomContainer(
          contHeight: 120,
          contChild: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const CustomContainerHeader(headerText: "Currency"),
              const CustomDivider(marginWidth: 100),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Current currency : tst",
                    style: TextStyle(fontSize: 17),
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
            ],
          ),
        ),
        CustomContainer(
          contHeight: 130,
          contChild: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const CustomContainerHeader(headerText: "Language"),
              const CustomDivider(marginWidth: 100),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(120),
                            color: AppColors.primarycolor),
                        child: InkWell(
                            onTap: () {}, child: Image.asset(AppAssets.uslogo)),
                      ),
                      const Text("English")
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(120),
                            color: AppColors.primarycolor),
                        child: InkWell(
                            onTap: () {}, child: Image.asset(AppAssets.eglogo)),
                      ),
                      const Text("Arabic")
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
