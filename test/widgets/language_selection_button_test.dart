import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:modern_turkmen/models/language_data.dart';
import 'package:modern_turkmen/widgets/language_selection_button.dart';

class MockLanguageData extends Mock implements LanguageData {}

void main() {
  late MockLanguageData mockLanguageData;

  setUp(() {
    mockLanguageData = MockLanguageData();
  });

  Widget createWidgetUnderTest() {
    return ChangeNotifierProvider<LanguageData>.value(
      value: mockLanguageData,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            actions: const [
              LanguageSelectionButton(),
            ],
          ),
        ),
      ),
    );
  }

  testWidgets('LanguageSelectionButton displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byIcon(Icons.language), findsOneWidget);
  });

  testWidgets('LanguageSelectionButton toggles locale when pressed', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    await tester.tap(find.byIcon(Icons.language));
    await tester.pumpAndSettle();

    verify(mockLanguageData.toggleLocale()).called(1);
  });
}
