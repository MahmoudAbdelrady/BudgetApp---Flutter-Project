import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/apptheme.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';

class LocaleController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  late ThemeData appTheme;
  changeLang(String appLang) {
    Locale locale = Locale(appLang);
    myServices.sharedPreferences.setString("Lang", appLang);
    appTheme = appLang == "ar" ? arabicTheme : englishTheme;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? spLang = myServices.sharedPreferences.getString("Lang");
    if (spLang == "ar") {
      language = const Locale("ar");
      appTheme = arabicTheme;
    } else if (spLang == "en") {
      language = const Locale("en");
      appTheme = englishTheme;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = englishTheme;
    }
    super.onInit();
  }
}
