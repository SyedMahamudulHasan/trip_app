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
    Provider.of<DataController>(context, listen: false).getDriverList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataController>(context).driver_list;
    final isLoading = Provider.of<DataController>(context).isLoading;
    final Size size = MediaQuery.of(context).size;
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
      body: RefreshIndicator(
        onRefresh: () async {
          await Provider.of<DataController>(context).getDriverList();
        },
        child: Visibility(
          visible: isLoading,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    //width: size.width,
                    height: size.height * 0.14,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.7),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(2, 5),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ID: ${data[index].id!}",
                                  maxLines: 1,
                                ),
                                Text(
                                    "Name: ${data[index].firstName!} ${data[index].lastName!}"),
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text("Available: "),
                                    data[index].isOccupied!
                                        ? const Icon(
                                            Icons.check,
                                            color: Colors.greenAccent,
                                          )
                                        : const Icon(
                                            Icons.cancel_outlined,
                                            color: Colors.redAccent,
                                          ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                        "Current Location: ${data[index].address}"),
                                  ],
                                )
                              ],
                            ),
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
                          // const Divider(
                          //   height: sqrt1_2,
                          //   thickness: sqrt1_2,
                          // ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
