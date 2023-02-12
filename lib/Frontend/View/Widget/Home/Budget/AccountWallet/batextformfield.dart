import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

class BATextFormField extends StatelessWidget {
  final String? textboxType;
  final String? Function(String?)? awValidator;
  final TextEditingController? awtextController;
  final String? textfieldValue;
  const BATextFormField(
      {Key? key,
      this.textboxType,
      this.awValidator,
      this.awtextController,
      this.textfieldValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextFormField(
        validator: awValidator,
        controller: awtextController,
        // initialValue: textfieldValue,
        keyboardType: textboxType == "num"
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        decoration: InputDecoration(
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
      ),
    );
  }
}
