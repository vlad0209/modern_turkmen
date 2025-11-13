import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/ui/widgets/language_selection_button.dart';

void main() {
  group('LanguageSelectionButton', () {
    testWidgets('renders IconButton with language icon', (WidgetTester tester) async {
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LanguageSelectionButton(
              onPressed: () {
              },
            ),
          ),
        ),
      );

      expect(find.byType(IconButton), findsOneWidget);
      expect(find.byIcon(Icons.language), findsOneWidget);
    });

    testWidgets('calls onPressed callback when tapped', (WidgetTester tester) async {
      bool onPressedCalled = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LanguageSelectionButton(
              onPressed: () {
                onPressedCalled = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(IconButton));
      await tester.pump();

      expect(onPressedCalled, isTrue);
    });

    testWidgets('requires onPressed parameter', (WidgetTester tester) async {
      expect(
        () => LanguageSelectionButton(onPressed: () {}),
        returnsNormally,
      );
    });
  });
}