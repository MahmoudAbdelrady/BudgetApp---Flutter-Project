import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

class AuthButton extends StatelessWidget {
  final String authButtonText;
  final void Function() authButtononPressed;
  const AuthButton(
      {Key? key,
      required this.authButtonText,
      required this.authButtononPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 12),
        color: AppColors.buttonscolor,
        onPressed: authButtononPressed,
        child: Text(
          authButtonText,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.white, fontSize: 18),
        ));
  }
}
