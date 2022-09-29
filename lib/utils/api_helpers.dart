import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelpers {
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
    return <String, String>{'Content-Type': 'application/json; charset=UTF-8'};
  }
}
