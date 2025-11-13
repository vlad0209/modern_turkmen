import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/utils/localizer.dart';

class TestLocalizer with Localizer {}

void main() {
  group('Localizer', () {
    late TestLocalizer localizer;

    setUp(() {
      localizer = TestLocalizer();
    });

    test('should return localized field for given language code', () {
      final data = {
        'title_tk': 'Türkmen ady',
        'title_en': 'English title',
      };

      final result = localizer.localizeField('tk', data, 'title');

      expect(result, equals('Türkmen ady'));
    });

    test('should fallback to English when language code not found', () {
      final data = {
        'title_en': 'English title',
      };

      final result = localizer.localizeField('tk', data, 'title');

      expect(result, equals('English title'));
    });

    test('should return empty string when neither language nor English found', () {
      final data = {
        'description_ru': 'Russian description',
      };

      final result = localizer.localizeField('tk', data, 'title');

      expect(result, equals(''));
    });

    test('should return empty string when field does not exist', () {
      final data = <String, dynamic>{};

      final result = localizer.localizeField('tk', data, 'title');

      expect(result, equals(''));
    });

    test('should handle null values in data', () {
      final data = {
        'title_tk': null,
        'title_en': 'English title',
      };

      final result = localizer.localizeField('tk', data, 'title');

      expect(result, equals('English title'));
    });

    test('should handle empty language code', () {
      final data = {
        'title_': 'Empty lang title',
        'title_en': 'English title',
      };

      final result = localizer.localizeField('', data, 'title');

      expect(result, equals('Empty lang title'));
    });
  });
}