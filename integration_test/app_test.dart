import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modern_turkmen/main.dart' as app;
import 'package:modern_turkmen/ui/widgets/welcome_screen.dart';
import 'package:modern_turkmen/ui/widgets/contents_table_screen.dart';
import 'package:modern_turkmen/ui/widgets/tutorial_screen.dart';
import 'package:modern_turkmen/ui/widgets/exercise_screen.dart';
import 'package:modern_turkmen/ui/widgets/language_select.dart';
import 'package:modern_turkmen/ui/widgets/content_menu_item.dart';
import 'package:modern_turkmen/ui/widgets/word_card.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Modern Turkmen App Integration Tests', () {
    testWidgets('should initialize app and reach welcome screen',
        (WidgetTester tester) async {
      // Initialize the app
      app.main();

      // Wait for app to fully load
      await tester.pumpAndSettle();

      // Should reach the welcome screen or contents table (depending on first time user)
      expect(
          find.byType(WelcomeScreen).evaluate().isNotEmpty ||
              find.byType(ContentsTableScreen).evaluate().isNotEmpty,
          isTrue,
          reason: 'App should load to either welcome screen or contents table');
    });

    testWidgets('First time user onboarding flow', (tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();

      // Wait for Firebase initialization and app loading
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Should show welcome screen for first-time user
      expect(find.byType(WelcomeScreen), findsOneWidget);

      // Should show language selection
      expect(find.byType(LanguageSelect), findsOneWidget);
      expect(find.text('English'), findsOneWidget);
      expect(find.text('Русский'), findsOneWidget);

      // Select English language
      final englishButton = find.text('English');
      await tester.tap(englishButton);
      await tester.pumpAndSettle();

      // Should navigate to contents table screen
      expect(find.byType(ContentsTableScreen), findsOneWidget);
    });

    testWidgets('Returning user should skip onboarding', (tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();

      // Wait for Firebase initialization and app loading
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Should skip welcome screen and go directly to contents table
      expect(find.byType(ContentsTableScreen), findsOneWidget);
      expect(find.byType(WelcomeScreen), findsNothing);
    });

    testWidgets('Contents table screen functionality', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Complete onboarding if needed
      await _completeOnboardingIfNeeded(tester);

      // Should be on contents table screen
      expect(find.byType(ContentsTableScreen), findsOneWidget);

      // Wait for tutorials to load
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Should have app bar with language selection button
      expect(find.byType(AppBar), findsOneWidget);

      // Should show tutorial grid
      expect(find.byType(GridView), findsOneWidget);

      // Check if tutorials loaded (look for content menu items)
      final contentMenuItems = find.byType(ContentMenuItem);
      // Tap on first tutorial
      await tester.tap(contentMenuItems.first);
      await tester.pumpAndSettle();

      // Should navigate to tutorial screen
      expect(find.byType(TutorialScreen), findsOneWidget);
    });

    testWidgets('Tutorial screen functionality', (tester) async {
      SharedPreferences.setMockInitialValues({
        'has_launched_before':
            false, // User has launched app before (not first time)
        'preferred_language': 'en', // English as default language
        // Note: 'bookmarked_tutorial' key is omitted to simulate no bookmark
      });
      app.main();
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 5));

      await _completeOnboardingIfNeeded(tester);
      await _navigateToSecondTutorial(tester);

      // Should show main layout with tutorial content
      expect(find.byType(TutorialScreen), findsOneWidget);

      // Look for tutorial elements
      final tutorialTitle = find.byType(AppBar).evaluate();
      expect(tutorialTitle.isNotEmpty, isTrue,
          reason: 'Tutorial should have a title');

      // Look for "Start exercise" button if available
      // Scroll to find the button
      await tester.dragUntilVisible(
        find.text('Start exercise'),
        find.byType(SingleChildScrollView),
        const Offset(0, -100),
      );
      final startExerciseButton = find.text('Start exercise');

      await tester.tap(startExerciseButton);
      await tester.pumpAndSettle();

      // Should navigate to exercise screen
      expect(find.byType(ExerciseScreen), findsOneWidget);
    });

    testWidgets('Exercise screen basic functionality', (tester) async {
      SharedPreferences.setMockInitialValues({
        'has_launched_before':
            false, // User has launched app before (not first time)
        'preferred_language': 'en', // English as default language
        // Note: 'bookmarked_tutorial' key is omitted to simulate no bookmark
      });
      
      app.main();
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 5));

      await _completeOnboardingIfNeeded(tester);
      await _navigateToSecondTutorial(tester);
      // Look for "Start exercise" button if available
      // Scroll to find the button
      await tester.dragUntilVisible(
        find.text('Start exercise'),
        find.byType(SingleChildScrollView),
        const Offset(0, -100),
      );
      // Try to start an exercise
      final startExerciseButton = find.text('Start exercise');
      await tester.tap(startExerciseButton);
      await tester.pumpAndSettle();
      expect(find.byType(ExerciseScreen), findsOneWidget);
      expect(find.byType(WordCard), findsAtLeastNWidgets(1));
    });

    testWidgets('Language switching functionality', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 5));

      await _completeOnboardingIfNeeded(tester);

      // Look for language selection button in app bar
      final languageButton = find.byType(IconButton);
      if (languageButton.evaluate().isNotEmpty) {
        // Tap language selection button
        await tester.tap(languageButton.first);
        await tester.pumpAndSettle(const Duration(seconds: 2));

        // Should still be on contents table (after language switch and refresh)
        expect(find.byType(ContentsTableScreen), findsOneWidget);
      }
    });

    testWidgets('App remembers Russian language preference', (tester) async {
      // Set Russian as preferred language
      SharedPreferences.setMockInitialValues({
        'has_launched_before': true,
        'preferred_language': 'ru',
      });

      app.main();
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Should load with Russian language preference
      expect(find.byType(ContentsTableScreen), findsOneWidget);

      // App should be using Russian language (we can't easily test text here
      // since we'd need the actual localization, but the app should initialize
      // with the correct language from SharedPreferences)
    });

    testWidgets('Home navigation functionality', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 5));

      await _completeOnboardingIfNeeded(tester);
      await _navigateToSecondTutorial(tester);

      final homeButton = find.byIcon(Icons.home);
      await tester.tap(homeButton);
      await tester.pumpAndSettle();

      // Should navigate back to contents table
      expect(find.byType(ContentsTableScreen), findsOneWidget);
    });
  });
}

/// Helper function to complete onboarding if welcome screen is shown
Future<void> _completeOnboardingIfNeeded(WidgetTester tester) async {
  if (find.byType(WelcomeScreen).evaluate().isNotEmpty) {
    final englishButton = find.text('English');
    if (englishButton.evaluate().isNotEmpty) {
      await tester.tap(englishButton);
      await tester.pumpAndSettle();
    }
  }
}

/// Helper function to navigate to first tutorial
Future<void> _navigateToSecondTutorial(WidgetTester tester) async {
  // Wait for contents to load
  await tester.pumpAndSettle(const Duration(seconds: 3));

  // Find and tap on first tutorial
  final contentMenuItems = find.byType(ContentMenuItem);
  await tester.tap(contentMenuItems.at(1));
  await tester.pumpAndSettle();
}
