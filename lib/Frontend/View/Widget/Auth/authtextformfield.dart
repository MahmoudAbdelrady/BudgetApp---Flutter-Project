import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

class AuthTextFormField extends StatelessWidget {
  final String hintText;
  final IconData iconFormField;
  final String type;
  final bool? obstcureTextChk;
  final IconData? eyeIcon;
  final String? Function(String?) authvalidator;
  final TextEditingController? authcontroller;
  final void Function()? passShoweronPressed;
  const AuthTextFormField(
      {Key? key,
      required this.hintText,
      required this.type,
      required this.iconFormField,
      required this.authvalidator,
      required this.authcontroller,
      this.passShoweronPressed,
      this.obstcureTextChk,
      this.eyeIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: TextFormField(
          validator: authvalidator,
          controller: authcontroller,
          keyboardType: type == "email"
              ? TextInputType.emailAddress
              : type == "phone"
                  ? const TextInputType.numberWithOptions(decimal: true)
                  : TextInputType.text,
          obscureText: type == "pass" ? obstcureTextChk! : false,
          decoration: InputDecoration(
            label: Text(
              hintText,
              style: const TextStyle(color: AppColors.primarycolor),
            ),
            prefixIcon: Icon(
              iconFormField,
              color: AppColors.primarycolor,
            ),
            suffixIcon: type == "pass"
                ? IconButton(
                    icon: Icon(eyeIcon),
                    onPressed: passShoweronPressed,
                  )
                : null,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: AppColors.primarycolor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: AppColors.buttonscolor),
            ),
          )),
    );
  }
}
