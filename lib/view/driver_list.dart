import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:trip_app/controller/data_controller.dart';
import 'package:trip_app/view/utility/phoneCall_util.dart';
import 'package:url_launcher/url_launcher.dart';

class DriverListScreen extends StatefulWidget {
  const DriverListScreen({super.key, required this.tripId});
  static const id = "/driverList";
  final String tripId;

  @override
  State<DriverListScreen> createState() => _DriverListScreenState();
}

class _DriverListScreenState extends State<DriverListScreen> {
  @override
  void initState() {
    Provider.of<DataController>(context, listen: false).getDriverList(
      widget.tripId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataController>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: ListView.builder(
            itemCount: data.driver_list.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(data.driver_list[index].name!),
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
