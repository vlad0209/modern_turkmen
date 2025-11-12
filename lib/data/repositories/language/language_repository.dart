import 'package:flutter/widgets.dart';

import '../../../domain/models/language.dart';

abstract class LanguageRepository extends ChangeNotifier {

  Language get currentLanguage;

  Future<void> setLanguage(String languageCode);

  Future<void> toggleLocale();
}