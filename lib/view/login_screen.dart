import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_app/controller/data_controller.dart';
import 'package:trip_app/view/dash_board.dart';
import 'package:trip_app/view/utility/auth_button.dart';
import 'package:trip_app/view/utility/custom_widget/auth_appbar.dart';
import 'package:trip_app/view/utility/custom_widget/custom_text_input_field.dart';
import 'package:trip_app/view/utility/input_validator.dart';

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
            SizedBox(height: size.height * 0.1),

            ///=============================> inputfield
            Form(
              key: _formkey,
              child: Column(
                children: [
                  CustomtextInputField(
                    inputController: _emailController,
                    hintText: "Enter your email",
                    icon: Icons.mail_outline,
                    keyBoardType: TextInputType.emailAddress,
                    isPassword: false,
                    onValidate: (value) {
                      return FormValidator.emailValidator(value);
                    },
                  ),
                  SizedBox(height: size.height * 0.02),
                  CustomtextInputField(
                    inputController: _passwordController,
                    hintText: "Enter your password",
                    icon: Icons.lock,
                    isPassword: true,
                    keyBoardType: TextInputType.text,
                    onValidate: (value) {
                      if (value!.isEmpty) {
                        return "Invalid Password";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: size.height * 0.02),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.1),

            ///=========================================> buttons
            Provider.of<DataController>(context, listen: true).isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : AuthButton(
                    buttonText: "Login",
                    onTriger: () async {
                      if (FormValidator.validateAndSave(_formkey)) {
                        bool isValid = await Provider.of<DataController>(
                                context,
                                listen: false)
                            .getUserLogin(_emailController.text,
                                _passwordController.text) as bool;
                        if (isValid) {
                          //get the trip data.
                          Provider.of<DataController>(context, listen: false)
                              .getAllTrips();
                          Navigator.pushNamed(context, DashBoardScreen.id);
                        }
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
