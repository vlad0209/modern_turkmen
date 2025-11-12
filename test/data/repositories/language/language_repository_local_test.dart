import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modern_turkmen/data/repositories/language/language_repository_local.dart';
import 'package:modern_turkmen/data/services/shared_preferences_service.dart';

import 'language_repository_local_test.mocks.dart';

@GenerateMocks([SharedPreferencesService])
void main() {
  late LanguageRepositoryLocal repository;
  late MockSharedPreferencesService mockSharedPreferencesService;

  setUp(() {
    mockSharedPreferencesService = MockSharedPreferencesService();
  });

  group('LanguageRepositoryLocal', () {
    test('should initialize with English as default language', () async {
      when(mockSharedPreferencesService.getPreferredLanguageCode())
          .thenAnswer((_) async => 'en');

      repository = LanguageRepositoryLocal(
        sharedPreferencesService: mockSharedPreferencesService,
      );

      await Future.delayed(Duration.zero); // Wait for _loadLanguage to complete

      expect(repository.currentLanguage.code, 'en');
      expect(repository.currentLanguage.name, 'English');
    });

    test('should load Russian language from shared preferences', () async {
      when(mockSharedPreferencesService.getPreferredLanguageCode())
          .thenAnswer((_) async => 'ru');

      repository = LanguageRepositoryLocal(
        sharedPreferencesService: mockSharedPreferencesService,
      );

      await Future.delayed(Duration.zero); // Wait for _loadLanguage to complete

      expect(repository.currentLanguage.code, 'ru');
      expect(repository.currentLanguage.name, 'Русский');
    });

    test('should set language to English and save to preferences', () async {
      when(mockSharedPreferencesService.getPreferredLanguageCode())
          .thenAnswer((_) async => 'ru');
      when(mockSharedPreferencesService.setPreferredLanguageCode('en'))
          .thenAnswer((_) async {});

      repository = LanguageRepositoryLocal(
        sharedPreferencesService: mockSharedPreferencesService,
      );
      await Future.delayed(Duration.zero); // Wait for _loadLanguage to complete

      await repository.setLanguage('en');

      expect(repository.currentLanguage.code, 'en');
      expect(repository.currentLanguage.name, 'English');
      verify(mockSharedPreferencesService.setPreferredLanguageCode('en')).called(1);
    });

    test('should set language to Russian and save to preferences', () async {
      when(mockSharedPreferencesService.getPreferredLanguageCode())
          .thenAnswer((_) async => 'en');
      when(mockSharedPreferencesService.setPreferredLanguageCode('ru'))
          .thenAnswer((_) async {});

      repository = LanguageRepositoryLocal(
        sharedPreferencesService: mockSharedPreferencesService,
      );
      await Future.delayed(Duration.zero); // Wait for _loadLanguage to complete

      await repository.setLanguage('ru');

      expect(repository.currentLanguage.code, 'ru');
      expect(repository.currentLanguage.name, 'Русский');
      verify(mockSharedPreferencesService.setPreferredLanguageCode('ru')).called(1);
    });

    test('should toggle from English to Russian', () async {
      when(mockSharedPreferencesService.getPreferredLanguageCode())
          .thenAnswer((_) async => 'en');
      when(mockSharedPreferencesService.setPreferredLanguageCode('ru'))
          .thenAnswer((_) async {});

      repository = LanguageRepositoryLocal(
        sharedPreferencesService: mockSharedPreferencesService,
      );
      await Future.delayed(Duration.zero); // Wait for _loadLanguage to complete

      await repository.toggleLocale();

      expect(repository.currentLanguage.code, 'ru');
      expect(repository.currentLanguage.name, 'Русский');
      verify(mockSharedPreferencesService.setPreferredLanguageCode('ru')).called(1);
    });

    test('should toggle from Russian to English', () async {
      when(mockSharedPreferencesService.getPreferredLanguageCode())
          .thenAnswer((_) async => 'ru');
      when(mockSharedPreferencesService.setPreferredLanguageCode('en'))
          .thenAnswer((_) async {});

      repository = LanguageRepositoryLocal(
        sharedPreferencesService: mockSharedPreferencesService,
      );

      await Future.delayed(Duration.zero); // Wait for _loadLanguage to complete
      await repository.toggleLocale();

      expect(repository.currentLanguage.code, 'en');
      expect(repository.currentLanguage.name, 'English');
      verify(mockSharedPreferencesService.setPreferredLanguageCode('en')).called(1);
    });
  });
}