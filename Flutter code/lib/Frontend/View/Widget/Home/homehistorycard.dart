import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Containers/customdivider.dart';

class HomeHistoryCard extends StatelessWidget {
  const HomeHistoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  onTap: () {},
                  child: const Text(
                    "All",
                    style: TextStyle(
                        fontSize: 17,
                        color: AppColors.primarycolor,
                        fontWeight: FontWeight.bold),
                  )),
              InkWell(
                  onTap: () {},
                  child: const Text("Spendings",
                      style: TextStyle(
                          fontSize: 17,
                          color: AppColors.primarycolor,
                          fontWeight: FontWeight.bold))),
              InkWell(
                  onTap: () {},
                  child: const Text(
                    "Income",
                    style: TextStyle(
                        fontSize: 17,
                        color: AppColors.primarycolor,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 240,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Row(
                children: const [
                  Expanded(
                    child: ListTile(
                      leading: Icon(Icons.food_bank),
                      title: Text("Pizza"),
                      subtitle: Text("Food"),
                      trailing: Text(
                        "-58\$",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
              const CustomDivider(marginWidth: 5),
              Row(
                children: const [
                  Expanded(
                    child: ListTile(
                      leading: Icon(Icons.work),
                      title: Text("Call center"),
                      subtitle: Text("Work"),
                      trailing: Text(
                        "200\$",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                ],
              ),
              const CustomDivider(marginWidth: 5),
              Row(
                children: const [
                  Expanded(
                    child: ListTile(
                      leading: Icon(Icons.local_drink),
                      title: Text("Coffe"),
                      subtitle: Text("Drinks"),
                      trailing: Text(
                        "-7\$",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
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
