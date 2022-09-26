import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_feather_icons/flutter_feather_icons.dart';

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
              height: size.height * 0.04,
            ),

            ///=======================================>
            tripdataItem(
                dataType: 'Trip id', data: '012345467890987654321', size: size),
            tripdataItem(dataType: 'Name', data: 'Kamrul Hasan', size: size),
            tripdataItem(
                dataType: 'Email', data: "a1hgjh@gmail.com", size: size),
            tripdataItem(dataType: "phone", data: "01727493053", size: size),
            tripdataItem(dataType: "address", data: "Dhaka", size: size),
            tripdataItem(
                dataType: "web_url",
                data: "https://stackoverflow.com/",
                size: size),
            tripdataItem(
                dataType: "Vehicle type", data: "Niki Lauda", size: size),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                tripdataItem(
                    dataType: "Passenger", data: "4", size: size, width: 0.4),
                tripdataItem(
                    dataType: "children", data: "4", size: size, width: 0.4),
              ],
            ),
            tripdataItem(
                dataType: 'Pickup point', data: 'destination', size: size),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                tripdataItem(
                    dataType: 'Date',
                    data: '2015-02-11',
                    size: size,
                    width: 0.4),
                tripdataItem(
                    dataType: 'Time', data: '11 am', size: size, width: 0.4),
              ],
            ),
            tripdataItem(
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
                  onPressed: () {},
                  child: Text('Conform'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container tripdataItem({dataType, data, size, width = 1}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      width: size.width * width,
      height: size.height * 0.06,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(08),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            //spreadRadius: 0,
            blurRadius: 1.5,
            offset: const Offset(1, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            dataType + ":  ",
            style: const TextStyle(
              fontFamily: 'urbanist',
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          AutoSizeText(
            data,
            style: const TextStyle(
              fontFamily: 'urbanist',
              //fontWeight: FontWeight.w400,
            ),
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
