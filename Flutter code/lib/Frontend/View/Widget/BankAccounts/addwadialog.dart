import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:mainflutterproject/Frontend/View/Widget/BankAccounts/batextformfield.dart';

class AddWalletAccountDialog extends StatelessWidget {
  const AddWalletAccountDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Object? selectedType = " ";
    return InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Add new account/wallet"),
                  content: Form(
                    child: SizedBox(
                      height: 300,
                      child: Column(
                        children: [
                          const BATextFormField(
                              fieldLabel: "Account/Wallet name"),
                          const BATextFormField(fieldLabel: "Money amount"),
                          Container(
                            width: 180,
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: AppColors.buttonscolor)),
                            child: DropdownButton(
                              isExpanded: true,
                              underline: const SizedBox(),
                              items: [" ", "Bank Account", "Wallet"]
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: SizedBox(
                                            width: double.infinity,
                                            child: Text(
                                              e,
                                              textAlign: TextAlign.center,
                                            )),
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                selectedType = val;
                              },
                              value: selectedType,
                            ),
                          ),
                          MaterialButton(
                            color: AppColors.buttonscolor,
                            onPressed: () {},
                            child: const Text(
                              "Add",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        child: const Icon(
          Icons.add,
          color: AppColors.buttonscolor,
        ));
  }
}
