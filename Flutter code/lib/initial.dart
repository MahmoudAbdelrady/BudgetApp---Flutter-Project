import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/history_controller.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/initialautotransaction_controller.dart';
import 'package:mainflutterproject/Frontend/Model/autotransactionmodel.dart';
import 'package:intl/intl.dart';

autoTrans() async {
  InitialAutoTransactionController initialAutoTransactionController =
      Get.put(InitialAutoTransactionController());
  await initialAutoTransactionController.viewAutoTransactions();
  if (initialAutoTransactionController.userAutoTransactions.isNotEmpty) {
    HistoryController historyController = Get.put(HistoryController());
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    for (int i = 0;
        i < initialAutoTransactionController.userAutoTransactions.length;
        i++) {
      if (AutoTransactionModel.fromJson(
                  initialAutoTransactionController.userAutoTransactions[i])
              .actionDate! !=
          currentDate) {
        if (AutoTransactionModel.fromJson(
                    initialAutoTransactionController.userAutoTransactions[i])
                .actionRate! ==
            "Daily") {
          int amount = (DateTime.parse(currentDate)
                      .difference(DateTime.parse(AutoTransactionModel.fromJson(
                              initialAutoTransactionController
                                  .userAutoTransactions[i])
                          .actionDate!))
                      .inHours /
                  24)
              .round();
          initialAutoTransactionController.transTitle.text =
              AutoTransactionModel.fromJson(
                      initialAutoTransactionController.userAutoTransactions[i])
                  .title!;
          initialAutoTransactionController.awData =
              AutoTransactionModel.fromJson(
                      initialAutoTransactionController.userAutoTransactions[i])
                  .awName!;
          initialAutoTransactionController.awData =
              AutoTransactionModel.fromJson(
                      initialAutoTransactionController.userAutoTransactions[i])
                  .awType!;
          String quantity = (amount *
                  double.parse(AutoTransactionModel.fromJson(
                          initialAutoTransactionController
                              .userAutoTransactions[i])
                      .amount!))
              .toString();
          initialAutoTransactionController.transAmount.text = quantity;
          initialAutoTransactionController.transType =
              AutoTransactionModel.fromJson(
                      initialAutoTransactionController.userAutoTransactions[i])
                  .type!;
          initialAutoTransactionController.transDate!.text =
              DateFormat('yyyy-MM-dd').format(DateTime.now());
          await initialAutoTransactionController.addTransaction();
          await initialAutoTransactionController.modifyAutoTransactionDate(
              AutoTransactionModel.fromJson(
                      initialAutoTransactionController.userAutoTransactions[i])
                  .title!,
              "DAY",
              amount.toString());
          historyController.getHistory("All");
        } else if (AutoTransactionModel.fromJson(
                    initialAutoTransactionController.userAutoTransactions[i])
                .actionRate! ==
            "Weekly") {
          int amount = (DateTime.parse(currentDate)
                      .difference(DateTime.parse(AutoTransactionModel.fromJson(
                              initialAutoTransactionController
                                  .userAutoTransactions[i])
                          .actionDate!))
                      .inDays /
                  7)
              .round();
          if (amount >= 1) {
            initialAutoTransactionController
                .transTitle.text = AutoTransactionModel.fromJson(
                    initialAutoTransactionController.userAutoTransactions[i])
                .title!;
            initialAutoTransactionController
                .awData = AutoTransactionModel.fromJson(
                    initialAutoTransactionController.userAutoTransactions[i])
                .awName!;
            initialAutoTransactionController
                .awData = AutoTransactionModel.fromJson(
                    initialAutoTransactionController.userAutoTransactions[i])
                .awType!;
            String quantity = (amount *
                    double.parse(AutoTransactionModel.fromJson(
                            initialAutoTransactionController
                                .userAutoTransactions[i])
                        .amount!))
                .toString();
            initialAutoTransactionController.transAmount.text = quantity;
            initialAutoTransactionController
                .transType = AutoTransactionModel.fromJson(
                    initialAutoTransactionController.userAutoTransactions[i])
                .type!;
            initialAutoTransactionController.transDate!.text =
                DateFormat('yyyy-MM-dd').format(DateTime.now());
            await initialAutoTransactionController.addTransaction();
            await initialAutoTransactionController.modifyAutoTransactionDate(
                AutoTransactionModel.fromJson(initialAutoTransactionController
                        .userAutoTransactions[i])
                    .title!,
                "WEEK",
                amount.toString());
            historyController.getHistory("All");
          }
        } else if (AutoTransactionModel.fromJson(
                    initialAutoTransactionController.userAutoTransactions[i])
                .actionRate! ==
            "Monthly") {
          int amount = (DateTime.parse(currentDate)
                      .difference(DateTime.parse(AutoTransactionModel.fromJson(
                              initialAutoTransactionController
                                  .userAutoTransactions[i])
                          .actionDate!))
                      .inDays /
                  30)
              .round();
          if (amount >= 1) {
            initialAutoTransactionController
                .transTitle.text = AutoTransactionModel.fromJson(
                    initialAutoTransactionController.userAutoTransactions[i])
                .title!;
            initialAutoTransactionController
                .awData = AutoTransactionModel.fromJson(
                    initialAutoTransactionController.userAutoTransactions[i])
                .awName!;
            initialAutoTransactionController
                .awData = AutoTransactionModel.fromJson(
                    initialAutoTransactionController.userAutoTransactions[i])
                .awType!;
            String quantity = (amount *
                    double.parse(AutoTransactionModel.fromJson(
                            initialAutoTransactionController
                                .userAutoTransactions[i])
                        .amount!))
                .toString();
            initialAutoTransactionController.transAmount.text = quantity;
            initialAutoTransactionController
                .transType = AutoTransactionModel.fromJson(
                    initialAutoTransactionController.userAutoTransactions[i])
                .type!;
            initialAutoTransactionController.transDate!.text =
                DateFormat('yyyy-MM-dd').format(DateTime.now());
            await initialAutoTransactionController.addTransaction();
            await initialAutoTransactionController.modifyAutoTransactionDate(
                AutoTransactionModel.fromJson(initialAutoTransactionController
                        .userAutoTransactions[i])
                    .title!,
                "MONTH",
                amount.toString());
            historyController.getHistory("All");
          }
        } else {
          int amount = (DateTime.parse(currentDate)
                      .difference(DateTime.parse(AutoTransactionModel.fromJson(
                              initialAutoTransactionController
                                  .userAutoTransactions[i])
                          .actionDate!))
                      .inDays /
                  365)
              .round();
          if (amount >= 1) {
            initialAutoTransactionController
                .transTitle.text = AutoTransactionModel.fromJson(
                    initialAutoTransactionController.userAutoTransactions[i])
                .title!;
            initialAutoTransactionController
                .awData = AutoTransactionModel.fromJson(
                    initialAutoTransactionController.userAutoTransactions[i])
                .awName!;
            initialAutoTransactionController
                .awData = AutoTransactionModel.fromJson(
                    initialAutoTransactionController.userAutoTransactions[i])
                .awType!;
            String quantity = (amount *
                    double.parse(AutoTransactionModel.fromJson(
                            initialAutoTransactionController
                                .userAutoTransactions[i])
                        .amount!))
                .toString();
            initialAutoTransactionController.transAmount.text = quantity;
            initialAutoTransactionController
                .transType = AutoTransactionModel.fromJson(
                    initialAutoTransactionController.userAutoTransactions[i])
                .type!;
            initialAutoTransactionController.transDate!.text =
                DateFormat('yyyy-MM-dd').format(DateTime.now());
            await initialAutoTransactionController.addTransaction();
            await initialAutoTransactionController.modifyAutoTransactionDate(
                AutoTransactionModel.fromJson(initialAutoTransactionController
                        .userAutoTransactions[i])
                    .title!,
                "YEAR",
                amount.toString());
            historyController.getHistory("All");
          }
        }
      }
    }
  }
  Get.delete<InitialAutoTransactionController>();
}
