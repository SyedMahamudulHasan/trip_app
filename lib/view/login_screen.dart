import 'package:flutter/material.dart';
import 'package:trip_app/view/utility/auth_appbar.dart';
import 'package:trip_app/view/utility/auth_button.dart';
import 'package:trip_app/view/utility/auth_text_button.dart';
import 'package:trip_app/view/utility/constants.dart';
import 'package:trip_app/view/utility/custom_inputfield.dart';
import 'package:trip_app/view/utility/public_and_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String id = '/';

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool islogged = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
              horizontal: 22, vertical: size.height * 0.10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///===========================> welcome msg
              AuthAppBar(
                  size: size, title: 'Welcome back! Glad \nto see you, Again!'),

              ///=============================> inputfield
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    Helper.spacer(size, 0.06),
                    CustomTextInputfield(
                      textController: _emailController,
                      hintText: "Enter your email",
                      prefixIcon: Icons.mail_outline,
                      keyBoardType: TextInputType.emailAddress,
                      screenName: "login",
                      textInputAction: TextInputAction.next,
                      validator: (value) {},
                    ),
                    //Text(ref.watch(connectionProvider).apiErrors["login"] ?? ""),

                    Helper.spacer(size, 0.02),
                    CustomTextInputfield(
                      textController: _passwordController,
                      hintText: "Enter your password",
                      prefixIcon: Icons.lock,
                      isPassword: true,
                      screenName: "login",
                      textInputAction: TextInputAction.done,
                      validator: (value) {},
                    ),
                    // Text( ?? ""),
                    Helper.spacer(size, 0.03),
                  ],
                ),
              ),

              ///=====================================> forgetbutton
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    ///tracking of going to the forget screens
                  },
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xff6A707C),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),

              ///=========================================> buttons
              // isAsyn
              //     ? const Align(
              //         alignment: Alignment.center,
              //         child: CircularProgressIndicator(
              //           color: KConstColors.secondaryColor,
              //         ),
              //       )
              AuthButton(
                buttonText: "Login",
                onTriger: () async {
                  FocusScope.of(context).unfocus();
                },
              ),
              Helper.spacer(size, 0.01),
              AuthtextButton(
                msg: "Don't have an account?",
                buttonText: 'Register Now',
                onTriger: () {},
              ),

              ///==============================>> signin with google.
              // AuthButton(
              //     buttonText: "Social Login",
              //     onTriger: () {
              //       googleProvider.signInWithGoogle();
              //     }),
              Helper.spacer(size, 0.28),

              ///===============================> policy and service
              Align(
                  alignment: Alignment.bottomCenter,
                  child: PublicyAndServiceWidget(size: size)),
            ],
          ),
        ),
      ),
    );
  }
}
