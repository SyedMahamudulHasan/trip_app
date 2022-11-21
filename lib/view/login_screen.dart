import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_app/controller/data_controller.dart';
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
    final dataProdicer = Provider.of<DataController>(context);
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
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return null;
                        }
                        return "Invalid email";
                      },
                    ),
                    //Text(ref.watch(connectionProvider).apiErrors["login"] ?? ""),

                    Helper.spacer(size, 0.03),
                    CustomTextInputfield(
                      textController: _passwordController,
                      hintText: "Enter your password",
                      prefixIcon: Icons.lock,
                      isPassword: true,
                      screenName: "login",
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return null;
                        }
                        return "Invalid password";
                      },
                    ),
                    // Text( ?? ""),
                    Helper.spacer(size, 0.03),
                  ],
                ),
              ),

              !dataProdicer.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: KConstColors.secondaryColor,
                      ),
                    )
                  : AuthButton(
                      buttonText: "Login",
                      onTriger: () async {
                        FocusScope.of(context).unfocus();
                        if (_formkey.currentState!.validate()) {
                          Provider.of<DataController>(context, listen: false)
                              .getLogin({
                            "email": _emailController.text,
                            "password": _passwordController.text,
                          });
                        }
                      },
                    ),

              Helper.spacer(size, 0.40),

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
