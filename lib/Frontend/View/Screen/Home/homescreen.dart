import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/addautotransaction_controller.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/addtransaction_controller.dart';
import 'package:mainflutterproject/Frontend/Controller/Home/home_controller.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Functions/exitappalert.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Budget/addautotransactionform.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Budget/addtransactionform.dart';
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
              visible: controller.currentPage ==
                          controller.tabspages.length - 1 ||
                      controller.currentPage == controller.tabspages.length - 3
                  ? false
                  : true,
              child: FloatingActionButton.extended(
                onPressed: () {
                  // Edit it
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text("Add Transaction".tr),
                            // edit it
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      side: const BorderSide(
                                          color: AppColors.primarycolor)),
                                  onPressed: () {
                                    Get.back();
                                    showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                scrollable: true,
                                                title: Text("Add Transaction".tr),
                                                content:
                                                    const AddTransactionForm()))
                                        .then((value) {
                                      AddTransactionController
                                          addTransactionController =
                                          Get.put(AddTransactionController());
                                      addTransactionController.clearFields();
                                      Get.delete<AddTransactionController>();
                                    });
                                  },
                                  child: Text("Income/Expence".tr),
                                ),
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      side: const BorderSide(
                                          color: AppColors.primarycolor)),
                                  onPressed: () {
                                    Get.back();
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              scrollable: true,
                                              title: Text(
                                                  "Add auto transaction".tr),
                                              content:
                                                  const AutoTransactionForm(),
                                            )).then((value) {
                                      AddAutoTransactionController
                                          addAutoTransactionController =
                                          Get.put(
                                              AddAutoTransactionController());
                                      addAutoTransactionController
                                          .clearFields();
                                      Get.delete<
                                          AddAutoTransactionController>();
                                    });
                                  },
                                  child: Text("Auto Income/Expence".tr),
                                ),
                              ],
                            ),
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
