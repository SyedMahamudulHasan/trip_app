import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../model/constants.dart';
import '../model/trip_model.dart';

detailsBottomSheet(context, size, trip) {
  showModalBottomSheet(
    backgroundColor: const Color.fromARGB(255, 216, 216, 250).withOpacity(0.5),
    isScrollControlled: true,
    context: context,
    builder: ((context) {
      final Results tripInfo = trip;
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: size.height * 0.04,
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                FeatherIcons.chevronLeft,
                size: 28,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Kwidgets.tripdataItem(
                dataType: 'Trip id', data: trip.id, size: size),
            Kwidgets.tripdataItem(
                dataType: 'Name', data: tripInfo.firstName, size: size),
            Kwidgets.tripdataItem(
                dataType: 'Email', data: tripInfo.email, size: size),
            Kwidgets.tripdataItem(
                dataType: "phone", data: tripInfo.phone, size: size),
            Kwidgets.tripdataItem(
                dataType: "address",
                data: tripInfo.pickupLocationName,
                size: size),

            ///===============================web url

            // Kwidgets.tripdataItem(
            //     dataType: "web_url", data: tripInfo.webUrl, size: size),

            Kwidgets.tripdataItem(
                dataType: "Vehicle type",
                data: tripInfo.vehicleType,
                size: size),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Kwidgets.tripdataItem(
                    dataType: "Passengers",
                    data: tripInfo.numberOfPassengers.toString(),
                    size: size,
                    width: 0.45),
                // Kwidgets.tripdataItem(
                //     dataType: "Childrens",
                //     data: tripInfo.childSeat.toString(),
                //     size: size,
                //     width: 0.45),
              ],
            ),
            Kwidgets.tripdataItem(
              dataType: 'Pickup point',
              data: tripInfo.pickupLocationName,
              size: size,
            ),
            Kwidgets.tripdataItem(
              dataType: 'Destination',
              data: tripInfo.dropOffLocationName,
              size: size,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Kwidgets.tripdataItem(
                    dataType: 'Date',
                    data: tripInfo.date,
                    size: size,
                    width: 0.45),
                Kwidgets.tripdataItem(
                    dataType: 'Time',
                    data: tripInfo.pickupTime,
                    size: size,
                    width: 0.45),
              ],
            ),
            ////=======================================================stops
            Kwidgets.tripdataItem(
                dataType: 'Stops', data: tripInfo.stopsSet, size: size),

            // tripdataItem(''),

            ///=========================================> buttons
            SizedBox(height: size.height * 0.02),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Kcolor.secondaryColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Kcolor.secondaryColor,
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => DriverListScreen(tripId: tripId)),
                    // );
                  },
                  child: const Text('Select Drive'),
                )
              ],
            )
          ]),
        ),
      );
    }),
  );
}
