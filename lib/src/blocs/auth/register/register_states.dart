abstract class RegisterState {}

class UninitializedState extends RegisterState {}

class LoadingState extends RegisterState {}

class RegisteredState extends RegisterState {}

class RegisterErrorState extends RegisterState {}

class ErrorState extends RegisterState {}
