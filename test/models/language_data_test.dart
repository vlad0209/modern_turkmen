import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modern_turkmen/models/language_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'language_data_test.mocks.dart';

@GenerateMocks([SharedPreferences])

void main() {
  late MockSharedPreferences mockPrefs;
  late LanguageData languageData;

  setUp(() {
    mockPrefs = MockSharedPreferences();
    languageData = LanguageData(prefs: mockPrefs);
  });

  test('locale getter returns correct value', () {
    expect(languageData.locale, null);
    const testLocale = Locale('en');
    when(mockPrefs.setString('languageCode', testLocale.languageCode))
        .thenAnswer((_) async => true);
    languageData.locale = testLocale;
    expect(languageData.locale, testLocale);
  });

  test('locale setter saves to SharedPreferences and notifies listeners', () {
    const testLocale = Locale('en');

    // Mock SharedPreferences method
    when(mockPrefs.setString('languageCode', testLocale.languageCode))
        .thenAnswer((_) async => true);

    bool isNotified = false;
    languageData.addListener(() {
      isNotified = true;
    });

    languageData.locale = testLocale;

    verify(mockPrefs.setString('languageCode', testLocale.languageCode))
        .called(1);
    expect(languageData.locale, testLocale);
    expect(isNotified, true);
  });

  test('toggleLocale switches between ru and en and saves to SharedPreferences', () {
    const localeRu = Locale('ru');
    const localeEn = Locale('en');

    // Mock SharedPreferences method
    when(mockPrefs.setString(any, any))
        .thenAnswer((_) async => true);

    languageData.locale = localeRu;

    bool isNotified = false;
    languageData.addListener(() {
      isNotified = true;
    });

    languageData.toggleLocale();
    verify(mockPrefs.setString('languageCode', localeEn.languageCode)).called(1);
    expect(languageData.locale, localeEn);
    expect(isNotified, true);

    isNotified = false;
    languageData.toggleLocale();
    verify(mockPrefs.setString('languageCode', localeRu.languageCode)).called(2);
    expect(languageData.locale, localeRu);
    expect(isNotified, true);
  });
}
