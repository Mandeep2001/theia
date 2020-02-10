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

    try {
      response = await http.post('$kApiBaseUrl/auth/login',
          body: jsonEncode({'username': username, 'password': password}),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    } catch (e) {
      print(e);
      return LoginResponse(success: false);
    }

    if (response.statusCode == HttpStatus.ok) {
      return LoginResponse(
          success: true, user: User.fromJson(jsonDecode(response.body)));
    }

    return LoginResponse(success: false);
  }
}
