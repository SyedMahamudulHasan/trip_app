import 'package:flutter/material.dart';
import 'package:trip_app/view/utility/constants.dart';

class AuthtextButton extends StatelessWidget {
  const AuthtextButton({
    Key? key,
    required this.msg,
    required this.buttonText,
    required this.onTriger,
  }) : super(key: key);

  final String msg;
  final String buttonText;
  final Function onTriger;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          msg,
          style: KConstTextStyle.textButton1,
        ),
        TextButton(
          onPressed: () {
            onTriger();
          },
          child: Text(
            buttonText,
            style: KConstTextStyle.textButton,
          ),
        )
      ],
    );
  }
}
