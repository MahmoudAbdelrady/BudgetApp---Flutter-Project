import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Home/Profile/profile.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "AppName".tr,
            style: const TextStyle(
                color: AppColors.primarycolor,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          /*Expanded(
              child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: "Search the app",
              hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.grey,
                    fontSize: 17,
                  ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          )),*/
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(23)),
            child: IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Get.to(() => const Profile());
              },
            ),
          )
        ],
      ),
    );
  }
}
