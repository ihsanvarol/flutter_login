import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

class LoginData {
  final String name;
  final String password;
  final String url;
  final String port;
  final int firmNr;
  final String lang;


  LoginData({
    @required this.name,
    @required this.password,
    @required this.url,
    @required this.port,
    @required this.firmNr,
    @required this.lang,
  });

  @override
  String toString() {
    return '$runtimeType($name, $password)';
  }

  bool operator ==(Object other) {
    if (other is LoginData) {
      return name == other.name && password == other.password;
    }
    return false;
  }

  int get hashCode => hash2(name, password);
}
