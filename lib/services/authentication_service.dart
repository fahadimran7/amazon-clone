import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_architecture/constants/global_variables.dart';
import 'package:stacked_architecture/enums/user_types.dart';
import 'package:stacked_architecture/models/application_models.dart';

class AuthenticationService {
  final log = getLogger('AuthenticationService');

  User? currentUser;

  Future<Map<String, dynamic>> createUserWithEmailAndPassword(
      {required String fullName,
      required String email,
      required String password}) async {
    try {
      User user = User(
        fullName: fullName,
        email: email,
        password: password,
        type: UserType.user.toString(),
      );
      http.Response res = await http.post(
          Uri.parse('${GlobalVariables.uri}/api/v1/auth/signup'),
          body: jsonEncode(user.toJson()),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });

      final authResponse = _handleAuthenticationResponse(
        res: res,
        onSuccess: () {
          currentUser = User.fromJson(jsonDecode(res.body));

          log.v('Current user set: $currentUser');

          return {
            'success': true,
            'msg':
                'Account created successfully. Please login with the same credentials.'
          };
        },
      );

      return authResponse;
    } catch (e) {
      return {
        'success': false,
        'error': 'General sign up failure. Please try again.'
      };
    }
  }

  Future<Map<String, dynamic>> loginUser(
      {required String email, required String password}) async {
    try {
      http.Response res = await http.post(
          Uri.parse('${GlobalVariables.uri}/api/v1/auth/login'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });

      final authResponse = _handleAuthenticationResponse(
        res: res,
        onSuccess: () {
          return {'success': true, 'msg': jsonDecode(res.body)['msg']};
        },
      );

      return authResponse;
    } catch (e) {
      return {
        'success': false,
        'error': 'General login failure. Please try again.'
      };
    }
  }

  _handleAuthenticationResponse(
      {required http.Response res, required Function onSuccess}) {
    final response = jsonDecode(res.body);
    switch (res.statusCode) {
      case 200:
        return onSuccess();
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
