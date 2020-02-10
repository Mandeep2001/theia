import 'package:flutter/foundation.dart';

class User {
  final String id;
  final String username;
  final String email;
  final String jwtToken;
  List followers = [];
  List followed = [];

  User({
    @required this.id,
    @required this.username,
    @required this.email,
    @required this.jwtToken,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        email = json['email'],
        jwtToken = json['jwtToken'],
        followers = json['followers'],
        followed = json['followed'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'jwtToken': jwtToken,
        'followers': followers,
        'followed': followed,
      };
}
