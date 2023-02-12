import 'package:flutter/material.dart';

class TransactionButton extends StatelessWidget {
  final String transBtnTitle;
  final Color btnColor;
  final void Function() transonPressed;
  const TransactionButton(
      {Key? key,
      required this.transonPressed,
      required this.transBtnTitle,
      required this.btnColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(vertical: 12),
          color: btnColor,
          onPressed: transonPressed,
          child: Text(
            transBtnTitle,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white, fontSize: 18),
          )),
    );
  }
}
