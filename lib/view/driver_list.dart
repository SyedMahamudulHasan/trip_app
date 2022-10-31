import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trip_app/view/utility/phoneCall_util.dart';
import 'package:url_launcher/url_launcher.dart';

class DriverListScreen extends StatefulWidget {
  const DriverListScreen({super.key});
  static const id = "/driverList";

  @override
  State<DriverListScreen> createState() => _DriverListScreenState();
}

class _DriverListScreenState extends State<DriverListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: ListView.builder(itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: const Text("Kamrul Bhai"),
                subtitle: const Text("Jessore"),

                ///phone button.
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.male_outlined,
                    ),
                    IconButton(
                      onPressed: () {
                        launchPhoneDialer("+8801727493053");
                      },
                      icon: const Icon(Icons.call),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: sqrt1_2,
                thickness: sqrt1_2,
              ),
            ],
          );
        }),
      ),
    );
  }
}
