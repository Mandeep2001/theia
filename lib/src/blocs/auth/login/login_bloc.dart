import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theia/src/exceptions/app_exception.dart';
import 'package:theia/src/services/auth/auth_service.dart';

import 'bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService _authService;

  LoginBloc(this._authService);

  @override
  LoginState get initialState => LoginUninitializedState();

  @override
  void onTransition(Transition<LoginEvent, LoginState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is SignInEvent) {
      yield LoginLoadingState();
      try {
        final response =
            await _authService.login(event.username, event.password);
        if (response.success) {
          yield LoginSuccessState(response.user);
        } else {
          yield CredentialsErrorState(response);
        }
      } on SocketException {
        yield LoginErrorState();
      } on AppException {
        yield LoginErrorState();
      } catch (e) {
        LoginErrorState(message: 'E\' avvenuto un errore inaspettato');
      }
    }
  }
}
