import 'package:get/get.dart';
import 'package:mainflutterproject/Backend/RemoteData/Stats/statsthismonth.dart';
import 'package:mainflutterproject/Backend/RemoteData/Stats/statsthisweek.dart';
import 'package:mainflutterproject/Backend/RemoteData/Stats/statsthisyear.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';
import 'package:mainflutterproject/Frontend/Model/barchartmodel.dart';
import 'package:intl/intl.dart';

class StatsController extends GetxController {
  // myList = List.from(mynewlist);
  int selectedTab = 0;
  String totalInc = "0";
  String totalExp = "0";
  List<ChartData> statsData = <ChartData>[];
  MyServices myServices = Get.find();
  StatsThisWeekData statsThisWeekData = StatsThisWeekData(Get.find());
  StatsThisMonthData statsThisMonthData = StatsThisMonthData(Get.find());
  StatsThisYearData statsThisYearData = StatsThisYearData(Get.find());
  getWeekData() async {
    statsData.clear();
    update();
    var response = await statsThisWeekData
        .postData(myServices.sharedPreferences.getString("id")!);
    if (response['status'] == "success") {
      totalInc = response['total_income'].toString() == "null"
          ? "0"
          : response['total_income'].toString();
      totalExp = response['total_expence'].toString() == "null"
          ? "0"
          : response['total_expence'].toString();
      if (response['data'] is List) {
        for (int i = 1; i <= 7; i++) {
          statsData.add(ChartData("${"Day".tr} $i", 0, 0));
        }
      } else {
        for (int i = 1; i <= 7; i++) {
          // print(DateFormat('MMM').format(DateTime(0, i)));
          double y1 = response['data']['$i'] == null
              ? 0
              : response['data']['$i']['Total_Income'] == null
                  ? 0
                  : double.parse(response['data']['$i']['Total_Income']) + .0;
          double y2 = response['data']['$i'] == null
              ? 0
              : response['data']['$i']['Total_Expence'] == null
                  ? 0
                  : double.parse(response['data']['$i']['Total_Expence']) + .0;
          statsData.add(ChartData("${"Day".tr} $i", y1, y2));
        }
      }
    }
    update();
  }

  getMonthData() async {
    statsData.clear();
    update();
    var response = await statsThisMonthData
        .postData(myServices.sharedPreferences.getString("id")!);
    if (response['status'] == "success") {
      totalInc = response['total_income'].toString() == "null"
          ? "0"
          : response['total_income'].toString();
      totalExp = response['total_expence'].toString() == "null"
          ? "0"
          : response['total_expence'].toString();
      if (response['data'] is List) {
        for (int i = 1; i <= 4; i++) {
          statsData.add(ChartData("${"Week".tr} $i", 0, 0));
        }
      } else {
        for (int i = 1; i <= 4; i++) {
          int temp = i + (4 * ((DateTime.now().month) - 1));
          double y1 = response['data']['$temp'] == null
              ? 0
              : response['data']['$temp']['Total_Income'] == null
                  ? 0
                  : double.parse(response['data']['$temp']['Total_Income']) +
                      .0;
          double y2 = response['data']['$temp'] == null
              ? 0
              : response['data']['$temp']['Total_Expence'] == null
                  ? 0
                  : double.parse(response['data']['$temp']['Total_Expence']) +
                      .0;
          statsData.add(ChartData("${"Week".tr} $i", y1, y2));
        }
      }
    }
    update();
  }

  getYearData() async {
    statsData.clear();
    update();
    var response = await statsThisYearData
        .postData(myServices.sharedPreferences.getString("id")!);
    if (response['status'] == "success") {
      totalInc = response['total_income'].toString() == "null"
          ? "0"
          : response['total_income'].toString();
      totalExp = response['total_expence'].toString() == "null"
          ? "0"
          : response['total_expence'].toString();
      if (response['data'] is List) {
        for (int i = 1; i <= 12; i++) {
          statsData.add(
              ChartData(DateFormat('MMM').format(DateTime(0, i)).tr, 0, 0));
        }
      } else {
        for (int i = 1; i <= 12; i++) {
          double y1 = response['data']['$i'] == null
              ? 0
              : response['data']['$i']['Total_Income'] == null
                  ? 0
                  : double.parse(response['data']['$i']['Total_Income']) + .0;
          double y2 = response['data']['$i'] == null
              ? 0
              : response['data']['$i']['Total_Expence'] == null
                  ? 0
                  : double.parse(response['data']['$i']['Total_Expence']) + .0;
          statsData.add(
              ChartData(DateFormat('MMM').format(DateTime(0, i)).tr, y1, y2));
        }
      }
    }
    update();
  }

  changeTab(int tab) {
    selectedTab = tab;
    tab == 0
        ? getWeekData()
        : tab == 1
            ? getMonthData()
            : getYearData();
    update();
  }

  @override
  void onInit() {
    getWeekData();
    super.onInit();
  }
}
