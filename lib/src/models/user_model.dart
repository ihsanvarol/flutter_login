library flutter_login;

class User {
  final String url;
  final String port;
  final String firmNr;
  final String lang;
  final String user;
  final String pass;
  final String authorizationKey;
  final bool success;

  User(
      {this.url,
      this.port,
      this.firmNr,
      this.lang,
      this.user,
      this.pass,
      this.authorizationKey,
      this.success});

  factory User.fromJson(String url, String port, String firmNr, String lang,
      String user, Map<String, dynamic> json) {
    return User(
      url: url,
      port: port,
      firmNr: firmNr,
      lang: lang,
      user: user,
      authorizationKey: json['authToken'],
      success: json['success'],
    );
  }
}
