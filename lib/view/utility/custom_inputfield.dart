import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trip_app/view/utility/constants.dart';

class CustomTextInputfield extends StatefulWidget {
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

  @override
  State<CustomTextInputfield> createState() => _CustomTextInputfieldState();
}

class _CustomTextInputfieldState extends State<CustomTextInputfield> {
  bool isVisible = false;

  OutlineInputBorder inputFieldBorder({errorColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: BorderSide(
          color: errorColor ?? KConstColors.inputFieldBorderColor, width: 2.0),
    );
  }

  _isPasswordVisible() {}

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      keyboardType: widget.keyBoardType,
      enabled: widget.isEnabled,
      textInputAction: widget.textInputAction,
      obscureText: widget.isPassword
          ? isVisible
              ? false
              : true
          : false,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          widget.prefixIcon,
          color: KConstColors.iconColor,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                icon: isVisible
                    ? const Icon(
                        Icons.visibility,
                        color: KConstColors.iconColor,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: KConstColors.iconColor,
                      ),
              )
            : const SizedBox(),
        hintText: widget.hintText,
        focusedBorder: inputFieldBorder(),
        enabledBorder: inputFieldBorder(),
        disabledBorder: inputFieldBorder(),
        errorBorder: inputFieldBorder(
          errorColor: Colors.redAccent,
        ),
        focusedErrorBorder: inputFieldBorder(),
      ),
      validator: widget.validator,
      onFieldSubmitted: (newValue) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
