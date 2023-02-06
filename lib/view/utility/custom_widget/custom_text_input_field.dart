import 'package:flutter/material.dart';
import 'package:trip_app/model/constants.dart';

class CustomtextInputField extends StatelessWidget {
  const CustomtextInputField(
      {super.key,
      required this.inputController,
      required this.hintText,
      required this.icon,
      required this.isPassword,
      required this.onValidate,
      required this.keyBoardType});

  final TextEditingController inputController;
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final String? Function(String?) onValidate;
  final TextInputType keyBoardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        prefixIcon: Icon(icon, color: Kcolor.secondaryColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Kcolor.secondaryColor,
            width: 2.0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Kcolor.secondaryColor,
            width: 2.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Kcolor.secondaryColor,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Kcolor.secondaryColor,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Kcolor.secondaryColor,
            width: 2.0,
          ),
        ),
      ),
      validator: onValidate,
    );
  }
}
