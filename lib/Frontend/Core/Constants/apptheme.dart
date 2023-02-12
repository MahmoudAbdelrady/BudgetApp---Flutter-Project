import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

ThemeData arabicTheme = ThemeData(
  fontFamily: 'Cairo',
  textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.primarycolor,
        fontSize: 30,
      ),
      displayMedium: TextStyle(color: AppColors.secondarycolor, fontSize: 20),
      bodyLarge: TextStyle(color: Colors.black, fontSize: 15)),
);
ThemeData englishTheme = ThemeData(
  fontFamily: 'Quicksand',
  textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.primarycolor,
        fontSize: 30,
      ),
      displayMedium: TextStyle(color: AppColors.secondarycolor, fontSize: 20),
      bodyLarge: TextStyle(color: Colors.black, fontSize: 15)),
);
