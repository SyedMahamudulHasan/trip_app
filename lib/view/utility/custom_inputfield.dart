import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trip_app/view/utility/constants.dart';

class CustomTextInputfield extends StatelessWidget {
  const CustomTextInputfield({
    Key? key,
    this.keyBoardType,
    required this.prefixIcon,
    this.isPassword = false,
    required this.hintText,
    required this.textController,
    this.validator,
    this.isConfirmPass = false,
    this.screenName,
    this.textInputAction,
    this.isEnabled = true,
  }) : super(key: key);

  final TextInputType? keyBoardType;
  final IconData prefixIcon;
  final bool isPassword;
  final String hintText;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final bool isConfirmPass;
  final String? screenName;
  final TextInputAction? textInputAction;
  final bool isEnabled;

  OutlineInputBorder inputFieldBorder({errorColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: BorderSide(
          color: errorColor ?? KConstColors.inputFieldBorderColor, width: 2.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      keyboardType: keyBoardType,
      enabled: isEnabled,
      textInputAction: textInputAction,

      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          prefixIcon,
          color: KConstColors.iconColor,
        ),

        ///

        hintText: hintText,

        focusedBorder: inputFieldBorder(),
        enabledBorder: inputFieldBorder(),
        disabledBorder: inputFieldBorder(),
        errorBorder: inputFieldBorder(
          errorColor: Colors.redAccent,
        ),
        focusedErrorBorder: inputFieldBorder(),
      ),
      validator: validator,
      // onFieldSubmitted: (newValue) {
      //   FocusScope.of(context).unfocus();
      // },
    );
  }
}
