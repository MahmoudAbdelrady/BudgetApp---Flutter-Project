import 'package:flutter/material.dart';

class SettingsThemeCard extends StatelessWidget {
  final Color first;
  final Color second;
  final IconData themeIcon;
  final Color themeIconColor;
  const SettingsThemeCard(
      {Key? key,
      required this.first,
      required this.second,
      required this.themeIcon,
      required this.themeIconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(height: 71, color: first),
            Container(height: 71, color: second),
          ],
        ),
        Center(
          child: Icon(
            themeIcon,
            color: themeIconColor,
            size: 50,
          ),
        ),
      ],
    );
  }
}
