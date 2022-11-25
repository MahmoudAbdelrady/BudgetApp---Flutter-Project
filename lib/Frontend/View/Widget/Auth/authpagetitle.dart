import 'package:flutter/material.dart';

class AuthPageTitle extends StatelessWidget {
  final String authTitle;
  const AuthPageTitle({Key? key, required this.authTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 0),
      child: Text(
        authTitle,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
