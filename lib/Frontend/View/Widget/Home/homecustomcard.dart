import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

class HomeCustomCard extends StatelessWidget {
  const HomeCustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.primarycolor,
          borderRadius: BorderRadius.circular(20)),
      child: Stack(children: [
        Positioned(
            top: -73,
            right: -42,
            child: Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 44, 0, 92),
                  borderRadius: BorderRadius.circular(160)),
            )),
        Positioned(
            top: -50,
            right: -20,
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 37, 0, 77),
                  borderRadius: BorderRadius.circular(160)),
            )),
        Container(
          alignment: Alignment.center,
          child: ListTile(
            title: Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: const Text(
                "12345\$",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
            ),
            subtitle: const Text(
              "Available Balance",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ]),
    );
  }
}
