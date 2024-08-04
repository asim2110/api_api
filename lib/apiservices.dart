import 'dart:convert';

import 'package:api_api/loginmodel.dart';
import 'package:api_api/regmodel.dart';
import 'package:http/http.dart' as http;

class Apiservices {
  Future<LoginModel?> Logfun(String email, String password) async {
    try {
      var url = Uri.parse("https://reqres.in/api/login");
      var response = await http.post(url, body: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        LoginModel model = LoginModel.fromJson(jsonDecode(response.body));
        return model;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<RegisterModel?> Regfun(String name, String email, String password,
      String confirmpassword) async {
    try {
      var url = Uri.parse(
          "https://abusetracker-production.up.railway.app/api/v1/users/");
      var response = await http.post(url, body: {
        "username": name,
        "email": email,
        "password": password,
        "confirm_password": confirmpassword,
      });
      if (response.statusCode == 200) {
        RegisterModel model = RegisterModel.fromJson(jsonDecode(response.body));
        return model;
      }
    } catch (e) {
      print(e);
    }
  }
}
