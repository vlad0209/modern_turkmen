import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:modern_turkmen/config/dependencies.dart';
import 'package:modern_turkmen/data/repositories/language/language_repository.dart';
import 'package:modern_turkmen/data/repositories/tutorial/tutorial_repository.dart';
import 'package:modern_turkmen/domain/models/tutorial/tutorial.dart';
import 'package:modern_turkmen/ui/widgets/contents_table_screen.dart';
import 'package:modern_turkmen/ui/widgets/language_selection_button.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'contents_table_screen_test.mocks.dart';

@GenerateMocks([TutorialRepository, LanguageRepository])
void main() {
  group('ContentsTableScreen', () {
    late MockTutorialRepository mockTutorialRepository;
    late MockLanguageRepository mockLanguageRepository;

    setUp(() {
      mockTutorialRepository = MockTutorialRepository();
      mockLanguageRepository = MockLanguageRepository();
    });

    testWidgets('shows loading indicator when data is loading', (tester) async {
      // Return a stream that never emits to simulate loading
      when(mockTutorialRepository.getTutorialsStream())
          .thenAnswer((_) => const Stream.empty());

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tutorialRepositoryProvider.overrideWithValue(mockTutorialRepository),
            languageRepositoryProvider.overrideWithValue(mockLanguageRepository),
          ],
          child: MaterialApp.router(
            routerConfig: GoRouter(routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const ContentsTableScreen(),
              ),
            ]),
          ),
        ),
      );

      // Wait for the widget to build
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows error message when data loading fails', (tester) async {
      const error = 'Test error';
      when(mockTutorialRepository.getTutorialsStream())
          .thenAnswer((_) => Stream.error(error));

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tutorialRepositoryProvider.overrideWithValue(mockTutorialRepository),
            languageRepositoryProvider.overrideWithValue(mockLanguageRepository),
          ],
          child: MaterialApp.router(
            routerConfig: GoRouter(routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const ContentsTableScreen(),
              ),
            ]),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(SelectableText), findsOneWidget);
      expect(find.textContaining(error), findsOneWidget);
    });

    testWidgets('shows grid view when data is loaded', (tester) async {
      final mockTutorials = <Tutorial>[
        Tutorial(
          id: '1',
          title: 'Test Tutorial',
          thumbUrl: '',
          imageUrl: '',
          content: '',
          prevTutorialId: '',
          nextTutorialId: '',
        ),
      ];

      when(mockTutorialRepository.getTutorialsStream())
          .thenAnswer((_) => Stream.value(mockTutorials));

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tutorialRepositoryProvider.overrideWithValue(mockTutorialRepository),
            languageRepositoryProvider.overrideWithValue(mockLanguageRepository),
          ],
          child: MaterialApp.router(
            routerConfig: GoRouter(routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const ContentsTableScreen(),
              ),
            ]),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(OrientationBuilder), findsOneWidget);
    });

    testWidgets('shows correct number of columns in portrait mode', (tester) async {
      final mockTutorials = <Tutorial>[
        Tutorial(
          id: '1',
          title: 'Test Tutorial',
          thumbUrl: '',
          imageUrl: '',
          content: '',
          prevTutorialId: '',
          nextTutorialId: '',
        ),
      ];

      when(mockTutorialRepository.getTutorialsStream())
          .thenAnswer((_) => Stream.value(mockTutorials));

      // Set the device to portrait mode
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tutorialRepositoryProvider.overrideWithValue(mockTutorialRepository),
            languageRepositoryProvider.overrideWithValue(mockLanguageRepository),
          ],
          child: MaterialApp.router(
            routerConfig: GoRouter(routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const ContentsTableScreen(),
              ),
            ]),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final gridView = tester.widget<GridView>(find.byType(GridView));
      final delegate = gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
      expect(delegate.crossAxisCount, 2);

      // Reset the view size
      tester.view.reset();
    });

    testWidgets('has language selection button in app bar', (tester) async {
      when(mockTutorialRepository.getTutorialsStream())
          .thenAnswer((_) => Stream.value(<Tutorial>[]));

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tutorialRepositoryProvider.overrideWithValue(mockTutorialRepository),
            languageRepositoryProvider.overrideWithValue(mockLanguageRepository),
          ],
          child: MaterialApp.router(
            routerConfig: GoRouter(routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const ContentsTableScreen(),
              ),
            ]),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(LanguageSelectionButton), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });
  });
}