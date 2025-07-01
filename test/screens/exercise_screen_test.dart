import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:modern_turkmen/screens/exercise_screen.dart';
import 'package:modern_turkmen/l10n/app_localizations.dart';

void main() {
  late FakeFirebaseFirestore fakeFirestore;

  setUp(() {
    fakeFirestore = FakeFirebaseFirestore();
    fakeFirestore.doc('tutorials/tutorial1').set({
      'public_en': true,
      'index': 1,
      'title_en': 'Tutorial 1',
      'thumb_url': 'https://example.com/thumb.jpg'
    });
  });

  Widget createWidgetUnderTest() {
    return Provider<FirebaseFirestore>(
      create: (_) => fakeFirestore,
      child: const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: ExerciseScreen(
          exerciseId: 'exercise1',
          tutorialId: 'tutorial1',
          locale: 'en',
        ),
      ),
    );
  }

  testWidgets('ExerciseScreen displays CircularProgressIndicator when loading',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('ExerciseScreen displays data when available',
      (WidgetTester tester) async {
    await fakeFirestore.collection('tutorials/tutorial1/exercises_en').doc('exercise1').set({
      'description': 'Test description',
      'example': 'Example text',
      'example_translation': 'Example translation',
      'items': [
        {
          'sentence': 'This is a <f/> sentence.',
          'solution': 'This is a test sentence.',
          'translation': 'Translation text',
          'options': ['test'],
          'sound': 'http://example.com/sound.mp3'
        }
      ]
    });

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    expect(find.text('Test description'), findsOneWidget);
    expect(find.text('Example text'), findsOneWidget);
    expect(find.text('Example translation'), findsOneWidget);
    expect(find.text('Translation text'), findsOneWidget);
  });
}
