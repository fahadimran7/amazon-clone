import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_architecture/app/app.logger.dart';

class LocalStorageService {
  final log = getLogger('LocalStorageService');
  late SharedPreferences prefs;

  Future<bool> saveToLocalStorage(
      {required String key, required String value}) async {
    prefs = await SharedPreferences.getInstance();
    try {
      await prefs.setString(key, value);
      return true;
    } catch (e) {
      log.e(e);
      return false;
    }
  }

  Future<String?> getValueFromStorage({required String key}) async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<bool> removeValueFromStorage({required String key}) async {
    try {
      await prefs.remove(key);
      return true;
    } catch (e) {
      log.e(e);
      return false;
    }
  }
}
