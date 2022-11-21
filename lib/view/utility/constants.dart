import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KApiUrls {
  static const baseurl =
      "https://08c7-118-179-115-23.in.ngrok.io/api/v1"; //"https://uc-backend.unitedchauffeur.co.uk/api/v1";
}


class KConstColors {
  static const Color primaryColor = Color(0xFFf5f5f5);
  static const Color secondaryColor = Color(0xFF30429A);
  static const Color otpBorderColor = Color(0xff4271CF);
  static const Color whiteColor = Color(0xFFE8ECF4);
  static const Color hintColor = Color(0xFF8391A1);
  static const Color orangeColor = Color(0xFFF76654);
  static const Color textColor = Color(0xFF000000);
  static Color dropDownColor = Colors.white;

  ///new color
  static const Color iconColor = Color(0xff4271cf);
  static const Color inputFieldBorderColor = Color(0xff3772ff);
  static const buttonColor = Color(0xff523cf8);
  static const auThtextButton = Color(0xff4271CF);
}

class Helper {
  static Widget spacer(Size size, double space) {
    return SizedBox(
      height: size.height * space,
    );
  }

  static const athTopPadding =
      EdgeInsets.symmetric(horizontal: 22, vertical: 125);

  static const athTopPaddingWithButton =
      EdgeInsets.symmetric(horizontal: 22, vertical: 40);

  static OutlineInputBorder inputFieldBorder({color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: color ?? KConstColors.inputFieldBorderColor,
        width: 1.5,
      ),
    );
  }
}

class KConstTextStyle {
  static TextStyle Header = GoogleFonts.urbanist(
      textStyle: const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 30,
    color: KConstColors.secondaryColor,
  ));

  static const TextStyle SubHeader = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 25,
    //color: MYEColors.secondaryColor,
  );

  static const TextStyle akBodyText = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    //color: MYEColors.textColor,
  );

  static const TextStyle akHintText = TextStyle(
    fontSize: 16,
    //color: MYEColors.hintColor,
  );
  static const TextStyle testFormLettering = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: Colors.black,
  );
  static const TextStyle levelFormLettering = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    // color: MYEColors.secondaryColor,
  );

  static TextStyle buttonText = GoogleFonts.urbanist(
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.white,
    ),
  );

  static TextStyle textButton = GoogleFonts.quicksand(
    textStyle: const TextStyle(
      color: Color(0xff4271CF),
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
  );

  static TextStyle textButton1 = GoogleFonts.quicksand(
    textStyle: const TextStyle(
      color: Color(0xff1E232C),
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
  );

  static TextStyle birthFieldText = const TextStyle(
    fontFamily: "GT Walsheim Pro",
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xff777E91),
  );

  static TextStyle forgetScreenMsg = GoogleFonts.quicksand(
    textStyle: const TextStyle(
      color: Color(0xff8391A1),
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  );
}

const Icon backButton = Icon(
  Icons.arrow_back_ios,
  color: Colors.black,
  size: 20,
);
const Icon menuButton = Icon(
  Icons.menu_outlined,
  color: Colors.black,
  size: 20,
);
