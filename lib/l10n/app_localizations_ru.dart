// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get chooseLanguage => 'Выберите ваш основной язык';

  @override
  String get modernTurkmen => 'Современный туркменский';

  @override
  String get prevTutorial => 'Предыдущий';

  @override
  String get nextTutorial => 'Следующий';

  @override
  String get startExercise => 'Начать упражнение';

  @override
  String get example => 'Пример';

  @override
  String get choose => 'Выберите';

  @override
  String get wrongTry => 'Неправильно! Попробуйте еще раз';

  @override
  String get correct => 'Правильно!';

  @override
  String get excellent => 'Отлично!';

  @override
  String get good => 'Хорошо!';

  @override
  String get satisfactory => 'Удовлитворительно';

  @override
  String get bad => 'Плохо';

  @override
  String get yourResult => 'Ваш результат';

  @override
  String get buttonContinue => 'Продолжить';

  @override
  String correctAt(int percent) {
    return 'Правильно на $percent%';
  }

  @override
  String get exercise => 'Упражнение';
}
