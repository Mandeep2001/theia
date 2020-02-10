import 'package:flutter/foundation.dart';
import 'package:theia/src/models/user.dart';

class LoginResponse {
  final bool success;
  final User user;
  final String usernameError;
  final String passwordError;

  LoginResponse(
      {@required this.success,
      this.user,
      this.usernameError,
      this.passwordError})
      : assert(success != null);
}
