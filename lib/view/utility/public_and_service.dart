import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PublicyAndServiceWidget extends StatelessWidget {
  const PublicyAndServiceWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size.width * 0.70,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: "By continuting you agree to our ",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  color: Color(0xffC8C8C8),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              children: const [
                TextSpan(
                  text: 'Privacy Policy',
                  style: TextStyle(
                    color: Color(0xff30429A),
                  ),
                ),
                TextSpan(text: ' & '),
                TextSpan(
                  text: 'Terms of Service ',
                  style: TextStyle(
                    color: Color(0xff30429A),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
