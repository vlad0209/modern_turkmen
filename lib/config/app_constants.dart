import 'package:flutter/widgets.dart';

abstract class AppConstants {
  static const List<String> supportedLanguageCodes = ['en', 'ru'];

  static final TextStyle kButtonTextStyle = TextStyle();

  static final kBoldTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );
}
