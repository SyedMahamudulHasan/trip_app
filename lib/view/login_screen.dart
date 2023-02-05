import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = '/';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

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
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding:
            EdgeInsets.symmetric(horizontal: 22, vertical: size.height * 0.10),
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
                    validator: (value) {
                      return FormValidator.emailValidator(value);
                    },
                  ),
                  //Text(ref.watch(connectionProvider).apiErrors["login"] ?? ""),

                  Helper.spacer(size, 0.01),
                  CustomTextInputfield(
                    textController: _passwordController,
                    hintText: "Enter your password",
                    prefixIcon: Icons.lock,
                    isPassword: true,
                    screenName: "login",
                    validator: (value) {
                      return FormValidator.passwordValidation(value);
                    },
                  ),
                  //Text(ref.watch(connectionProvider).apiErrors["login"] ?? ""),
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
                  ref.read(isForgetScrren.state).state = true;

                  Navigator.pushNamed(context, FPEmailScreen.id);
                },
                child: const AutoSizeText(
                  'Forget Password?',
                  style: TextStyle(
                    color: Color(0xff6A707C),
                    fontSize: 14,
                  ),
                ),
              ),
            ),

            ///=========================================> buttons
            AuthButton(
              buttonText: "Login",
              onTriger: () async {
                if (FormValidator.validateAndSave(_formkey)) {}
              },
            ),
            // Helper.spacer(size, 0.02),
            AuthtextButton(
              msg: "Don't have an account?",
              buttonText: 'Register Now',
              onTriger: () {
                Navigator.pushReplacementNamed(context, SignupScreen.id);
              },
            ),
            Helper.spacer(size, 0.30),

            ///===============================> policy and service
            Align(
                alignment: Alignment.bottomCenter,
                child: PublicyAndServiceWidget(size: size)),
          ],
        ),
      ),
    );
  }
}
