import 'package:flutter/material.dart';
import 'package:flutter_login/src/models/user_model.dart';

import '../models/login_data.dart';

enum AuthMode { Signup, Login }

/// The result is an error message, callback successes if message is null
typedef AuthCallback = Future<String> Function(LoginData);

/// The result is an error message, callback successes if message is null
typedef RecoverCallback = Future<String> Function(String);

class Auth with ChangeNotifier {
  Auth( {
    this.onSignup,
    this.onRecoverPassword,
    String email = '',
    String password = '',
    String confirmPassword = '',
    String url = '',
    String port = '',
    String lang = '',
    int firmNr = 1,
    this.userLoginInfo,
  })  : this._email = email,
        this._password = password,
        this._confirmPassword = confirmPassword,
        this._url = url,
        this._port = port,
        this._lang = lang,
        this._firmNr = firmNr;

  final AuthCallback onSignup;
  final RecoverCallback onRecoverPassword;
  final User userLoginInfo;

  AuthMode _mode = AuthMode.Login;

  AuthMode get mode => _mode;
  set mode(AuthMode value) {
    _mode = value;
    notifyListeners();
  }

  bool get isLogin => _mode == AuthMode.Login;
  bool get isSignup => _mode == AuthMode.Signup;
  bool isRecover = false;

  AuthMode opposite() {
    return _mode == AuthMode.Login ? AuthMode.Signup : AuthMode.Login;
  }

  AuthMode switchAuth() {
    if (mode == AuthMode.Login) {
      mode = AuthMode.Signup;
    } else if (mode == AuthMode.Signup) {
      mode = AuthMode.Login;
    }
    return mode;
  }

  String _email = '';
  get email => _email;
  set email(String email) {
    _email = email;
    notifyListeners();
  }

  String _password = '';
  get password => _password;
  set password(String password) {
    _password = password;
    notifyListeners();
  }

  String _confirmPassword = '';
  get confirmPassword => _confirmPassword;
  set confirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    notifyListeners();
  }
  
  String _url;
  get url => _url;
  set url(String urlString){
    _url = url;
    notifyListeners();
  }

  String _port;
  get port => _port;
  set port(String portString){
    _port = port;
    notifyListeners();
  }

  String _lang;
  get lang => _lang;
  set lang(String langString){
    _lang = lang;
    notifyListeners();
  }

  int _firmNr;
  get firmNr => _firmNr;
  set firmNr(int value){
    _firmNr = value;
    notifyListeners();
  }
  
}
