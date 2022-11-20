import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:trip_app/controller/data_controller.dart';
import 'package:trip_app/view/dash_board.dart';
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
    final data = Provider.of<DataController>(context).driver_list;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFCAC9FD),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Driver List",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DashBoardScreen(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(
                        "${data[index].firstName!} ${data[index].lastName!}"),
                    subtitle: Row(
                      children: [
                        const Text("Occupied: "),
                        data[index].isOccupied!
                            ? const Icon(
                                Icons.check,
                                color: Colors.greenAccent,
                              )
                            : const Icon(
                                Icons.cancel_outlined,
                                color: Colors.redAccent,
                              )
                      ],
                    ),

                    ///phone button.
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        data[index].gender == "Male"
                            ? const Icon(
                                Icons.male_outlined,
                                color: Colors.blueAccent,
                              )
                            : const Icon(
                                Icons.female_outlined,
                                color: Colors.pinkAccent,
                              ),
                        IconButton(
                          onPressed: () {
                            launchPhoneDialer(data[index].phone!);
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
