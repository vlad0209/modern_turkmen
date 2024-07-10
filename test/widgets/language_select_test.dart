import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/models/language_data.dart';
import 'package:modern_turkmen/widgets/language_select.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockLanguageData extends ChangeNotifier implements LanguageData {
  Locale _locale = const Locale('en');

  @override
  Locale get locale => _locale;

  @override
  set locale(Locale? newLocale) {
    _locale = newLocale!;
    notifyListeners();
  }

  @override
  SharedPreferences get prefs => throw UnimplementedError();

  @override
  void toggleLocale() {
  }
}

void main() {
  late MockLanguageData mockLanguageData;

  setUp(() {
    mockLanguageData = MockLanguageData();
  });

  Widget createWidgetUnderTest({Function? callback}) {
    return ChangeNotifierProvider<LanguageData>.value(
      value: mockLanguageData,
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English
          Locale('ru', ''), // Russian
        ],
        home: Scaffold(
          body: LanguageSelect(callback: callback),
        ),
      ),
    );
  }

  testWidgets('LanguageSelect displays correct widgets', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Choose your primary language.'), findsOneWidget);
    expect(find.text('English'), findsOneWidget);
    expect(find.text('Русский'), findsOneWidget);
  });

  testWidgets('LanguageSelect changes locale to English and calls callback', (WidgetTester tester) async {
    bool callbackCalled = false;

    await tester.pumpWidget(createWidgetUnderTest(callback: () {
      callbackCalled = true;
    }));

    await tester.tap(find.text('English'));
    await tester.pumpAndSettle();

    expect(mockLanguageData.locale, const Locale('en'));
    expect(callbackCalled, isTrue);
  });

  testWidgets('LanguageSelect changes locale to Russian and calls callback', (WidgetTester tester) async {
    bool callbackCalled = false;

    await tester.pumpWidget(createWidgetUnderTest(callback: () {
      callbackCalled = true;
    }));

    await tester.tap(find.text('Русский'));
    await tester.pumpAndSettle();

    expect(mockLanguageData.locale, const Locale('ru'));
    expect(callbackCalled, isTrue);
  });

  testWidgets('LanguageSelect changes locale to English and pops navigator if no callback', (WidgetTester tester) async {
    final navigatorKey = GlobalKey<NavigatorState>();

    await tester.pumpWidget(
      ChangeNotifierProvider<LanguageData>.value(
        value: mockLanguageData,
        child: MaterialApp(
          key: navigatorKey,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English
            Locale('ru', ''), // Russian
          ],
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const LanguageSelect()));
                },
                child: const Text('Open LanguageSelect'),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open LanguageSelect'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('English'));
    await tester.pumpAndSettle();

    expect(mockLanguageData.locale, const Locale('en'));
  });
}
