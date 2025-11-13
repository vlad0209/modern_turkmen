import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:modern_turkmen/ui/widgets/main_layout.dart';


void main() {
  group('MainLayout', () {
    testWidgets('displays title and child widget', (WidgetTester tester) async {
      const testTitle = 'Test Title';
      const testChild = Text('Test Child');

      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: GoRouter(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const MainLayout(
                  title: testTitle,
                  child: testChild,
                ),
              ),
            ],
          ),
        ),
      );

      expect(find.text(testTitle), findsOneWidget);
      expect(find.text('Test Child'), findsOneWidget);
    });

    testWidgets('displays home icon button', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: GoRouter(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const MainLayout(
                  title: 'Test',
                  child: Text('Child'),
                ),
              ),
            ],
          ),
        ),
      );

      expect(find.byIcon(Icons.home), findsOneWidget);
    });

    testWidgets('sets automaticallyImplyLeading to false by default', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: GoRouter(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const MainLayout(
                  title: 'Test',
                  child: Text('Child'),
                ),
              ),
            ],
          ),
        ),
      );

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.automaticallyImplyLeading, false);
    });

    testWidgets('sets automaticallyImplyLeading when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: GoRouter(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const MainLayout(
                  title: 'Test',
                  automaticallyImplyLeading: true,
                  child: Text('Child'),
                ),
              ),
            ],
          ),
        ),
      );

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.automaticallyImplyLeading, true);
    });

    testWidgets('has SafeArea and SingleChildScrollView', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: GoRouter(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const MainLayout(
                  title: 'Test',
                  child: Text('Child'),
                ),
              ),
            ],
          ),
        ),
      );

      expect(find.byType(SafeArea), findsAtLeastNWidgets(1));
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('title has correct text style', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: GoRouter(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const MainLayout(
                  title: 'Test Title',
                  child: Text('Child'),
                ),
              ),
            ],
          ),
        ),
      );

      final titleText = tester.widget<Text>(find.text('Test Title'));
      expect(titleText.style?.fontSize, 30.0);
    });
  });
}