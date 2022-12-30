import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:modern_turkmen/models/language_data.dart';
import 'package:modern_turkmen/screens/contents_table_screen.dart';
import 'package:modern_turkmen/screens/tutorial_screen.dart';
import 'package:provider/provider.dart';
import 'screens/welcome_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String tutorialId = '';
  String preferredLanguage = '';
  bool preferencesInitialized = false;
  final LanguageData _languageData = LanguageData();
  late SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString('languageCode') ?? '';
    setState(() {
      preferredLanguage = languageCode;
      tutorialId = prefs.getString('tutorialId') ?? '';
    });
    if(languageCode.isNotEmpty) {
      _languageData.locale = Locale(languageCode);
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _languageData,
      child: Consumer(
        builder: (BuildContext context, locale, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: Provider.of<LanguageData>(context).locale,
            title: 'Flutter Demo',
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''),
              Locale('ru', ''),
            ],
            theme: ThemeData(
              cardColor: Colors.white70,
              textTheme: const TextTheme(
                bodyText2: TextStyle(
                  fontSize: 20,
                ),
              ),
              primarySwatch: Colors.pink,
            ),
            home: Builder(
              builder: (BuildContext context) {
                if(preferredLanguage.isEmpty) {
                  return const WelcomeScreen();
                }
                if(tutorialId.isEmpty) {
                  return const ContentsTableScreen();
                }

                return TutorialScreen(tutorialId: tutorialId);
              },
            ),
          );
        },
      ),
    );
  }
}
