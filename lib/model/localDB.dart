import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class userData {
  // store the login access token.
  static setToken(String access, String refresh) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString("access", access);
    await pref.setString("refresh", refresh);
  }

//get the stored token.
  static getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("access");
  }
}
