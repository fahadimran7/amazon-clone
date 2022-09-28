import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_architecture/constants/global_variables.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/services/local_storage_service.dart';

class UserService {
  final log = getLogger('UserService');
  User? _currentUser;

  final _localStorageService = locator<LocalStorageService>();

  get currentUser => _currentUser;

  Future<void> loadUserFromDisk() async {
    final userToken =
        await _localStorageService.getValueFromStorage(key: 'x-auth-token');

    if (userToken == null) {
      log.v('No user token found.');
    } else {
      log.v('User token found. Decoding JWT...');

      Map<String, dynamic> payload = Jwt.parseJwt(userToken);

      log.v('payload: $payload');

      await _syncUserAccount(userId: payload['user']['id']);
    }
  }

  Future<void> _syncUserAccount({required String userId}) async {
    log.v('userId passed in: $userId');

    try {
      http.Response apiResponse = await http.get(
        Uri.parse('${GlobalVariables.uri}/api/v1/users/$userId'),
      );

      _currentUser = User.fromJson(jsonDecode(apiResponse.body));

      log.v('Current user set $_currentUser');
    } catch (e) {
      log.e(e);
    }
  }
}
