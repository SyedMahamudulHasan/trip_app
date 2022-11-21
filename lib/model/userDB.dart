import 'package:shared_preferences/shared_preferences.dart';

class UserDB {
  UserDB();

  Future<void> storeUserData(dynamic data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(data["email"], data["access"]);
    print(data);
  }

  Future<String> getUserData(dynamic data) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(data["email"])!;
  }
}
