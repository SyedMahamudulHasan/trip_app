import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:trip_app/controller/data_controller.dart';
import 'package:trip_app/view/dash_board.dart';
import 'package:trip_app/view/utility/constants.dart';
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
    Provider.of<DataController>(context, listen: false)
        .getDriverList(widget.tripId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataController>(context).driver_list;
    final isLoading = Provider.of<DataController>(context).isLoading;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color(0xFFCAC9FD),
        backgroundColor: KConstColors.primaryColor,
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
          await Provider.of<DataController>(context, listen: false)
              .getDriverList(widget.tripId);
        },
        child: Visibility(
          visible: isLoading,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    //width: size.width,
                    height: size.height * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: KConstColors.secondaryColor.withOpacity(0.7),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(2, 5),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ID: ${data[index].driver!.id.toString()}",
                                  maxLines: 1,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                        "Name: ${data[index].driver!.firstName!} ${data[index].driver!.lastName!}"),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    data[index].driver!.gender == "Male"
                                        ? const Icon(
                                            Icons.male_outlined,
                                            color: Colors.blueAccent,
                                          )
                                        : const Icon(
                                            Icons.female_outlined,
                                            color: Colors.pinkAccent,
                                          ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    launchEmail(data[index].driver!.email!);
                                  },
                                  icon: const Icon(
                                    Icons.email_outlined,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    launchPhoneDialer(
                                        data[index].driver!.phone!);
                                  },
                                  icon: const Icon(
                                    Icons.call,
                                    color: Colors.blue,
                                  ),
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
