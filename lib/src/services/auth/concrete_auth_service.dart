import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:theia/constants.dart';
import 'package:theia/src/dtos/login_response.dart';
import 'package:theia/src/models/user.dart';
import 'package:theia/src/services/auth/auth_service.dart';

class ConcreteAuthService implements AuthService {
  Future<LoginResponse> login(String username, String password) async {
    var response;

    response = await http.post('$kApiBaseUrl/auth/login',
        body: jsonEncode({'username': username, 'password': password}),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});

    if (response.statusCode == HttpStatus.ok) {
      return LoginResponse(
        success: true,
        user: User.fromJson(
          jsonDecode(response.body),
        ),
      );
    }
    if (response.statusCode == HttpStatus.notFound) {
      return LoginResponse(
          success: false,
          usernameError: 'Nessun utente trovato per questo nome utente');
    }
    if (response.statusCode == HttpStatus.unauthorized) {
      return LoginResponse(
        success: false,
        passwordError: 'Password non corretta',
      );
    }

    return LoginResponse(
        success: false,
        generalError:
            'Qualcosa è andato storto, controlla la tua connessione ad internet e riprova.');
  }
}
