import 'dart:async';

import 'package:modern_turkmen/data/services/shared_preferences_service.dart';
import 'package:modern_turkmen/domain/models/language.dart';

import 'language_repository.dart';

class LanguageRepositoryLocal extends LanguageRepository {
  final SharedPreferencesService _sharedPreferencesService;

  LanguageRepositoryLocal(
      {required SharedPreferencesService sharedPreferencesService})
      : _sharedPreferencesService = sharedPreferencesService {
    _loadLanguage();
  }

  Language _currentLanguage = Language(code: 'en', name: 'English');

  Future<void> _loadLanguage() async {
    final code = await _sharedPreferencesService.getPreferredLanguageCode();
    _currentLanguage = Language(
      code: code,
      name: code == 'en' ? 'English' : 'Русский',
    );
    notifyListeners();
  }

  @override
  void setLanguage(String languageCode) {
    _currentLanguage = Language(
      code: languageCode,
      name: languageCode == 'en' ? 'English' : 'Русский',
    );
    _sharedPreferencesService.setPreferredLanguageCode(languageCode);
    notifyListeners();
  }

  @override
  Future<void> toggleLocale() async {
    _currentLanguage = _currentLanguage.code == 'en'
        ? Language(code: 'ru', name: 'Русский')
        : Language(code: 'en', name: 'English');
    await _sharedPreferencesService.setPreferredLanguageCode(_currentLanguage.code);
    notifyListeners();
  }
  
  @override
  Language get currentLanguage => _currentLanguage;
}
