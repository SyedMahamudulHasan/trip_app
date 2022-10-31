import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trip_app/controller/connection_helper.dart';
import 'package:trip_app/model/driver_model.dart';
import '../model/constants.dart';
import '../model/trip_model.dart';

class DataController extends ChangeNotifier {
  ConnectionHelper connectionHelper = ConnectionHelper();
  List<TripModel> trips = [];
  List<DriverModel> driver_list = [];
  bool isLoading = true;
  final String geturl = '$baseUrl/all-trips';
  final String postUrl = '$baseUrl/set-trip-status/';

  Future<void> getAllTrips() async {
    isLoading = false;

    Response<dynamic>? response = await connectionHelper.getData(geturl);

    if (response!.statusCode == 200) {
      log('Data fetched');

      trips =
          (response.data as List).map((e) => TripModel.fromJson(e)).toList();
      isLoading = true;
    } else {
      log('data didnot fetched');
    }

    notifyListeners();
  }

  Future<bool> changeTripStatus(dynamic data) async {
    //isLoading = true;
    Response<dynamic>? response =
        await connectionHelper.postData(postUrl, data);

    if (response!.statusCode == 200) {
      log('Data gache');
      getAllTrips();
      return true;
    } else {
      log('data jaynai');
      log(response.statusCode.toString());
      return false;
    }
  }

  Future<void> getDriverList(String tripId) async {
    isLoading = false;

    Response<dynamic>? response =
        await connectionHelper.getData("$baseUrl/get-nearest-drivers/$tripId/");

    if (response != null) {
      try {
        if (response.statusCode == 200) {
          driver_list = (response.data as List)
              .map((e) => DriverModel.fromJson(e))
              .toList();
          log("==============>>>>>> driver data fetched");
          isLoading = true;
          notifyListeners();
        }
      } catch (e) {
        rethrow;
      }
    }
    notifyListeners();
  }
}
