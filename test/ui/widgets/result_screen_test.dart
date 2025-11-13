import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:modern_turkmen/ui/widgets/result_screen.dart';
import 'package:modern_turkmen/l10n/app_localizations.dart';

void main() {
  group('ResultParams', () {
    test('should create ResultParams with required parameters', () {
      final params = ResultParams(
        solvedItemsCount: 8,
        notSolvedItemsCount: 2,
        tutorialId: 'tutorial1',
      );

      expect(params.solvedItemsCount, 8);
      expect(params.notSolvedItemsCount, 2);
      expect(params.tutorialId, 'tutorial1');
      expect(params.nextExerciseId, isNull);
      expect(params.nextTutorialId, isNull);
    });

    test('should create ResultParams with optional parameters', () {
      final params = ResultParams(
        solvedItemsCount: 5,
        notSolvedItemsCount: 5,
        tutorialId: 'tutorial1',
        nextExerciseId: 'exercise1',
        nextTutorialId: 'tutorial2',
      );

      expect(params.nextExerciseId, 'exercise1');
      expect(params.nextTutorialId, 'tutorial2');
    });
  });

  group('ResultScreen', () {

    Widget createTestWidget(ResultScreen screen) {
      return MaterialApp.router(
        routerConfig: GoRouter(routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => screen,
          ),
        ]),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      );
    }

    testWidgets('should display excellent rating for 80% or above', (WidgetTester tester) async {
      const screen = ResultScreen(
        solvedItemsCount: 8,
        notSolvedItemsCount: 2,
        tutorialId: 'tutorial1',
      );

      await tester.pumpWidget(createTestWidget(screen));
      await tester.pumpAndSettle();
      
      expect(find.text('Excellent!'), findsOneWidget);
      expect(find.text('8'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.text('80% correct'), findsOneWidget);
    });

    testWidgets('should display good rating for 60-79%', (WidgetTester tester) async {
      const screen = ResultScreen(
        solvedItemsCount: 7,
        notSolvedItemsCount: 3,
        tutorialId: 'tutorial1',
      );

      await tester.pumpWidget(createTestWidget(screen));
      await tester.pumpAndSettle();
      
      expect(find.text('Good!'), findsOneWidget);
      expect(find.text('70% correct'), findsOneWidget);
    });

    testWidgets('should display satisfactory rating for 40-59%', (WidgetTester tester) async {
      const screen = ResultScreen(
        solvedItemsCount: 5,
        notSolvedItemsCount: 5,
        tutorialId: 'tutorial1',
      );

      await tester.pumpWidget(createTestWidget(screen));
      await tester.pumpAndSettle();
      
      expect(find.text('Satisfactory'), findsOneWidget);
      expect(find.text('50% correct'), findsOneWidget);
    });

    testWidgets('should display bad rating for below 40%', (WidgetTester tester) async {
      const screen = ResultScreen(
        solvedItemsCount: 2,
        notSolvedItemsCount: 8,
        tutorialId: 'tutorial1',
      );

      await tester.pumpWidget(createTestWidget(screen));
      await tester.pumpAndSettle();
      
      expect(find.text('Bad'), findsOneWidget);
      expect(find.text('20% correct'), findsOneWidget);
    });

    testWidgets('should navigate to next exercise when nextExerciseId is provided', (WidgetTester tester) async {
      const screen = ResultScreen(
        solvedItemsCount: 8,
        notSolvedItemsCount: 2,
        tutorialId: 'tutorial1',
        nextExerciseId: 'exercise1',
      );

      await tester.pumpWidget(createTestWidget(screen));
      await tester.pumpAndSettle();
      
      expect(find.text('Continue'), findsOneWidget);
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();
      
      // Note: In a real test, we would verify navigation by checking the current route
      // For now, we just verify the button exists and can be tapped
    });

    testWidgets('should navigate to next tutorial when nextTutorialId is provided', (WidgetTester tester) async {
      const screen = ResultScreen(
        solvedItemsCount: 8,
        notSolvedItemsCount: 2,
        tutorialId: 'tutorial1',
        nextTutorialId: 'tutorial2',
      );

      await tester.pumpWidget(createTestWidget(screen));
      await tester.pumpAndSettle();
      
      expect(find.text('Continue'), findsOneWidget);
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();
      
      // Note: In a real test, we would verify navigation by checking the current route
      // For now, we just verify the button exists and can be tapped
    });

    testWidgets('should navigate back to current tutorial when no next options', (WidgetTester tester) async {
      const screen = ResultScreen(
        solvedItemsCount: 8,
        notSolvedItemsCount: 2,
        tutorialId: 'tutorial1',
      );

      await tester.pumpWidget(createTestWidget(screen));
      await tester.pumpAndSettle();
      
      expect(find.text('Continue'), findsOneWidget);
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();
      
      // Note: In a real test, we would verify navigation by checking the current route
      // For now, we just verify the button exists and can be tapped
    });
  });
}