import 'dart:convert';
import 'dart:io';

import 'package:flutter_login/src/models/user_model.dart';

import '../../flutter_login.dart';
import 'package:http/http.dart';

class JPLogin
{
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<User> loginToJPlatform(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}, FirmNr: ${data.firmNr}, Lang: ${data.lang}');
    return Future.delayed(loginTime).then((_) async {
      String authorization = data.name + ":" + data.password+":" + data.firmNr.toString() +":1"+":" + data.lang;
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      String authEncoded = "BASIC " + stringToBase64.encode(authorization);
      String url = "http://"+ data.url +":"+ data.port +"/logo/restservices/rest/login";
      final response = await post(
        url,
        headers: {HttpHeaders.authorizationHeader: authEncoded,},
        // headers: {"Auth-Token": "",},
      );

      final responseJson = json.decode(response.body);
      print(responseJson);
      return User.fromJson(data.url, data.port, data.firmNr.toString(), data.lang, data.name, responseJson);
    });
  }
}
