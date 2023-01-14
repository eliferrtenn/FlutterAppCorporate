// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

class GeneralToken{
  static String? token;

   Future<bool> setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', value);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

}