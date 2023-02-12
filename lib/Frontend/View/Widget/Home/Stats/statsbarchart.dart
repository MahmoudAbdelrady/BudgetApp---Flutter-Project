import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/Stats/stats_controller.dart';
import 'package:mainflutterproject/Frontend/Model/barchartmodel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatsBarChart extends StatelessWidget {
  const StatsBarChart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatsController>(builder: (controller) {
      return SfCartesianChart(
          primaryXAxis: CategoryAxis(
              isInversed:
                  controller.myServices.sharedPreferences.getString("Lang") ==
                          "en"
                      ? false
                      : true),
          primaryYAxis: NumericAxis(
              opposedPosition:
                  controller.myServices.sharedPreferences.getString("Lang") ==
                          "en"
                      ? false
                      : true),
          series: <CartesianSeries>[
            ColumnSeries<ChartData, String>(
                dataSource: controller.statsData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y1,
                color: Colors.green,
                borderRadius: BorderRadius.circular(6)),
            ColumnSeries<ChartData, String>(
              dataSource: controller.statsData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y2,
              color: Colors.red,
              borderRadius: BorderRadius.circular(6),
            )
          ]);
    });
  }
}
