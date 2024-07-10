import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:modern_turkmen/main.dart';
import 'package:modern_turkmen/screens/contents_table_screen.dart';
import 'package:modern_turkmen/screens/tutorial_screen.dart';
import 'package:modern_turkmen/screens/welcome_screen.dart';
import 'package:modern_turkmen/widgets/content_menu_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App Integration Tests', () {
    late SharedPreferences prefs;
    late FirebaseFirestore firestore;

    setUpAll(() async {
      // Initialize Firebase and SharedPreferences
      await Firebase.initializeApp();
      prefs = await SharedPreferences.getInstance();
      firestore = FirebaseFirestore.instance;

      // Clear preferences for a clean test slate
      await prefs.clear();
    });

    testWidgets('Initial load shows WelcomeScreen', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp(prefs: prefs, firestore: firestore));
      await tester.pumpAndSettle();

      expect(find.byType(WelcomeScreen), findsOneWidget);
    });

    testWidgets('Selecting a language navigates to ContentsTableScreen', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp(prefs: prefs, firestore: firestore));
      await tester.pumpAndSettle();

      // Assume the language selection buttons are in the WelcomeScreen
      final englishButton = find.text('English');
      expect(englishButton, findsOneWidget);
      await tester.tap(englishButton);
      await tester.pumpAndSettle();

      expect(find.byType(ContentsTableScreen), findsOneWidget);
    });

    testWidgets('Navigating to TutorialScreen from ContentsTableScreen', (WidgetTester tester) async {
      // Set the preferred language to simulate that it's already selected
      await prefs.setString('languageCode', 'en');

      await tester.pumpWidget(MyApp(prefs: prefs, firestore: firestore));
      await tester.pumpAndSettle();

      expect(find.byType(ContentsTableScreen), findsOneWidget);

      // Simulate tapping on a tutorial item (needs more detail to simulate properly)
      final tutorialButton = find.byType(ContentMenuItem).first;
      expect(tutorialButton, findsOneWidget);
      await tester.tap(tutorialButton);
      await tester.pumpAndSettle();

      expect(find.byType(TutorialScreen), findsOneWidget);
    });
  });
}
