import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trip_app/controller/connection_helper.dart';
import 'package:trip_app/model/driver_model.dart';
import 'package:trip_app/model/userDB.dart';
import '../model/constants.dart';
import '../model/trip_model.dart';

class DataController extends ChangeNotifier {
  ConnectionHelper connectionHelper = ConnectionHelper();
  List<TripModel> trips = [];
  List<DriverModel> driver_list = [];
  bool isLoading = true;
  UserDB localDatabase = UserDB();
  String userEmail = "afsan@gmail.com";
  final String geturl = '$baseUrl/admin/all-trips';
  final String postUrl = '$baseUrl/admin/set-trip-status/';

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

  Future<bool> getLogin(dynamic data) async {
    bool isLogged = false;
    isLoading = false;
    notifyListeners();
    try {
      final response = await connectionHelper.postData("$baseUrl/login/", data);

      if (response != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          localDatabase.storeUserData({
            "email": response.data["email"],
            "access": response.data["accss"],
          });
          userEmail = response.data["email"];
          isLogged = true;
        }
      }
    } catch (e) {
      throw "Couldn't logged in";
    }

    isLoading = true;
    notifyListeners();
    return isLogged;
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

  Future<void> getDriverList(String tripID) async {
    isLoading = false;

    Response<dynamic>? response = await connectionHelper
        .getData("$baseUrl/admin/show-drivers-for-this-trip/$tripID");

    if (response != null) {
      if (response.statusCode == 200) {
        driver_list = (response.data as List)
            .map((e) => DriverModel.fromJson(e))
            .toList();
        log("==============>>>>>> driver data fetched");
        isLoading = true;
        notifyListeners();
      }
    }
    notifyListeners();
  }

  Future<void> assignVehicle(dynamic data) async {
    final token = await localDatabase.getUserData(userEmail);
    try {
      final response = await connectionHelper.postDataWithHeaders(
          "$baseUrl/admin/assign-vehicle/", data, token);
      if (response != null) {
        if (response.statusCode == 200) {
          print(response.data);
        }
      }
    } catch (e) {
      throw "Trip not booked $e";
    }
  }
}
