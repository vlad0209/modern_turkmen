import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/services/shared_preferences_service.dart';

void main() {
  group('SharedPreferencesService', () {
    late SharedPreferencesService sharedPreferencesService;

    setUp(() {
      sharedPreferencesService = SharedPreferencesService();
    });

    test('should save and retrieve a string value', () async {
      await sharedPreferencesService.saveString('key', 'value');
      final result = await sharedPreferencesService.getString('key');
      expect(result, 'value');
    });

    test('should return null for a non-existent key', () async {
      final result = await sharedPreferencesService.getString('non_existent_key');
      expect(result, isNull);
    });

    test('should save and retrieve a boolean value', () async {
      await sharedPreferencesService.saveBool('boolKey', true);
      final result = await sharedPreferencesService.getBool('boolKey');
      expect(result, true);
    });
  });
}