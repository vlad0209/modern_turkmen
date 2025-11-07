import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modern_turkmen/l10n/app_localizations.dart';
import 'config/dependencies.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:modern_turkmen/ui/widgets/contents_table_screen.dart';
import 'package:modern_turkmen/ui/widgets/tutorial_screen.dart';
import 'ui/widgets/welcome_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  String tutorialId = '';
  String preferredLanguage = '';
  bool preferencesInitialized = false;

  late final router = GoRouter(
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final currentLanguage =
        ref.watch(languageRepositoryProvider);
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      locale: Locale(currentLanguage.currentLanguage.code),
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
    );
  }
}
