import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';

class ProfileTextField extends StatelessWidget {
  final String textboxType;
  final TextEditingController profileTextController;
  final String? Function(String?)? profileTextValidator;
  final bool? profileTextEnable;
  const ProfileTextField(
      {Key? key,
      required this.textboxType,
      required this.profileTextController,
      this.profileTextValidator,
      this.profileTextEnable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextFormField(
        enabled: profileTextEnable,
        validator: profileTextValidator,
        controller: profileTextController,
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
