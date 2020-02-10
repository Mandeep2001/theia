import 'package:theia/src/dtos/login_response.dart';

abstract class AuthService {
  Future<LoginResponse> login(String username, String password);
}
