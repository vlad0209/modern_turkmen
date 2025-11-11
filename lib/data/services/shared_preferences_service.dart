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

  Future<void> setPreferredLanguageCode(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('preferred_language', languageCode);
  }
  
  Future<String?> getBookmarkedTutorialId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('bookmarked_tutorial');
  }

  Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('has_launched_before') != true;
  }

  Future<void> setOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('has_launched_before', true);
  }
}