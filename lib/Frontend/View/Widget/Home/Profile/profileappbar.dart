import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: AppColors.primarycolor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Stack(
        children: [
          Positioned(
              top: -73,
              right: -42,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 44, 0, 92),
                    borderRadius: BorderRadius.circular(160)),
              )),
          Positioned(
              top: -50,
              right: -20,
              child: Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 37, 0, 77),
                    borderRadius: BorderRadius.circular(160)),
              )),
          Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const CircleAvatar(
                    radius: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Username",
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Proffession",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.white),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
