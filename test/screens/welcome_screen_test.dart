import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/screens/welcome_screen.dart';
import 'package:modern_turkmen/screens/contents_table_screen.dart';
import 'package:modern_turkmen/widgets/language_select.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {

  Widget createWidgetUnderTest() {
    return Provider<FirebaseFirestore>(
      create: (BuildContext context) => FakeFirebaseFirestore(),
      child: const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: WelcomeScreen(),
      ),
    );
  }

  testWidgets('WelcomeScreen displays LanguageSelect widget', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    // Verify that LanguageSelect is present
    expect(find.byType(LanguageSelect), findsOneWidget);
  });

  testWidgets('WelcomeScreen navigates to ContentsTableScreen when a language is selected', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    // Trigger the callback in LanguageSelect
    final languageSelect = find.byType(LanguageSelect);
    final languageSelectWidget = tester.widget<LanguageSelect>(languageSelect);
    languageSelectWidget.callback!();

    await tester.pumpAndSettle();
    expect(find.byType(ContentsTableScreen), findsOneWidget);
  });
}
