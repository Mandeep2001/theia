import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theia/src/blocs/auth/register/bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  @override
  RegisterState get initialState => UninitializedState();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    yield LoadingState();
  }
}
