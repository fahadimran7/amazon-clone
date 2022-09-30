import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_architecture/constants/app_constants.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/services/local_storage_service.dart';
import 'package:stacked_architecture/utils/api_helpers.dart';

class UserService {
  final log = getLogger('UserService');
  User? _currentUser;

  final _localStorageService = locator<LocalStorageService>();

  User? get currentUser => _currentUser;
  String? _token;

  Future<void> loadUserFromDisk() async {
    final userToken =
        await _localStorageService.getValueFromStorage(key: userTokenKey);

    if (userToken == null) {
      log.v('No user token found.');
    } else {
      log.v('User token found. Decoding JWT...');

      log.v('userToken: $userToken');

      _token = userToken;

      Map<String, dynamic> payload = Jwt.parseJwt(userToken);

      log.v('payload: $payload');

      await _syncUserAccount(userId: payload['user']['id']);
    }
  }

  Future<void> _syncUserAccount({required String userId}) async {
    log.v('userId passed in: $userId');

    try {
      http.Response apiResponse = await http.get(
        Uri.parse('$usersBaseUrl/$userId'),
      );

      var user = User.fromJson(jsonDecode(apiResponse.body));
      user = user.copyWith(token: _token);

      _currentUser = user;

      log.v('Current user set $_currentUser');
    } catch (e) {
      log.e(e);
    }
  }

  Future<dynamic> updateUserProfile({
    required String fullName,
    required String email,
    required bool emailUpdated,
  }) async {
    log.v('fullName passed in: $fullName');
    log.v('email passed in: $email');
    log.v('emailUpdated passed in: $emailUpdated');

    final userId = _currentUser!.id;

    log.v('userId from currentUser is: $userId');

    try {
      http.Response apiResponse = await http.put(
        Uri.parse('$usersBaseUrl/$userId'),
        headers: ApiHelpers.setContentHeadersProtected(),
        body: jsonEncode({
          'email': email,
          'fullName': fullName,
          'emailUpdated': emailUpdated
        }),
      );

      log.v(apiResponse.body);

      return ApiHelpers.handleAuthenticationResponse(
        response: apiResponse,
        onSuccess: () {
          var userToken = _currentUser!.token;
          var updatedUser = User.fromJson(jsonDecode(apiResponse.body));
          _currentUser = updatedUser.copyWith(token: userToken);
          log.v('Current user set $_currentUser');
          return true;
        },
      );
    } catch (e) {
      log.e(e);

      return 'Unable to update user profile.';
    }
  }
}
