import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:trip_app/model/constants.dart';
import 'package:trip_app/model/trip_model.dart';

class CustomTripWidget extends StatelessWidget {
  const CustomTripWidget({
    Key? key,
    required this.size,
    required this.index,
    required this.tripId,
    required this.tripInformation,
  }) : super(key: key);
  final Size size;
  final int index;
  final String tripId;

  final TripInformation tripInformation;

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
      onDismissed: (direction) {},
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white70.withOpacity(0.8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              builder: ((context) {
                return Container(
                  margin: EdgeInsets.only(top: size.height * 0.04),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Kwidgets.tripdataItem(
                          dataType: 'Trip Id', data: tripId, size: size),
                      Kwidgets.tripdataItem(
                          dataType: 'Name',
                          data: tripInformation.fullName,
                          size: size),
                      Kwidgets.tripdataItem(
                          dataType: 'Phone number',
                          data: tripInformation.phone,
                          size: size),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Kwidgets.tripdataItem(
                              dataType: 'Pickup',
                              data: tripInformation.pickupPoint,
                              size: size,
                              width: 0.4),
                          Kwidgets.tripdataItem(
                              dataType: 'Destination',
                              data: tripInformation.destination,
                              size: size,
                              width: 0.4),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Kwidgets.tripdataItem(
                              dataType: 'Date',
                              data: tripInformation.date,
                              size: size,
                              width: 0.4),
                          Kwidgets.tripdataItem(
                              dataType: 'Time',
                              data: tripInformation.time,
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
          const SizedBox();
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
                color: Colors.blueGrey.withOpacity(0.7),
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
              text: tripId,
            ),
            tripDataWidget(
                size: size,
                icon: FeatherIcons.user,
                text: tripInformation.fullName,
                isButton: true),
            tripDataWidget(
                size: size,
                icon: FeatherIcons.mapPin,
                text: tripInformation.address),
          ],
        ),
      ),
    );
  }
}
