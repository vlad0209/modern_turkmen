import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/view_models/language_view_model.dart';

void main() {
  group('LanguageViewModel', () {
    late LanguageViewModel viewModel;

    setUp(() {
      viewModel = LanguageViewModel();
    });

    test('initial language should be default', () {
      expect(viewModel.currentLanguage, equals('default_language'));
    });

    test('changeLanguage should update currentLanguage', () {
      viewModel.changeLanguage('new_language');
      expect(viewModel.currentLanguage, equals('new_language'));
    });

    test('getAvailableLanguages should return a list of languages', () {
      final languages = viewModel.getAvailableLanguages();
      expect(languages, isNotEmpty);
    });
  });
}