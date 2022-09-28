import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_architecture/constants/global_variables.dart';
import 'package:stacked_architecture/enums/user_types.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/services/local_storage_service.dart';

class AuthenticationService {
  final log = getLogger('AuthenticationService');
  final _localStorageService = locator<LocalStorageService>();

  User? _user;

  Future<dynamic> createUserWithEmailAndPassword(
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
      http.Response apiResponse = await http.post(
        Uri.parse('${GlobalVariables.uri}/api/v1/auth/signup'),
        body: jsonEncode(user.toJson()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );

      return _handleAuthenticationResponse(
        response: apiResponse,
        onSuccess: () {
          return true;
        },
      );
    } catch (e) {
      return 'General sign up failure. Please try again.';
    }
  }

  Future<dynamic> loginUser(
      {required String email, required String password}) async {
    try {
      http.Response apiResponse = await http.post(
        Uri.parse('${GlobalVariables.uri}/api/v1/auth/login'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );

      return _handleAuthenticationResponse(
        response: apiResponse,
        onSuccess: () async {
          _user = User.fromJson(jsonDecode(apiResponse.body)['user']);

          try {
            await _localStorageService.saveToLocalStorage(
              key: 'x-auth-token',
              value: _user!.token!,
            );

            return true;
          } catch (e) {
            return 'Error saving user token. Please try again';
          }
        },
      );
    } catch (e) {
      log.e(e);
      return 'General login failure. Please try again.';
    }
  }

  Future<void> signOutUser() async {
    await _localStorageService.removeValueFromStorage(key: 'x-auth-token');
  }

  dynamic _handleAuthenticationResponse(
      {required http.Response response, required Function onSuccess}) {
    final data = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        return onSuccess();
      case 400:
        return data['msg'];
      case 500:
        return data['msg'];
      default:
        return 'Something went wrong. Sorry for the inconvenience.';
    }
  }
}
