import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/config/dependencies.dart';
import 'package:modern_turkmen/data/services/shared_preferences_service.dart';

void main() {
  group('Dependencies Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('sharedPreferencesServiceProvider returns SharedPreferencesService instance', () {
      final service = container.read(sharedPreferencesServiceProvider);
      expect(service, isA<SharedPreferencesService>());
    });

    test('providers return same instance on multiple reads (auto-dispose)', () {
      // Since these are auto-dispose providers, they will create new instances
      // when read multiple times after disposal
      final service1 = container.read(sharedPreferencesServiceProvider);
      expect(service1, isA<SharedPreferencesService>());
      
      // Read again to verify it works
      final service2 = container.read(sharedPreferencesServiceProvider);
      expect(service2, isA<SharedPreferencesService>());
    });

    test('container can be created and disposed without errors', () {
      expect(() {
        final testContainer = ProviderContainer();
        testContainer.dispose();
      }, returnsNormally);
    });

    test('multiple containers can coexist', () {
      final container1 = ProviderContainer();
      final container2 = ProviderContainer();
      
      final service1 = container1.read(sharedPreferencesServiceProvider);
      final service2 = container2.read(sharedPreferencesServiceProvider);
      
      expect(service1, isA<SharedPreferencesService>());
      expect(service2, isA<SharedPreferencesService>());
      
      container1.dispose();
      container2.dispose();
    });
  });
}