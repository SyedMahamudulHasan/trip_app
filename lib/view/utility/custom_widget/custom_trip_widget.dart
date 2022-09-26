import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:trip_app/model/constants.dart';

class CustomTripWidget extends StatelessWidget {
  const CustomTripWidget({
    Key? key,
    required this.size,
    required this.index,
  }) : super(key: key);
  final Size size;
  final int index;

  Widget tripDataWidget({size, icon, text, isButton = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Row(
            children: [
              Icon(icon),
              SizedBox(
                width: size.width * 0.02,
              ),
              Text(text),
            ],
          ),
        ),
        isButton
            ? IconButton(onPressed: () {}, icon: const Icon(FeatherIcons.check))
            : const SizedBox()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ObjectKey(index),
      background: Kwidgets.leftEditIcon,
      secondaryBackground: Kwidgets.rightEditIcon,
      onDismissed: (direction) {
        log('Data dismissed');
      },
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              builder: ((context) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Kwidgets.tripdataItem(
                          dataType: 'Trip Id',
                          data: '1234567890987654321',
                          size: size),
                      Kwidgets.tripdataItem(
                          dataType: 'Name',
                          data: 'Mahamudul Hasan',
                          size: size),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Kwidgets.tripdataItem(
                              dataType: 'Pickup',
                              data: 'Barishal',
                              size: size,
                              width: 0.4),
                          Kwidgets.tripdataItem(
                              dataType: 'Destination',
                              data: 'Jessore',
                              size: size,
                              width: 0.4),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Kwidgets.tripdataItem(
                              dataType: 'Date',
                              data: '26/9/2022',
                              size: size,
                              width: 0.4),
                          Kwidgets.tripdataItem(
                              dataType: 'Time',
                              data: '4:28pm',
                              size: size,
                              width: 0.4),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Confirm'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Completed'),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }));
          return false;
        } else {
          return true;
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 10),
        // height: size.height * 0.10,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(08),
            border: Border.all(color: Colors.black12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: 0,
                blurRadius: 2,
                offset: const Offset(1, 3),
              ),
            ]),
        child: Column(
          children: [
            tripDataWidget(
              size: size,
              icon: FeatherIcons.key,
              text: "71f15860-5bc4-4ff6-a814-416e9dc501f4",
            ),
            tripDataWidget(
                size: size,
                icon: FeatherIcons.user,
                text: "User name",
                isButton: true),
            tripDataWidget(
                size: size, icon: FeatherIcons.mapPin, text: "locations"),
          ],
        ),
      ),
    );
  }
}
