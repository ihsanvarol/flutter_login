library flutter_login;

class User{
  final String authorization;
  final String user;
  final String pass;
  final bool success;

  User({
    this.authorization,
    this.user,
    this.pass,
    this.success,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      authorization: json['authToken'],
      success: json['success'],
    );
  }
}