import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageData extends ChangeNotifier {
  Locale? _locale;
 

  Locale? get locale {
    return _locale;
  }

  set locale(Locale? value) {
    _locale = value;
    _saveLocale();
    notifyListeners();
  }

  Future<void> _saveLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('languageCode', _locale!.languageCode);
  }

  void toggleLocale() {
    _locale = _locale!.languageCode == 'ru' ? const Locale('en') : const Locale('ru');
    _saveLocale();
    notifyListeners();
  }
}