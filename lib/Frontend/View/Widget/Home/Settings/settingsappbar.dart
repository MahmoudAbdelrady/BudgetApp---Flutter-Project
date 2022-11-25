import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

class SettingsAppBar extends StatelessWidget {
  const SettingsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: AppColors.primarycolor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Stack(
        children: [
          Positioned(
              top: -35,
              right: -20,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 44, 0, 92),
                    borderRadius: BorderRadius.circular(160)),
              )),
          Positioned(
              top: -23,
              right: -10,
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 37, 0, 77),
                    borderRadius: BorderRadius.circular(160)),
              )),
          Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Settings",
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
