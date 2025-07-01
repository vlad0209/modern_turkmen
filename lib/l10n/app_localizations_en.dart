// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get chooseLanguage => 'Choose your primary language.';

  @override
  String get modernTurkmen => 'Modern Turkmen';

  @override
  String get prevTutorial => 'Prev';

  @override
  String get nextTutorial => 'Next';

  @override
  String get startExercise => 'Start exercise';

  @override
  String get example => 'Example';

  @override
  String get choose => 'Choose';

  @override
  String get wrongTry => 'Wrong! Try again';

  @override
  String get correct => 'Correct!';

  @override
  String get excellent => 'Excellent!';

  @override
  String get good => 'Good!';

  @override
  String get satisfactory => 'Satisfactory';

  @override
  String get bad => 'Bad';

  @override
  String get yourResult => 'Your result';

  @override
  String get buttonContinue => 'Continue';

  @override
  String correctAt(int percent) {
    return '$percent% correct';
  }

  @override
  String get exercise => 'Exercise';
}
