import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Containers/customcontainer.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Containers/customcontainerheader.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Stats/statsprogressindicator.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/customappbar.dart';
//import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Stats extends StatelessWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(),
          Expanded(
            child: ListView(
              children: [
                CustomContainer(
                    contHeight: 233,
                    contChild: Column(
                      children: const [
                        SizedBox(
                          height: 10,
                        ),
                        CustomContainerHeader(
                            headerText: "Expendeture Percentage"),
                        StatsProgressIndicator(),
                      ],
                    )),
                const SizedBox(
                  height: 70,
                ),
                const Center(
                  child: Text(
                    "Bar Chart Coming later...",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primarycolor),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
