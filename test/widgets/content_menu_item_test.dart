import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modern_turkmen/widgets/content_menu_item.dart';

import '../layouts/main_layout_test.dart';
import '../layouts/main_layout_test.mocks.dart';

void main() {
  late FakeFirebaseFirestore fakeFirestore;
  late MockGoRouter mockGoRouter;

  setUp(() {
    fakeFirestore = FakeFirebaseFirestore();
    mockGoRouter = MockGoRouter();
  });

  Widget createWidgetUnderTest(QueryDocumentSnapshot tutorial) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English
      ],
      home: MockGoRouterProvider(
        goRouter: mockGoRouter,
        child: ContentMenuItem(tutorial: tutorial),
      ),
    );
  }

  testWidgets('ContentMenuItem displays correct data', (WidgetTester tester) async {
    await fakeFirestore.collection('tutorials').add({
      'thumb_url': '',
      'title_en': 'Test Tutorial',
    });

    final tutorialSnapshot = (await fakeFirestore.collection('tutorials').snapshots().first).docs.first;

    await tester.pumpWidget(createWidgetUnderTest(tutorialSnapshot));
    await tester.pumpAndSettle();

    expect(find.text('Test Tutorial'), findsOneWidget);
  });

  testWidgets('ContentMenuItem navigates when pressed', (WidgetTester tester) async {
    await fakeFirestore.collection('tutorials').add({
      'thumb_url': 'https://example.com/image.png',
      'title_en': 'Test Tutorial',
    });

    final tutorialSnapshot = (await fakeFirestore.collection('tutorials').snapshots().first).docs.first;

    when(mockGoRouter.go('/tutorial/${tutorialSnapshot.id}')).thenReturn(null);

    await tester.pumpWidget(createWidgetUnderTest(tutorialSnapshot));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(MaterialButton));
    await tester.pumpAndSettle();

    verify(mockGoRouter.go('/tutorial/${tutorialSnapshot.id}')).called(1);
  });
}
