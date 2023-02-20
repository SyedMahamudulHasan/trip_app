import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:trip_app/controller/data_controller.dart';
import 'package:trip_app/model/constants.dart';
import 'package:trip_app/view/dash_board.dart';
import 'package:trip_app/view/utility/phone_util.dart';

class DriverListScreen extends StatefulWidget {
  const DriverListScreen({super.key, required this.tripId});
  static const id = "/driverList";
  final String tripId;

  @override
  State<DriverListScreen> createState() => _DriverListScreenState();
}

class _DriverListScreenState extends State<DriverListScreen>
    with TickerProviderStateMixin {
  Map<String, bool> isExpanded = {};
  late final AnimationController _controller;
  @override
  void initState() {
    Provider.of<DataController>(context, listen: false)
        .getDriverList(widget.tripId);
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final driverList = Provider.of<DataController>(context).driver_list;
    final isDriver = Provider.of<DataController>(context).isDriver;
    final isLoading = Provider.of<DataController>(context).isLoading;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color(0xFFCAC9FD),
        backgroundColor: Kcolor.primaryColor,
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
          visible: !isLoading,
          replacement: const Center(
            child: CircularProgressIndicator(
              color: Kcolor.secondaryColor,
            ),
          ),
          child: isDriver
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: ListView.builder(
                      itemCount: driverList.length,
                      itemBuilder: (context, index) {
                        /// =====================>>> expanded button
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isExpanded[driverList[index]
                                      .driver!
                                      .id
                                      .toString()] ==
                                  null) {
                                isExpanded[driverList[index]
                                    .driver!
                                    .id
                                    .toString()] = true;
                              }
                              isExpanded[
                                      driverList[index].driver!.id.toString()] =
                                  !isExpanded[
                                      driverList[index].driver!.id.toString()]!;
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
                                border: Border.all(
                                  color: Kcolor.inputFieldBorderColor,
                                  width: 2,
                                )
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: KConstColors.secondaryColor.withOpacity(0.7),
                                //     spreadRadius: 1,
                                //     blurRadius: 4,
                                //     offset: const Offset(2, 5),
                                //   ),
                                // ],
                                ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        " Distance: ${driverList[index].distanceFromLocation!.toStringAsFixed(1)} km",
                                        maxLines: 1,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            children: [
                                              driverList[index]
                                                          .driver!
                                                          .gender ==
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
                                isExpanded[driverList[index]
                                                .driver!
                                                .id
                                                .toString()] !=
                                            null &&
                                        isExpanded[driverList[index]
                                                .driver!
                                                .id
                                                .toString()] ==
                                            true
                                    ? Column(
                                        children: [
                                          const Divider(
                                            height: sqrt1_2,
                                            thickness: sqrt1_2,
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 8),
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    const Icon(
                                                        FeatherIcons.key),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    Text(driverList[index]
                                                        .vehicle!
                                                        .id
                                                        .toString()),
                                                  ],
                                                ),
                                                SizedBox(
                                                    height: size.height * 0.01),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Icon(Icons
                                                            .car_rental_outlined),
                                                        SizedBox(
                                                          width:
                                                              size.width * 0.02,
                                                        ),
                                                        Text(
                                                            "${driverList[index].vehicle!.manufacturer}"),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(FeatherIcons
                                                            .package),
                                                        SizedBox(
                                                          width:
                                                              size.width * 0.02,
                                                        ),
                                                        Text(
                                                            "${driverList[index].vehicle!.vehicleType}"),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                    height: size.height * 0.01),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Icon(Icons
                                                            .card_travel_outlined),
                                                        SizedBox(
                                                          width:
                                                              size.width * 0.02,
                                                        ),
                                                        Text(
                                                            "${driverList[index].vehicle!.luggageCapacity}"),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(Icons
                                                            .child_care_sharp),
                                                        SizedBox(
                                                          width:
                                                              size.width * 0.02,
                                                        ),
                                                        Text(
                                                            "${driverList[index].vehicle!.luggageCapacity}"),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    final isBooked = await Provider
                                                            .of<DataController>(
                                                                context,
                                                                listen: false)
                                                        .assignVehicle({
                                                      "trip_id": widget.tripId,
                                                      "driver_id":
                                                          driverList[index]
                                                              .driver!
                                                              .id,
                                                      "vehicle_id":
                                                          driverList[index]
                                                              .vehicle!
                                                              .id,
                                                    });

                                                    if (isBooked) {
                                                      QuickAlert.show(
                                                          context: context,
                                                          type: QuickAlertType
                                                              .success,
                                                          confirmBtnColor: Kcolor
                                                              .secondaryColor,
                                                          text:
                                                              'Driver Booked Successfully!',
                                                          onConfirmBtnTap: () {
                                                            setState(() {
                                                              isExpanded[driverList[
                                                                          index]
                                                                      .driver!
                                                                      .id
                                                                      .toString()] =
                                                                  !isExpanded[driverList[
                                                                          index]
                                                                      .driver!
                                                                      .id
                                                                      .toString()]!;
                                                            });
                                                            Navigator.pop(
                                                                context);
                                                          });
                                                    } else {
                                                      QuickAlert.show(
                                                        context: context,
                                                        type: QuickAlertType
                                                            .error,
                                                        title: 'Oops...',
                                                        text:
                                                            'Sorry, something went wrong',
                                                      );
                                                    }
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      vertical: 8,
                                                      horizontal: 16,
                                                    ),
                                                    height: size.height * 0.045,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color:
                                                          Kcolor.secondaryColor,
                                                    ),
                                                    child: const Text(
                                                      "Assign Driver",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 16,
                                                        color:
                                                            Kcolor.primaryColor,
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
                )

              ///if driver not found
              : Column(
                  children: [
                    Center(
                      child: Image.asset('assets/gif/error.gif'),
                    ),
                    Text(
                      "No driver is available right now.",
                      style: KConstTextStyle.forgetScreenMsg.copyWith(
                        fontSize: size.width * 0.05,
                        color: Color.fromARGB(255, 145, 19, 3),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
