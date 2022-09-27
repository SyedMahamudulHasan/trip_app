import 'package:flutter/material.dart';

import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:trip_app/model/constants.dart';
import 'package:trip_app/model/trip_model.dart';
import 'package:trip_app/view/success_splash_screen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.trip}) : super(key: key);
  static String id = '/details';
  final TripModel trip;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TripInformation tripInfo = trip.tripInformation as TripInformation;
    return Scaffold(
      body: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(horizontal: 16, vertical: size.height * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///==================================> back button
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

            ///=======================================>
            Kwidgets.tripdataItem(
                dataType: 'Trip id', data: trip.requestTripId, size: size),
            Kwidgets.tripdataItem(
                dataType: 'Name', data: tripInfo.fullName, size: size),
            Kwidgets.tripdataItem(
                dataType: 'Email', data: tripInfo.email, size: size),
            Kwidgets.tripdataItem(
                dataType: "phone", data: tripInfo.phone, size: size),
            Kwidgets.tripdataItem(
                dataType: "address", data: tripInfo.address, size: size),

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
                    data: tripInfo.numberOfPeople.toString(),
                    size: size,
                    width: 0.4),
                Kwidgets.tripdataItem(
                    dataType: "Childrens",
                    data: tripInfo.childSeat.toString(),
                    size: size,
                    width: 0.4),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Kwidgets.tripdataItem(
                    dataType: 'Pickup point',
                    data: tripInfo.pickupPoint,
                    size: size,
                    width: 0.4),
                Kwidgets.tripdataItem(
                    dataType: 'Destination',
                    data: tripInfo.destination,
                    size: size,
                    width: 0.4),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Kwidgets.tripdataItem(
                    dataType: 'Date',
                    data: tripInfo.date,
                    size: size,
                    width: 0.4),
                Kwidgets.tripdataItem(
                    dataType: 'Time',
                    data: tripInfo.time,
                    size: size,
                    width: 0.4),
              ],
            ),
            ////=======================================================stops
            Kwidgets.tripdataItem(
                dataType: 'Stops', data: tripInfo.stops, size: size),

            // tripdataItem(''),

            ///=========================================> buttons
            SizedBox(
              height: size.height * 0.06,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, SuccessScreen.id);
                  },
                  child: Text('Confirm'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
