import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theia/src/services/auth/auth_service.dart';

import 'bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc(this._authService);

  @override
  AuthState get initialState => AuthUninitializedState();

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginEvent) {
      yield AuthLoadingState();
      final response = await _authService.login(event.username, event.password);
      if (response.success) {
        yield LoginSuccessState(response.user);
      } else {
        yield LoginErrorState(response);
      }
    }
  }
}
