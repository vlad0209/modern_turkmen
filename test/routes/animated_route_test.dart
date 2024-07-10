import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/routes/animated_route.dart';

void main() {
  testWidgets('AnimatedRoute creates a route with the correct screen', (WidgetTester tester) async {
    final testKey = GlobalKey();
    final testWidget = Scaffold(key: testKey);

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(AnimatedRoute.create(testWidget));
              },
              child: const Text('Navigate'),
            );
          },
        ),
      ),
    );

    expect(find.byType(ElevatedButton), findsOneWidget);
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byKey(testKey), findsOneWidget);
  });

  testWidgets('AnimatedRoute applies slide transition', (WidgetTester tester) async {
    final testWidget = Scaffold(appBar: AppBar(title: const Text('Test')));

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(AnimatedRoute.create(testWidget));
              },
              child: const Text('Navigate'),
            );
          },
        ),
      ),
    );

    expect(find.byType(ElevatedButton), findsOneWidget);
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // The widget should not be fully in place yet
    expect(find.text('Test'), findsNothing);

    // Move the animation forward
    await tester.pump(const Duration(milliseconds: 300));

    // The widget should now be fully in place
    expect(find.text('Test'), findsOneWidget);
  });
}
