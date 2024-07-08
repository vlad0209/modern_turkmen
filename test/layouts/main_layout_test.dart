import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modern_turkmen/layouts/main_layout.dart';

import 'main_layout_test.mocks.dart';

@GenerateMocks([GoRouter])

class MockGoRouterProvider extends StatelessWidget {
  const MockGoRouterProvider({
    required this.goRouter,
    required this.child,
    super.key,
  });

  final MockGoRouter goRouter;

  final Widget child;

  @override
  Widget build(BuildContext context) => InheritedGoRouter(
        goRouter: goRouter,
        child: child,
      );
}

void main() {
  late MockGoRouter mockGoRouter;

  setUp(() {
    mockGoRouter = MockGoRouter();
  });

  Widget createMainLayout(
      {required String title,
      required Widget child,
      bool automaticallyImplyLeading = false}) {
    return MaterialApp(
      home: MockGoRouterProvider(
        goRouter: mockGoRouter,
        child: MainLayout(
          title: title,
          automaticallyImplyLeading: automaticallyImplyLeading,
          child: child,
        ),
      ),
    );
  }

  testWidgets('MainLayout shows the correct title',
      (WidgetTester tester) async {
    const testTitle = 'Test Title';
    await tester
        .pumpWidget(createMainLayout(title: testTitle, child: Container()));

    expect(find.text(testTitle), findsOneWidget);
  });

  testWidgets('MainLayout shows the IconButton', (WidgetTester tester) async {
    await tester
        .pumpWidget(createMainLayout(title: 'Test', child: Container()));

    expect(find.byIcon(Icons.home), findsOneWidget);
  });

  testWidgets('MainLayout navigates to "/" when IconButton is pressed',
      (WidgetTester tester) async {
    
    when(mockGoRouter.go('/')).thenAnswer((_) {});

    await tester
        .pumpWidget(createMainLayout(title: 'Test', child: Container()));
    await tester.tap(find.byIcon(Icons.home));
    await tester.pumpAndSettle();

    verify(mockGoRouter.go('/')).called(1);
  });

  testWidgets('MainLayout correctly sets automaticallyImplyLeading',
      (WidgetTester tester) async {
    await tester.pumpWidget(createMainLayout(
        title: 'Test', child: Container(), automaticallyImplyLeading: true));
    AppBar appBar = tester.widget<AppBar>(find.byType(AppBar));
    expect(appBar.automaticallyImplyLeading, true);

    await tester.pumpWidget(createMainLayout(
        title: 'Test', child: Container(), automaticallyImplyLeading: false));
    appBar = tester.widget<AppBar>(find.byType(AppBar));
    expect(appBar.automaticallyImplyLeading, false);
  });

  testWidgets('MainLayout renders child widget', (WidgetTester tester) async {
    const testKey = Key('test-child');
    await tester.pumpWidget(
        createMainLayout(title: 'Test', child: Container(key: testKey)));

    expect(find.byKey(testKey), findsOneWidget);
  });
}
