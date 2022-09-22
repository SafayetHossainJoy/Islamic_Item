import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CustomHttpRequest {
  static const Map<String, String> defaultHeader = {
    "Accept": "application/json",
    "Authorization":
        "bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpaG9tZWNoZWYuYW50b3BvbGlzLnh5elwvYXBpXC9hZG1pblwvc2lnbi1pbiIsImlhdCI6MTY1NDAwNzYwNiwiZXhwIjoxNjY2OTY3NjA2LCJuYmYiOjE2NTQwMDc2MDYsImp0aSI6IjlLWGFGNmRFdlgwWVNZVzIiLCJzdWIiOjUwLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.Cbii274lgjkMIf2Ix9fZ7e8HPAT47B5MV0QP03Rd520",
  };

  SharedPreferences? sharedPreferences;

  Future<Map<String, String>> getHeaderWithToken() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var header = {
      "Accept": "application/json",
      "Authorization": "bearer  ${sharedPreferences!.getString("token")}",
    };
    print("token is ${sharedPreferences!.getString("token")}");
    return header;
  }

  Future<Map<String, String>> getHeaderWithToken2() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var header = {
      "Content-type": "application/json",
      "Authorization": "bearer ${sharedPreferences!.getString("token")}",
    };
    print("user token is :${sharedPreferences!.getString('token')}");
    return header;
  }

  String allOrderLink =
      "http://testii.xsellencebdltd.com/web/session/authenticate";

  static Future<dynamic> getUsersDropDown() async {
    try {
      String url = "https://apihomechef.antopolis.xyz/api/admin/";
      Uri myUri = Uri.parse(url);
      http.Response response = await http.get(myUri,
          headers: await CustomHttpRequest().getHeaderWithToken());
      if (response.statusCode == 200) {
        print(response);
        return response;
      } else
        return "Error";
    } catch (e) {
      print(e);
      return "Something Wrong...!!!";
    }
  }
}
