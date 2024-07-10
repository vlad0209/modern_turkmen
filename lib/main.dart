import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
    prefs: prefs,
    firestore: FirebaseFirestore.instance,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.prefs, required this.firestore});
  final SharedPreferences prefs;
  final FirebaseFirestore firestore;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String tutorialId = '';
  String preferredLanguage = '';
  bool preferencesInitialized = false;

  late final LanguageData _languageData = LanguageData(prefs: widget.prefs);

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    String languageCode = widget.prefs.getString('languageCode') ?? '';
    setState(() {
      preferredLanguage = languageCode;
      tutorialId = widget.prefs.getString('tutorialId') ?? '';
    });
    if (languageCode.isNotEmpty) {
      _languageData.locale = Locale(languageCode);
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
        initialLocation: tutorialId.isNotEmpty ? '/tutorial/$tutorialId' : '/',
        routes: [
          GoRoute(
              path: '/',
              builder: (_, __) {
                if (preferredLanguage.isEmpty) {
                  return const WelcomeScreen();
                } else {
                  return const ContentsTableScreen();
                }
              },
              routes: [
                GoRoute(
                    path: 'tutorial/:id',
                    builder: (context, state) {
                      return TutorialScreen(
                          tutorialId: state.pathParameters['id']!);
                    })
              ])
        ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _languageData),
        Provider<FirebaseFirestore>(create: (context) => FirebaseFirestore.instance)
      ],
      child: MaterialApp.router(
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            locale: _languageData.locale,
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
                bodyMedium: TextStyle(
                  fontSize: 20,
                ),
              ),
              primarySwatch: Colors.pink,
            ),
          ),
    );
  }
}
