import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/screens/result_screen.dart';
import 'package:modern_turkmen/l10n/app_localizations.dart';
import 'package:modern_turkmen/screens/exercise_screen.dart';
import 'package:modern_turkmen/screens/tutorial_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';


void main() {
  final fakeFirestore = FakeFirebaseFirestore();
  fakeFirestore.doc('tutorials/tutorial1').set({
      'public_en': true,
      'index': 1,
      'title_en': 'Tutorial 1',
      'thumb_url': 'https://example.com/thumb.jpg'
    });
  fakeFirestore.doc('tutorials/tutorial2').set({
      'public_en': true,
      'index': 2,
      'title_en': 'Tutorial 2',
      'thumb_url': 'https://example.com/thumb.jpg'
    });
    
  Widget createWidgetUnderTest({
    required int solvedItemsCount,
    required int notSolvedItemsCount,
    required String tutorialId,
    String? nextExerciseId,
    String? nextTutorialId,
  }) {
    return Provider<FirebaseFirestore>(
      create: (context) => fakeFirestore,
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English
        ],
        home: ResultScreen(
          solvedItemsCount: solvedItemsCount,
          notSolvedItemsCount: notSolvedItemsCount,
          tutorialId: tutorialId,
          nextExerciseId: nextExerciseId,
          nextTutorialId: nextTutorialId,
        ),
      ),
    );
  }

  testWidgets('ResultScreen displays correct rate and counts', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(
      solvedItemsCount: 8,
      notSolvedItemsCount: 2,
      tutorialId: 'tutorial1',
    ));

    expect(find.text('Excellent!'), findsOneWidget);
    expect(find.text('8'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
  });

  testWidgets('ResultScreen navigates to ExerciseScreen when nextExerciseId is provided', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(
      solvedItemsCount: 8,
      notSolvedItemsCount: 2,
      tutorialId: 'tutorial1',
      nextExerciseId: 'exercise2',
    ));

    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    expect(find.byType(ExerciseScreen), findsOneWidget);
  });

  testWidgets('ResultScreen navigates to next TutorialScreen when nextTutorialId is provided', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(
      solvedItemsCount: 8,
      notSolvedItemsCount: 2,
      tutorialId: 'tutorial1',
      nextTutorialId: 'tutorial2',
    ));

    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    expect(find.byType(TutorialScreen), findsOneWidget);
  });

  testWidgets('ResultScreen navigates to current TutorialScreen when no nextExerciseId or nextTutorialId is provided', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest(
      solvedItemsCount: 8,
      notSolvedItemsCount: 2,
      tutorialId: 'tutorial1',
    ));

    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    expect(find.byType(TutorialScreen), findsOneWidget);
  });
}
