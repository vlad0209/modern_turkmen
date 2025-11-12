import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modern_turkmen/data/services/shared_preferences_service.dart';

void main() {
  group('SharedPreferencesService', () {
    late SharedPreferencesService service;

    setUp(() {
      service = SharedPreferencesService();
    });

    tearDown(() async {
      SharedPreferences.setMockInitialValues({});
    });

    group('getPreferredLanguageCode', () {
      test('returns stored language code when available', () async {
        SharedPreferences.setMockInitialValues({'preferred_language': 'ru'});
        
        final result = await service.getPreferredLanguageCode();
        
        expect(result, 'ru');
      });

      test('returns "en" when stored code is not supported', () async {
        SharedPreferences.setMockInitialValues({'preferred_language': 'unsupported'});
        
        final result = await service.getPreferredLanguageCode();
        
        expect(result, 'en');
      });

      test('returns "en" when no preference stored and locale not supported', () async {
        SharedPreferences.setMockInitialValues({});
        
        final result = await service.getPreferredLanguageCode();
        
        expect(result, 'en');
      });
    });

    group('bookmarkTutorial', () {
      test('stores tutorial ID in preferences', () async {
        SharedPreferences.setMockInitialValues({});
        
        await service.bookmarkTutorial('tutorial_123');
        
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getString('bookmarked_tutorial'), 'tutorial_123');
      });
    });

    group('setPreferredLanguageCode', () {
      test('stores language code in preferences', () async {
        SharedPreferences.setMockInitialValues({});
        
        await service.setPreferredLanguageCode('tk');
        
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getString('preferred_language'), 'tk');
      });
    });

    group('getBookmarkedTutorialId', () {
      test('returns stored tutorial ID when available', () async {
        SharedPreferences.setMockInitialValues({'bookmarked_tutorial': 'tutorial_456'});
        
        final result = await service.getBookmarkedTutorialId();
        
        expect(result, 'tutorial_456');
      });

      test('returns null when no tutorial bookmarked', () async {
        SharedPreferences.setMockInitialValues({});
        
        final result = await service.getBookmarkedTutorialId();
        
        expect(result, isNull);
      });
    });

    group('isFirstLaunch', () {
      test('returns true when app has not launched before', () async {
        SharedPreferences.setMockInitialValues({});
        
        final result = await service.isFirstLaunch();
        
        expect(result, isTrue);
      });

      test('returns false when app has launched before', () async {
        SharedPreferences.setMockInitialValues({'has_launched_before': true});
        
        final result = await service.isFirstLaunch();
        
        expect(result, isFalse);
      });
    });

    group('setOnboardingCompleted', () {
      test('sets has_launched_before to true', () async {
        SharedPreferences.setMockInitialValues({});
        
        await service.setOnboardingCompleted();
        
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getBool('has_launched_before'), isTrue);
      });
    });
  });
}