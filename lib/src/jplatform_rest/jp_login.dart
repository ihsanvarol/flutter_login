import 'dart:convert';
import 'dart:io';

import 'package:flutter_login/src/models/user_model.dart';

import '../../flutter_login.dart';
import 'package:http/http.dart';

class JPLogin
{
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<User> loginToJPlatform(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
      String authorization = data.name + ":" + data.password+ ":1:1:TRTR";
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      String authEncoded = "BASIC " + stringToBase64.encode(authorization);
      final response = await post(
        'http://127.0.0.1:8080/logo/restservices/rest/login',
        headers: {HttpHeaders.authorizationHeader: authEncoded,},
        // headers: {"Auth-Token": "",},
      );

      final responseJson = json.decode(response.body);
      print(responseJson);
      return User.fromJson(responseJson);
    });
  }
}
