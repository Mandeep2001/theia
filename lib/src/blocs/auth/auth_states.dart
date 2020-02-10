import 'package:theia/src/dtos/login_response.dart';
import 'package:theia/src/models/user.dart';

abstract class AuthState {}

class AuthUninitializedState extends AuthState {}

class AuthLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final User user;

  LoginSuccessState(this.user) : assert(user != null);
}

class LoginErrorState extends AuthState {
  final LoginResponse loginResponse;

  LoginErrorState(this.loginResponse) : assert(loginResponse != null);
}
