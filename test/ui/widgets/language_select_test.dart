// ignore_for_file: scoped_providers_should_specify_dependencies
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modern_turkmen/l10n/app_localizations.dart';
import 'package:modern_turkmen/config/dependencies.dart';
import 'package:modern_turkmen/data/repositories/language/language_repository.dart';
import 'package:modern_turkmen/data/repositories/onboarding/onboarding_repository.dart';
import 'package:modern_turkmen/domain/models/language.dart';
import 'package:modern_turkmen/ui/widgets/language_select.dart';

import 'language_select_test.mocks.dart';

@GenerateMocks([LanguageRepository, OnboardingRepository, GoRouter])
void main() {
  late MockLanguageRepository mockLanguageRepository;
  late MockOnboardingRepository mockOnboardingRepository;

  setUp(() {
    mockLanguageRepository = MockLanguageRepository();
    mockOnboardingRepository = MockOnboardingRepository();
    
    // Set up default behavior
    when(mockLanguageRepository.currentLanguage)
        .thenReturn(Language(code: 'en', name: 'English'));
  });

  Widget createTestWidget({Function? callback}) {
    return ProviderScope(
      overrides: [
        languageRepositoryProvider.overrideWithValue(mockLanguageRepository),
        onboardingRepositoryProvider.overrideWithValue(mockOnboardingRepository),
      ],
      child: MaterialApp.router(
        routerConfig: GoRouter(routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => Scaffold(
              body: LanguageSelect(callback: callback),
            ),
          ),
        ]),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }

  group('LanguageSelect Widget Tests', () {
    testWidgets('should display language selection UI elements', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Choose your primary language.'), findsOneWidget);
      expect(find.text('English'), findsOneWidget);
      expect(find.text('Русский'), findsOneWidget);
      expect(find.byType(MaterialButton), findsNWidgets(2));
    });

    testWidgets('should call setLanguage with "en" when English button is pressed', (tester) async {
      when(mockLanguageRepository.setLanguage('en')).thenAnswer((_) async => {});
      when(mockOnboardingRepository.completeOnboarding()).thenAnswer((_) async => {});

      bool callbackCalled = false;
      void testCallback() {
        callbackCalled = true;
      }

      await tester.pumpWidget(createTestWidget(callback: testCallback));
      await tester.pumpAndSettle();

      await tester.tap(find.text('English'));
      await tester.pumpAndSettle();

      verify(mockLanguageRepository.setLanguage('en')).called(1);
      verify(mockOnboardingRepository.completeOnboarding()).called(1);
      expect(callbackCalled, isTrue);
    });

    testWidgets('should call setLanguage with "ru" when Russian button is pressed', (tester) async {
      when(mockLanguageRepository.setLanguage('ru')).thenAnswer((_) async => {});
      when(mockOnboardingRepository.completeOnboarding()).thenAnswer((_) async => {});

      bool callbackCalled = false;
      void testCallback() {
        callbackCalled = true;
      }

      await tester.pumpWidget(createTestWidget(callback: testCallback));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Русский'));
      await tester.pumpAndSettle();

      verify(mockLanguageRepository.setLanguage('ru')).called(1);
      verify(mockOnboardingRepository.completeOnboarding()).called(1);
      expect(callbackCalled, isTrue);
    });

    testWidgets('should call callback when provided and English button is pressed', (tester) async {
      bool callbackCalled = false;
      void testCallback() {
        callbackCalled = true;
      }

      when(mockLanguageRepository.setLanguage('en')).thenAnswer((_) async => {});
      when(mockOnboardingRepository.completeOnboarding()).thenAnswer((_) async => {});

      await tester.pumpWidget(createTestWidget(callback: testCallback));
      await tester.pumpAndSettle();

      await tester.tap(find.text('English'));
      await tester.pumpAndSettle();

      expect(callbackCalled, isTrue);
    });

    testWidgets('should call callback when provided and Russian button is pressed', (tester) async {
      bool callbackCalled = false;
      void testCallback() {
        callbackCalled = true;
      }

      when(mockLanguageRepository.setLanguage('ru')).thenAnswer((_) async => {});
      when(mockOnboardingRepository.completeOnboarding()).thenAnswer((_) async => {});

      await tester.pumpWidget(createTestWidget(callback: testCallback));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Русский'));
      await tester.pumpAndSettle();

      expect(callbackCalled, isTrue);
    });
  });
}