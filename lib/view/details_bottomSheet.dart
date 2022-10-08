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
      final TripInformation tripInfo = trip.tripInformation as TripInformation;
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: size.height * 0.06,
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
              dataType: "Vehicle type", data: tripInfo.vehicleType, size: size),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Kwidgets.tripdataItem(
                  dataType: "Passengers",
                  data: tripInfo.numberOfPeople.toString(),
                  size: size,
                  width: 0.45),
              Kwidgets.tripdataItem(
                  dataType: "Childrens",
                  data: tripInfo.childSeat.toString(),
                  size: size,
                  width: 0.45),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Kwidgets.tripdataItem(
                  dataType: 'Pickup point',
                  data: tripInfo.pickupPoint,
                  size: size,
                  width: 0.45),
              Kwidgets.tripdataItem(
                  dataType: 'Destination',
                  data: tripInfo.destination,
                  size: size,
                  width: 0.45),
            ],
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
                  data: tripInfo.time,
                  size: size,
                  width: 0.45),
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     ElevatedButton(
          //       onPressed: () {
          //         Navigator.pop(context);
          //       },
          //       child: const Text('Cancel'),
          //     ),
          //     ElevatedButton(
          //       onPressed: () {
          //         action.actionsOnTrips({
          //           "id": "a8a8758b-4434-49cb-b5fc-637488f217cd",
          //           "status": "approved"
          //         });
          //         Navigator.pushReplacementNamed(context, SuccessScreen.id);
          //       },
          //       child: const  Text('Confirm'),
          //     )
          //   ],
          // )
        ]),
      );
    }),
  );
}
