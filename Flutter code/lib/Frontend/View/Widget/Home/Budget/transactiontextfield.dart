import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/Core/Functions/appvalidator.dart';

class TransactionTextField extends StatelessWidget {
  final String textboxTitle;
  final String? textboxType;
  final TextEditingController textboxController;
  const TransactionTextField(
      {Key? key,
      required this.textboxTitle,
      this.textboxType,
      required this.textboxController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: TextFormField(
          keyboardType: textboxType == "num"
              ? const TextInputType.numberWithOptions(decimal: true)
              : TextInputType.text,
          controller: textboxController,
          validator: (value) =>
              inputValidator(value!.toString(), 1, 255, "transaction"),
          decoration: InputDecoration(
            label: Text(
              textboxTitle,
              style: const TextStyle(color: AppColors.primarycolor),
            ),
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
          ),
        ));
  }
}
