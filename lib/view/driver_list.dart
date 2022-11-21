import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:trip_app/controller/data_controller.dart';
import 'package:trip_app/model/constants.dart';
import 'package:trip_app/view/dash_board.dart';
import 'package:trip_app/view/utility/auth_button.dart';
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
  bool isExpanded = false;

  @override
  void initState() {
    Provider.of<DataController>(context, listen: false)
        .getDriverList(widget.tripId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final driverList = Provider.of<DataController>(context).driver_list;

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
                itemCount: driverList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      //width: size.width,
                      ///Todo:
                      //height: size.height * 0.1,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  " ID: ${driverList[index].driver!.id.toString()}",
                                  maxLines: 1,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        driverList[index].driver!.gender ==
                                                "Male"
                                            ? const Icon(
                                                Icons.male,
                                                color: Colors.blue,
                                              )
                                            : const Icon(Icons.female,
                                                color: Colors.pinkAccent),
                                        SizedBox(
                                          width: size.width * 0.02,
                                        ),
                                        Text(
                                            "${driverList[index].driver!.firstName!} ${driverList[index].driver!.lastName!}"),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    // data[index].driver!.gender == "Male"
                                    //     ? const Icon(
                                    //         Icons.male_outlined,
                                    //         color: Colors.blueAccent,
                                    //       )
                                    //     : const Icon(
                                    //         Icons.female_outlined,
                                    //         color: Colors.pinkAccent,
                                    //       ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    launchEmail(
                                        driverList[index].driver!.email!);
                                  },
                                  icon: const Icon(
                                    Icons.email_outlined,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    launchPhoneDialer(
                                        driverList[index].driver!.phone!);
                                  },
                                  icon: const Icon(
                                    Icons.call,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          ///=======================>>> vehical info
                          isExpanded
                              ? Column(
                                  children: [
                                    const Divider(
                                      height: sqrt1_2,
                                      thickness: sqrt1_2,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 8),
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(FeatherIcons.key),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(driverList[index]
                                                  .vehicle!
                                                  .id
                                                  .toString()),
                                            ],
                                          ),
                                          Helper.spacer(size, 0.01),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(Icons
                                                      .car_rental_outlined),
                                                  SizedBox(
                                                    width: size.width * 0.02,
                                                  ),
                                                  Text(
                                                      "${driverList[index].vehicle!.manufacturer}"),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                      FeatherIcons.package),
                                                  SizedBox(
                                                    width: size.width * 0.02,
                                                  ),
                                                  Text(
                                                      "${driverList[index].vehicle!.vehicleType}"),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Helper.spacer(size, 0.01),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(Icons
                                                      .card_travel_outlined),
                                                  SizedBox(
                                                    width: size.width * 0.02,
                                                  ),
                                                  Text(
                                                      "${driverList[index].vehicle!.luggageCapacity}"),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                      Icons.child_care_sharp),
                                                  SizedBox(
                                                    width: size.width * 0.02,
                                                  ),
                                                  Text(
                                                      "${driverList[index].vehicle!.luggageCapacity}"),
                                                ],
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              print('I am clicked');

                                              ///==================================>>>> booking driver
                                              print(
                                                  " trip id : ${widget.tripId}");
                                              print(
                                                  " trip id : ${driverList[index].driver!.id}");
                                              print(
                                                  " trip id : ${driverList[index].vehicle!.id}");

                                              Provider.of<DataController>(
                                                      context,
                                                      listen: false)
                                                  .assignVehicle({
                                                "trip_id": widget.tripId,
                                                "driver_id": driverList[index]
                                                    .driver!
                                                    .id,
                                                "vehical_id": driverList[index]
                                                    .vehicle!
                                                    .id,
                                              });
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 8,
                                                horizontal: 16,
                                              ),
                                              height: size.height * 0.045,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color:
                                                    KConstColors.secondaryColor,
                                              ),
                                              child: const Text(
                                                "Assign Driver",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color:
                                                      KConstColors.primaryColor,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
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
