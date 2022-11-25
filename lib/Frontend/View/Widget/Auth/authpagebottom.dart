import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

class AuthPageFooter extends StatelessWidget {
  final String authPageFooter;
  final String authPageFooterbtnText;
  final Function() authPageFooteronTap;
  const AuthPageFooter(
      {Key? key,
      required this.authPageFooter,
      required this.authPageFooterbtnText,
      required this.authPageFooteronTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          authPageFooter,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        InkWell(
          onTap: authPageFooteronTap,
          child: Text(
            authPageFooterbtnText,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 16,
                  color: AppColors.buttonscolor,
                ),
          ),
        )
      ],
    );
  }
}
