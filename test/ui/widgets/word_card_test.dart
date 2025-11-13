import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/ui/widgets/word_card.dart';

void main() {
  group('WordCard', () {
    testWidgets('displays text when content is provided', (WidgetTester tester) async {
      const testContent = 'Hello World';
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WordCard(content: testContent),
          ),
        ),
      );

      expect(find.text(testContent), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
      expect(find.byType(SizedBox), findsNothing);
    });

    testWidgets('displays SizedBox when content is empty', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WordCard(content: ''),
          ),
        ),
      );

      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(Text), findsNothing);
    });

    testWidgets('uses default empty content when not specified', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WordCard(),
          ),
        ),
      );

      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(Text), findsNothing);
    });

    testWidgets('has correct widget structure', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WordCard(content: 'test'),
          ),
        ),
      );

      expect(find.byType(Card), findsOneWidget);
      expect(find.byType(Padding), findsAtLeastNWidgets(1));
    });
  });
}