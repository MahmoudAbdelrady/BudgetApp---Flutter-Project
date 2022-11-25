import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Containers/customcontainerheader.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Containers/customdivider.dart';

class HomeStatsCard extends StatelessWidget {
  const HomeStatsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 110,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
              const CustomContainerHeader(headerText: "This month expenses"),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
            ],
          ),
          const CustomDivider(marginWidth: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text("Expence"),
              Text(
                "-1354\$",
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text("Income"),
              Text(
                "1454\$",
                style: TextStyle(color: Colors.green),
              )
            ],
          )
        ],
      ),
    );
  }
}
