import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/Stats/stats_controller.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Stats/statsbarchart.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Stats/statscard.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Stats/statselectbar.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/customappbar.dart';
//import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Stats extends StatelessWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(StatsController());
    return SafeArea(
      child: GetBuilder<StatsController>(builder: (controller) {
        return Column(
          children: [
            const CustomAppBar(),
            const StatsSelectBar(),
            Expanded(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      StatsCard(
                          cardTitle: "Income".tr,
                          cardValue: "${controller.totalInc}\$"),
                      StatsCard(
                          cardTitle: "Expence".tr,
                          cardValue: "${controller.totalExp}\$"),
                    ],
                  ),
                  const StatsBarChart()
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
