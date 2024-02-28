import 'dart:convert';
import 'package:nike_sneaker_store/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String usersKey = 'usersKey';
  static const String userLoginKey = 'userLoginKey';

  static late SharedPreferences _prefs;

  static Future<void> initialization() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<List<UserModel>?> getUsers() async {
    String? data = _prefs.getString(usersKey);
    if (data == null) return null;
    final maps = jsonDecode(data).cast<Map<String, dynamic>>()
        as List<Map<String, dynamic>>;
    return maps.map(UserModel.fromJson).toList();
  }

  static Future<void> saveUsers(List<UserModel> users) async {
    final maps = users.map((e) => e.toJson()).toList();
    _prefs.setString(usersKey, jsonEncode(maps));
  }

  static Future<UserModel?> getUserLogin() async {
    String? data = _prefs.getString(userLoginKey);
    if (data == null) return null;
    UserModel user =
        UserModel.fromJson(jsonDecode(data) as Map<String, dynamic>);
    return user;
  }

  static Future<void> saveUserLogin(UserModel? user) async {
    if (user != null) {
      _prefs.setString(userLoginKey, jsonEncode(user.toJson()));
    }
  }

  static void removeUserLogin() {
    _prefs.remove(userLoginKey);
  }
}
