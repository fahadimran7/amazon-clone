import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/services/user_service.dart';

class ApiHelpers {
  static final _userService = locator<UserService>();

  static dynamic handleAuthenticationResponse(
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

  static Map<String, String> setContentHeaders() {
    return <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
  }

  static Map<String, String> setContentHeadersProtected() {
    return <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${_userService.currentUser!.token}'
    };
  }
}
