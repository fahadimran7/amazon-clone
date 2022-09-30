import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_architecture/constants/app_constants.dart';
import 'package:stacked_architecture/enums/user_types.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/services/local_storage_service.dart';
import 'package:stacked_architecture/utils/api_helpers.dart';

class AuthenticationService {
  final log = getLogger('AuthenticationService');

  final _localStorageService = locator<LocalStorageService>();

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
        Uri.parse('$authBaseUrl/signup'),
        body: jsonEncode(user.toJson()),
        headers: ApiHelpers.setContentHeaders(),
      );

      return ApiHelpers.handleApiResponse(
        response: apiResponse,
        onSuccess: () => true,
      );
    } catch (e) {
      log.e(e);
      return 'General sign up failure. Please try again.';
    }
  }

  Future<dynamic> loginUser(
      {required String email, required String password}) async {
    try {
      User user = User(
        email: email,
        password: password,
      );

      http.Response apiResponse = await http.post(
        Uri.parse('$authBaseUrl/login'),
        body: jsonEncode(user.toJson()),
        headers: ApiHelpers.setContentHeaders(),
      );

      return ApiHelpers.handleApiResponse(
        response: apiResponse,
        onSuccess: () async {
          // User from database
          final token = jsonDecode(apiResponse.body)['token'];

          // Save token to shared prefs
          final bool tokenSaved = await _localStorageService.saveToLocalStorage(
            key: userTokenKey,
            value: token,
          );

          if (!tokenSaved) return 'Error saving user token. Please try again';

          return true;
        },
      );
    } catch (e) {
      log.e(e);
      return 'General login failure. Please try again.';
    }
  }

  Future<bool> signOutUser() async {
    final bool tokenRemoved = await _localStorageService.removeValueFromStorage(
      key: userTokenKey,
    );

    if (!tokenRemoved) return false;

    return true;
  }
}
