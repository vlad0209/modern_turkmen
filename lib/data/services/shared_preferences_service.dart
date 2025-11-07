import 'package:flutter/foundation.dart';
import 'package:modern_turkmen/config/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {

  Future<String> getPreferredLanguageCode() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString('preferred_language') ?? PlatformDispatcher.instance.locale.languageCode.split('_').first;
    return AppConstants.supportedLanguageCodes.contains(code) ? code : 'en'; 
  }

  void bookmarkTutorial(String tutorialId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('bookmarked_tutorial', tutorialId);
  }
}