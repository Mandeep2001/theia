import 'package:theia/src/dtos/login_response.dart';
import 'package:theia/src/models/user.dart';

abstract class LoginState {}

class LoginUninitializedState implements LoginState {}

class LoginLoadingState implements LoginState {}

class LoginErrorState implements LoginState {
  final String message;

  LoginErrorState(
      {this.message =
          'Qualcosa è andato storto, controlla la tua connessione ad internet e riprova.'});
}

class LoginSuccessState implements LoginState {
  final User user;

  LoginSuccessState(this.user) : assert(user != null);
}

class CredentialsErrorState implements LoginState {
  final LoginResponse loginResponse;

  CredentialsErrorState(this.loginResponse) : assert(loginResponse != null);
}
