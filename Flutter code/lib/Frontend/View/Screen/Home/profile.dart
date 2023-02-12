import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Profile/profilecustomcard.dart';
import 'package:mainflutterproject/Frontend/View/Widget/Home/Profile/profileappbar.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 248, 245, 250),
          body: Column(
            children: const [ProfileAppBar(), ProfileCustomCard()],
          )),
    );
  }
}
