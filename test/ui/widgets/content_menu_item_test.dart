import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:modern_turkmen/domain/models/tutorial/tutorial.dart';
import 'package:modern_turkmen/ui/widgets/content_menu_item.dart';
import 'package:mockito/mockito.dart';

class MockGoRouter extends Mock implements GoRouter {}

void main() {
  group('ContentMenuItem', () {
    late Tutorial mockTutorial;

    setUp(() {
      mockTutorial = const Tutorial(
        id: '1',
        title: 'Test Tutorial',
        thumbUrl: 'https://example.com/image.jpg',
        imageUrl: '',
        content: '',
        prevTutorialId: '',
        nextTutorialId: '',
      );
    });

    testWidgets('renders tutorial title', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ContentMenuItem(tutorial: mockTutorial),
          ),
        ),
      );

      expect(find.text('Test Tutorial'), findsOneWidget);
    });

    testWidgets('renders image when thumbUrl is provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ContentMenuItem(tutorial: mockTutorial),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('does not render image when thumbUrl is empty',
        (WidgetTester tester) async {
      final tutorialWithoutThumb = Tutorial(
        id: '1',
        title: 'Test Tutorial',
        thumbUrl: '', imageUrl: '', content: '', prevTutorialId: '', nextTutorialId: '',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ContentMenuItem(tutorial: tutorialWithoutThumb),
          ),
        ),
      );

      expect(find.byType(Image), findsNothing);
    });

    testWidgets('does not render image when thumbUrl is null',
        (WidgetTester tester) async {
      final tutorialWithoutThumb = Tutorial(
        id: '1',
        title: 'Test Tutorial',
        thumbUrl: null, imageUrl: '', content: '', prevTutorialId: '', nextTutorialId: '',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ContentMenuItem(tutorial: tutorialWithoutThumb),
          ),
        ),
      );

      expect(find.byType(Image), findsNothing);
    });

    testWidgets('has correct button styling', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ContentMenuItem(tutorial: mockTutorial),
          ),
        ),
      );

      final materialButton =
          tester.widget<MaterialButton>(find.byType(MaterialButton));
      expect(materialButton.color, Colors.white60);
    });

    testWidgets('navigates to tutorial route when pressed',
        (WidgetTester tester) async {
      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) =>
                ContentMenuItem(tutorial: mockTutorial),
          ),
          GoRoute(
            path: '/tutorial/:id',
            builder: (context, state) =>
                const Scaffold(body: Text('Tutorial Page')),
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: router,
        ),
      );

      await tester.tap(find.byType(MaterialButton));
      await tester.pumpAndSettle();

      expect(find.text('Tutorial Page'), findsOneWidget);
    });
  });
}
