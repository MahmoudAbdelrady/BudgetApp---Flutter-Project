import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

ThemeData arabicTheme = ThemeData(
  fontFamily: 'Cairo',
  textTheme: const TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.primarycolor,
        fontSize: 30,
      ),
      headline2: TextStyle(color: AppColors.secondarycolor, fontSize: 20),
      bodyText1: TextStyle(color: Colors.black, fontSize: 15)),
);
ThemeData englishTheme = ThemeData(
  fontFamily: 'Quicksand',
  textTheme: const TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.primarycolor,
        fontSize: 30,
      ),
      headline2: TextStyle(color: AppColors.secondarycolor, fontSize: 20),
      bodyText1: TextStyle(color: Colors.black, fontSize: 15)),
);
