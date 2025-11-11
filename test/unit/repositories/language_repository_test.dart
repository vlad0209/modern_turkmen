import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/repositories/language_repository.dart';

void main() {
  group('LanguageRepository', () {
    late LanguageRepository languageRepository;

    setUp(() {
      languageRepository = LanguageRepository();
    });

    test('should return a list of languages', () async {
      final languages = await languageRepository.getLanguages();
      expect(languages, isA<List<String>>());
    });

    test('should add a language', () async {
      await languageRepository.addLanguage('Turkmen');
      final languages = await languageRepository.getLanguages();
      expect(languages, contains('Turkmen'));
    });

    test('should remove a language', () async {
      await languageRepository.addLanguage('Turkmen');
      await languageRepository.removeLanguage('Turkmen');
      final languages = await languageRepository.getLanguages();
      expect(languages, isNot(contains('Turkmen')));
    });
  });
}