import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

class BATextFormField extends StatelessWidget {
  final String fieldLabel;
  const BATextFormField({Key? key, required this.fieldLabel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          label: Text(
            fieldLabel,
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
      ),
    );
  }
}
