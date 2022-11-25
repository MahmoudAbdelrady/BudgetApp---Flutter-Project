import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/Home/home_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Functions/exitappalert.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/custombottomappbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        child: GetBuilder<HomeScreenControllerImp>(
          builder: (controller) => Scaffold(
            backgroundColor: const Color.fromARGB(255, 248, 245, 250),
            floatingActionButton: Visibility(
              visible: controller.currentPage == controller.tabspages.length - 1
                  ? false
                  : true,
              child: FloatingActionButton.extended(
                onPressed: () {
                  // Edit it
                  showDialog(
                      context: context,
                      builder: (context) => const AlertDialog(
                            title: Text("Add Transaction"),
                          ));
                },
                backgroundColor: AppColors.primarycolor,
                label: const Icon(Icons.add),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            // ignore: prefer_const_constructors
            bottomNavigationBar: CustomBottomAppBar(),
            body: WillPopScope(
              onWillPop: exitAppAlert,
              child: controller.listPage.elementAt(controller.currentPage),
            ),
          ),
        ));
  }
}
