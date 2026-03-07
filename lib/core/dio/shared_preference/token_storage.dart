import 'dart:convert';
import 'package:scoctt_edututo/features/auth/auth_services/auth_models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static const String authKey = "auth_data";

  static Future<void> saveAuth(LoginResponseModel model) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(authKey, jsonEncode(model.toJson()));
  }

  static Future<LoginResponseModel?> getAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(authKey);

    if (data == null) return null;

    return LoginResponseModel.fromJson(jsonDecode(data));
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(authKey);
  }
}