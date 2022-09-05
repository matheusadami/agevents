import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  late final SharedPreferences shared;

  LocalStorageService() {
    SharedPreferences.getInstance().then((value) => shared = value);
  }

  Future<bool> saveString({required String key, required String value}) async {
    return await shared.setString(key, value);
  }

  Future<bool> remove({required String key}) async {
    return await shared.remove(key);
  }

  String getString({required String key}) {
    return shared.getString(key) ?? '';
  }
}
