abstract class LoginEvent {}

class SignInEvent implements LoginEvent {
  final String username;
  final String password;

  SignInEvent({this.username, this.password})
      : assert(username != null, password != null);
}

class LogoutEvent implements LoginEvent {}
