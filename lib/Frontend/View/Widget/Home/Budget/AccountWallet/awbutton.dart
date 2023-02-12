import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Controller/Budget/AccountWallet/accountwalletdialogtab_controller.dart';

class AWButton extends GetView<AccountWalletDialogTabController> {
  final String awBtnTitle;
  final void Function() awBtnOnPressed;
  final Color awBtnColor;
  const AWButton(this.awBtnTitle, this.awBtnOnPressed, this.awBtnColor,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: awBtnColor,
      onPressed: awBtnOnPressed,
      child: Text(
        awBtnTitle,
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }
}

/*
  
*/