// ignore_for_file: scoped_providers_should_specify_dependencies
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modern_turkmen/config/dependencies.dart';
import 'package:modern_turkmen/data/repositories/language/language_repository.dart';
import 'package:modern_turkmen/data/repositories/onboarding/onboarding_repository.dart';
import 'package:modern_turkmen/domain/models/language.dart';
import 'package:modern_turkmen/l10n/app_localizations.dart';
import 'package:modern_turkmen/ui/widgets/language_select.dart';
import 'package:modern_turkmen/ui/widgets/welcome_screen.dart';

import 'welcome_screen_test.mocks.dart';

@GenerateMocks([LanguageRepository, OnboardingRepository])

void main() {
  group('WelcomeScreen', () {
    late MockLanguageRepository mockLanguageRepository;
    late MockOnboardingRepository mockOnboardingRepository;

    setUp(() {
      mockLanguageRepository = MockLanguageRepository();
      mockOnboardingRepository = MockOnboardingRepository();
      
      // Set up default behavior
      when(mockLanguageRepository.currentLanguage)
          .thenReturn(Language(code: 'en', name: 'English'));
      when(mockLanguageRepository.setLanguage(any)).thenAnswer((_) async => {});
      when(mockOnboardingRepository.completeOnboarding()).thenAnswer((_) async => {});
    });

    Widget createTestWidget() {
      return ProviderScope(
        overrides: [
          languageRepositoryProvider.overrideWithValue(mockLanguageRepository),
          onboardingRepositoryProvider.overrideWithValue(mockOnboardingRepository),
        ],
        child: MaterialApp.router(
          routerConfig: GoRouter(
            routes: [
              GoRoute(
                path: '/welcome',
                builder: (context, state) => const WelcomeScreen(),
              ),
              GoRoute(
                path: '/',
                builder: (context, state) => const Scaffold(body: Text('Home')),
              ),
            ],
            initialLocation: '/welcome',
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      );
    }

    testWidgets('should render WelcomeScreen with LanguageSelect widget', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(WelcomeScreen), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(SafeArea), findsOneWidget);
      expect(find.byType(LanguageSelect), findsOneWidget);
    });

    testWidgets('should have correct widget structure', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.body, isA<SafeArea>());
    });
  });
}