import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key, required this.isPost}) : super(key: key);
  static String id = '/success';
  final bool isPost;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Visibility(
      visible: true,
      replacement: const CircularProgressIndicator(),
      child: ListView(
        children: [
          Image.asset(
            isPost ? 'assets/gif/splash.gif' : 'assets/gif/splash.gif',
          ),
          const Center(
            child: Text(
              'Successfully confirm the trip',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
