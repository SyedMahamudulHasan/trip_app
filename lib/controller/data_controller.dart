import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trip_app/controller/connection_helper.dart';
import '../model/trip_model.dart';

class DataController extends ChangeNotifier {
  ConnectionHelper connectionHelper = ConnectionHelper();
  List<TripModel> trips = [];
  bool isLoading = false;
  final String url = 'https://4c3e-103-7-249-41.ngrok.io/api/v1/all-trips';

  Future<void> getAllTrips() async {
    isLoading = true;

    Response<dynamic>? response = await connectionHelper.getData(url);

    if (response!.statusCode == 200) {
      log('Data fetched');
      print(response.data);

      trips =
          (response.data as List).map((e) => TripModel.fromJson(e)).toList();

      // trips.forEach((element) {
      //   print(element.tripInformation!.stops);
      // });

    } else {
      log('data didnot fetched');
    }
  }
}
