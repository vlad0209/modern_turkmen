import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/screens/exercise_screen.dart';
import 'package:modern_turkmen/screens/tutorial_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  late FakeFirebaseFirestore fakeFirestore;
  late MockNavigatorObserver mockNavigatorObserver;

  setUp(() {
    fakeFirestore = FakeFirebaseFirestore();
    mockNavigatorObserver = MockNavigatorObserver();
  });

  Widget createWidgetUnderTest(String tutorialId) {
    return Provider<FirebaseFirestore>(
      create: (_) => fakeFirestore,
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
        home: TutorialScreen(tutorialId: tutorialId),
        navigatorObservers: [mockNavigatorObserver],
      ),
    );
  }

  testWidgets('TutorialScreen displays correctly when loaded', (WidgetTester tester) async {
    await fakeFirestore.collection('tutorials').doc('tutorial1').set({
      'title_en': 'Test Tutorial',
      'image_url': '',
      'content_en': '<h1>Test Content</h1>',
      'index': 1,
      'public_en': true,
    });

    await tester.pumpWidget(createWidgetUnderTest('tutorial1'));
    await tester.pumpAndSettle();

    expect(find.text('Test Tutorial'), findsOneWidget);
    expect(find.byType(Html), findsOneWidget);
  });

  testWidgets('TutorialScreen navigates to ExerciseScreen when exercise button is pressed', (WidgetTester tester) async {
    await fakeFirestore.collection('tutorials/tutorial1/exercises_en').doc('exercise1').set({
      'title': 'Exercise 1',
    });
    await fakeFirestore.collection('tutorials').doc('tutorial1').set({
      'title_en': 'Test Tutorial',
      'index': 1,
      'public_en': true,
    });

    await tester.pumpWidget(createWidgetUnderTest('tutorial1'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Start exercise'));
    await tester.pumpAndSettle();

    expect(find.byType(ExerciseScreen), findsOneWidget);
  });

  testWidgets('TutorialScreen navigates to previous tutorial when prev button is pressed', (WidgetTester tester) async {
    await fakeFirestore.collection('tutorials').doc('tutorial1').set({
      'title_en': 'Test Tutorial',
      'index': 2,
      'public_en': true,
    });
    await fakeFirestore.collection('tutorials').doc('tutorial0').set({
      'title_en': 'Previous Tutorial',
      'index': 1,
      'public_en': true,
    });

    await tester.pumpWidget(createWidgetUnderTest('tutorial1'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Prev'));
    await tester.pumpAndSettle();

    expect(find.byType(TutorialScreen), findsOneWidget);
  });

  testWidgets('TutorialScreen navigates to next tutorial when next button is pressed', (WidgetTester tester) async {
    await fakeFirestore.collection('tutorials').doc('tutorial1').set({
      'title_en': 'Test Tutorial',
      'index': 1,
      'public_en': true,
    });
    await fakeFirestore.collection('tutorials').doc('tutorial2').set({
      'title_en': 'Next Tutorial',
      'index': 2,
      'public_en': true,
    });

    await tester.pumpWidget(createWidgetUnderTest('tutorial1'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    expect(find.byType(TutorialScreen), findsOneWidget);
  });
}
