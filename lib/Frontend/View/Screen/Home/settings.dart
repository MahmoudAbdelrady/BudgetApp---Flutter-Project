import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Settings/settingsappbar.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Settings/settingscustomcard.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light),
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 248, 245, 250),
            body: Column(children: [
              const SettingsAppBar(),
              Expanded(child: ListView(children: const [SettingsCustomCard()]))
            ])));
  }
}
