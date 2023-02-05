import 'package:flutter/material.dart';

class CustomtextInputField extends StatelessWidget {
  const CustomtextInputField(
      {super.key,
      required this.inputController,
      required this.hintText,
      required this.icon,
      required this.isPassword,
      required this.onValidate, required this.keyBoardType});

  final TextEditingController inputController;
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final String? Function(String?) onValidate;
  final TextInputType keyBoardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextFormField(
          controller: inputController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            prefixIcon: Icon(icon),
          ),
          validator: onValidate,
        ),
      ),
    );
  }
}
