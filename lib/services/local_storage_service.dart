import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  late SharedPreferences prefs;

  Future<void> saveToLocalStorage(
      {required String key, required String value}) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String?> getValueFromStorage({required String key}) async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> removeValueFromStorage({required String key}) async {
    await prefs.remove(key);
  }
}
