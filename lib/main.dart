import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Bindings/initialbindings.dart';
import 'package:mainflutterproject/Frontend/Core/Localization/changelocale.dart';
import 'package:mainflutterproject/Frontend/Core/Localization/translation.dart';
import 'package:mainflutterproject/Frontend/Core/Services/myservices.dart';
import 'package:mainflutterproject/initial.dart';
import 'package:mainflutterproject/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        translations: MyTranslation(),
        locale: localeController.language,
        theme: localeController.appTheme,
        getPages: routes,
        onInit: () async {
          localeController.myServices.sharedPreferences.getString("step") ==
                  2.toString()
              ? await autoTrans()
              : null;
        },
        initialBinding: InitialBindings());
  }
}
