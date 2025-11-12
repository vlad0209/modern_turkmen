import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modern_turkmen/config/dependencies.dart';
import 'package:modern_turkmen/l10n/app_localizations.dart';
import 'package:modern_turkmen/ui/view_model/app_view_model.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'routing/router.dart';
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
  GoRouter? _router;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final asyncUiState = ref.watch(appViewModelProvider);
    return asyncUiState.when(
        loading: () => const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white54,
                  ),
                ),
              ),
            ),
        error: (error, stackTrace) => MaterialApp(
              home: Scaffold(
                body: Center(child: Text('Error: $error')),
              ),
            ),
        data: (uiState) {
          _router ??= router(
              uiState.bookmarkedTutorialId, ref.read(onboardingRepositoryProvider));
              
          return MaterialApp.router(
            routerConfig: _router,
            debugShowCheckedModeBanner: false,
            locale: Locale(uiState.preferredLanguage),
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
        });
  }
}
