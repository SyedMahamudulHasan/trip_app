import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:trip_app/model/constants.dart';
import 'package:trip_app/view/success_splash_screen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
  static String id = '/details';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
                dataType: 'Trip id', data: '012345467890987654321', size: size),
            Kwidgets.tripdataItem(
                dataType: 'Name', data: 'Kamrul Hasan', size: size),
            Kwidgets.tripdataItem(
                dataType: 'Email', data: "a1hgjh@gmail.com", size: size),
            Kwidgets.tripdataItem(
                dataType: "phone", data: "01727493053", size: size),
            Kwidgets.tripdataItem(
                dataType: "address", data: "Dhaka", size: size),
            Kwidgets.tripdataItem(
                dataType: "web_url",
                data: "https://stackoverflow.com/",
                size: size),
            Kwidgets.tripdataItem(
                dataType: "Vehicle type", data: "Niki Lauda", size: size),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Kwidgets.tripdataItem(
                    dataType: "Passengers", data: "4", size: size, width: 0.4),
                Kwidgets.tripdataItem(
                    dataType: "Childrens", data: "4", size: size, width: 0.4),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Kwidgets.tripdataItem(
                    dataType: 'Pickup point',
                    data: 'Dhaka',
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
                    data: '2015-02-11',
                    size: size,
                    width: 0.4),
                Kwidgets.tripdataItem(
                    dataType: 'Time', data: '11 am', size: size, width: 0.4),
              ],
            ),
            Kwidgets.tripdataItem(
                dataType: 'Stops', data: 'cummilla, Barishal', size: size),

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
