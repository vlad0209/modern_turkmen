import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/widgets/word_card.dart';

void main() {
  Widget createWidgetUnderTest({String content = ''}) {
    return MaterialApp(
      home: Scaffold(
        body: WordCard(content: content),
      ),
    );
  }

  testWidgets('WordCard displays text content', (WidgetTester tester) async {
    const testContent = 'Test Content';

    await tester.pumpWidget(createWidgetUnderTest(content: testContent));

    expect(find.text(testContent), findsOneWidget);
  });

  testWidgets('WordCard displays empty box when content is empty', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    final sizedBoxFinder = find.byType(SizedBox);

    expect(sizedBoxFinder, findsOneWidget);

    final sizedBox = tester.widget<SizedBox>(sizedBoxFinder);

    expect(sizedBox.width, 30);
    expect(sizedBox.height, 20);
  });
}
