import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:trip_app/view/driver_list.dart';
import 'package:trip_app/view/utility/constants.dart';

import '../model/constants.dart';
import '../model/trip_model.dart';

detailsBottomSheet(context, size, trip, tripId) {
  showModalBottomSheet(
      backgroundColor: KConstColors.primaryColor,
      isScrollControlled: true,
      context: context,
      builder: ((context) {
        final TripInformation tripInfo =
            trip.tripInformation as TripInformation;
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: size.height * 0.03,
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
                  dataType: "Phone", data: tripInfo.phone, size: size),
              Kwidgets.tripdataItem(
                  dataType: "Address",
                  data: tripInfo.destinationName,
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
                      data: tripInfo.numberOfPeople.toString(),
                      size: size,
                      width: 0.45),
                  Kwidgets.tripdataItem(
                      dataType: "Discount",
                      data: tripInfo.discount.toString(),
                      size: size,
                      width: 0.45),
                ],
              ),
              Kwidgets.tripdataItem(
                dataType: 'Pickup point',
                data: tripInfo.pickupLocationName,
                size: size,
              ),
              Kwidgets.tripdataItem(
                dataType: 'Destination',
                data: tripInfo.destinationName,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Kwidgets.tripdataItem(
                      dataType: 'Booking Method',
                      data: tripInfo.bookingMethod,
                      size: size,
                      width: 0.5),
                  tripInfo.bookingMethod == "hourly"
                      ? Kwidgets.tripdataItem(
                          dataType: 'Hours',
                          data: tripInfo.hours.toString(),
                          size: size,
                          width: 0.45)
                      : const SizedBox()
                ],
              ),
              ////=======================================================stops
              Kwidgets.tripdataItem(
                  dataType: 'Stops', data: tripInfo.stops, size: size),

              // tripdataItem(''),

              ///=========================================> buttons
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: KConstColors.secondaryColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: KConstColors.secondaryColor,
                    ),
                    onPressed: () {
                      // action.actionsOnTrips({
                      //   "id": "a8a8758b-4434-49cb-b5fc-637488f217cd",
                      //   "status": "approved"
                      // });
                      // Navigator.pushReplacementNamed(context, SuccessScreen.id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DriverListScreen(tripId: tripId)),
                      );
                    },
                    child: const Text('Select Drive'),
                  )
                ],
              )
            ]),
          ),
        );
      }));
}
