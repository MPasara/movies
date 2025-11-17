import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorageService {
  Future<String?> getLanguageCode();
  Future<void> setLanguageCode(String languageCode);
}

class LocalStorageServiceImpl implements LocalStorageService {
  static const String _localeKey = 'app_locale';

  @override
  Future<String?> getLanguageCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_localeKey);
  }

  @override
  Future<void> setLanguageCode(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, languageCode);
  }
}
