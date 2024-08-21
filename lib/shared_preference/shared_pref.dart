import 'dart:convert';

import 'package:e_commerce_project/Models/Login_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferance {
  static void SetLoginData(var json) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    LoginModel model = LoginModel.fromJson(json);
    if (model.status == true) {
      String user = jsonEncode(LoginModel.fromJson(json));
      pref.setString('userData', user);
    }
  }

  static Future<LoginModel> GetLoginData() async {
    print("objectuser");
    SharedPreferences pref = await SharedPreferences.getInstance();
    var json = jsonDecode(
        pref.getString('userData') ?? '{"succes":false,"message":"No Data"}');
    var user = LoginModel.fromJson(json);
    return user;
  }

  static void SetToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString('token', token);
  }

  static Future<String?> GetToken() async {
    print("objectuser");
    SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.get("token").toString();
  }
}
