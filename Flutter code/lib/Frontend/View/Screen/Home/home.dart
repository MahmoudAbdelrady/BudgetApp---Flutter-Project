import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/history_controller.dart';
import 'package:mainflutterproject/Frontend/Controller/Home/home_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Home/budget/history.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Budget/History/historycard.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/customappbar.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/homecustomcard.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/homestatscard.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HistoryController());
    HomeScreenControllerImp homeScreenControllerImp =
        Get.put(HomeScreenControllerImp());
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(),
          Expanded(
            child: ListView(
              children: [
                InkWell(
                    onTap: () {
                      homeScreenControllerImp.changePage(2);
                      homeScreenControllerImp.tabController.animateTo(2);
                    },
                    child: const HomeCustomCard()),
                const HomeStatsCard(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 15, left: 15),
                        child: Text("Latest transactions".tr,
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 18))),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: MaterialButton(
                        height: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        color: AppColors.buttonscolor,
                        textColor: Colors.white,
                        onPressed: () {
                          Get.to(() => const History());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(
                              Icons.history,
                              color: AppColors.primarycolor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "View History".tr,
                              style: const TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const HistoryCard(true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
