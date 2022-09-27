import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stacked_architecture/constants/global_variables.dart';
import 'package:stacked_architecture/models/application_models.dart';

class AuthenticationService {
  User? currentUser;

  dynamic createUserWithEmailAndPassword(
      {required String fullName,
      required String email,
      required String password}) async {
    try {
      User user = User(
        id: '',
        fullName: fullName,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
      );
      http.Response res = await http.post(
          Uri.parse('${GlobalVariables.uri}/api/v1/auth/signup'),
          body: jsonEncode(user.toJson()),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });

      final authResponse = _handleAuthenticationResponse(res);

      return authResponse;
    } catch (e) {
      return {
        'success': false,
        'error': 'Something went wrong. Sorry for the inconvenience.'
      };
    }
  }

  _handleAuthenticationResponse(http.Response res) {
    final response = jsonDecode(res.body);
    switch (res.statusCode) {
      case 200:
        currentUser = User.fromJson(response);
        return {'success': true, 'user': currentUser};
      case 400:
        return {'success': false, 'error': response['msg']};
      case 500:
        return {'success': false, 'error': response['msg']};
      default:
        return {
          'success': false,
          'error': 'Something went wrong. Sorry for the inconvenience.'
        };
    }
  }
}
