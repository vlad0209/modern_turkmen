import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/screens/contents_table_screen.dart';
import 'package:modern_turkmen/widgets/content_menu_item.dart';
import 'package:modern_turkmen/widgets/language_selection_button.dart';
import 'package:provider/provider.dart';
import 'package:modern_turkmen/l10n/app_localizations.dart';

void main() {
  late FakeFirebaseFirestore fakeFirestore;

  setUp(() {
    fakeFirestore = FakeFirebaseFirestore();
  });

  Widget createWidgetUnderTest() {
    return Provider<FirebaseFirestore>(
      create: (_) => fakeFirestore,
      child: const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: ContentsTableScreen(),
      ),
    );
  }

  testWidgets(
      'ContentsTableScreen displays CircularProgressIndicator when loading',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('ContentsTableScreen displays LanguageSelectionButton in AppBar',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(LanguageSelectionButton), findsOneWidget);
  });

  testWidgets(
      'ContentsTableScreen displays ContentMenuItem when data is available',
      (WidgetTester tester) async {
    await fakeFirestore.collection('tutorials').add({
      'public_en': true,
      'index': 1,
      'title_en': 'Tutorial 1',
      'thumb_url': 'https://example.com/thumb.jpg'
    });
    await fakeFirestore.collection('tutorials').add({
      'public_en': true,
      'index': 2,
      'title_en': 'Tutorial 2',
      'thumb_url': 'https://example.com/thumb.jpg'
    });
    await fakeFirestore.collection('tutorials').add({
      'public_en': true,
      'index': 3,
      'title_en': 'Tutorial 3',
      'thumb_url': 'https://example.com/thumb.jpg'
    });

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle(); // Let the stream builder update

    expect(find.byType(ContentMenuItem), findsNWidgets(3));
  });
}
