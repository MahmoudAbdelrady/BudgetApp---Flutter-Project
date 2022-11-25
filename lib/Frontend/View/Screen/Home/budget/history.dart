import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/homehistorycard.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 245, 250),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.primarycolor,
                  )),
              SizedBox(width: MediaQuery.of(context).size.width / 3.5),
              const Text(
                "History",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.primarycolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          ),
          const HomeHistoryCard(),
        ],
      )),
    );
  }
}
