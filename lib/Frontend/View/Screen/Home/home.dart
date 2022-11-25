import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/customappbar.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/homecustomcard.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/homehistorycard.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/homestatscard.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(),
          Expanded(
            child: ListView(
              children: [
                InkWell(onTap: () {}, child: const HomeCustomCard()),
                const HomeStatsCard(),
                const HomeHistoryCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
