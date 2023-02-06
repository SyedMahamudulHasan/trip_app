import 'package:flutter/material.dart';
import 'package:trip_app/model/constants.dart';

class CustomtextInputField extends StatefulWidget {
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
  State<CustomtextInputField> createState() => _CustomtextInputFieldState();
}

class _CustomtextInputFieldState extends State<CustomtextInputField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.inputController,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: widget.hintText,
        prefixIcon: Icon(widget.icon, color: Kcolor.secondaryColor),
        suffixIcon: widget.isPassword
            //added visible password.
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                icon: isPasswordVisible
                    ? const Icon(
                        Icons.visibility,
                        color: Kcolor.secondaryColor,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: Kcolor.secondaryColor,
                      ),
              )
            : const SizedBox(),
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
      validator: widget.onValidate,
    );
  }
}
