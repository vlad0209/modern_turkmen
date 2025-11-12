import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modern_turkmen/data/services/firestore/firestore_service.dart';
import 'package:modern_turkmen/data/services/firestore/model/tutorial/tutorial_firestore_model.dart';
import 'package:modern_turkmen/data/services/firestore/model/exercise/exercise_firestore_model.dart';

import 'firestore_service_test.mocks.dart';

@GenerateMocks([
  FirebaseFirestore,
  CollectionReference,
  DocumentReference,
  DocumentSnapshot,
  QuerySnapshot,
  QueryDocumentSnapshot,
  Query,
])
void main() {
  late FirestoreService firestoreService;
  late MockFirebaseFirestore mockFirestore;
  late MockCollectionReference<Map<String, dynamic>> mockCollection;
  late MockDocumentReference<Map<String, dynamic>> mockDocument;
  late MockDocumentSnapshot<Map<String, dynamic>> mockDocSnapshot;
  late MockQueryDocumentSnapshot<Map<String, dynamic>> mockQueryDocSnapshot;
  late MockQuerySnapshot<Map<String, dynamic>> mockQuerySnapshot;
  late MockQuery<Map<String, dynamic>> mockQuery;

  setUp(() {
    mockFirestore = MockFirebaseFirestore();
    mockCollection = MockCollectionReference<Map<String, dynamic>>();
    mockDocument = MockDocumentReference<Map<String, dynamic>>();
    mockDocSnapshot = MockDocumentSnapshot<Map<String, dynamic>>();
    mockQueryDocSnapshot = MockQueryDocumentSnapshot<Map<String, dynamic>>();
    mockQuerySnapshot = MockQuerySnapshot<Map<String, dynamic>>();
    mockQuery = MockQuery<Map<String, dynamic>>();
    firestoreService = FirestoreService(mockFirestore);
  });

  group('FirestoreService', () {
    group('getPublicTutorialsStream', () {
      test('should return stream of tutorials', () async {
        when(mockFirestore.collection('tutorials')).thenReturn(mockCollection);
        when(mockCollection.where('public_en', isEqualTo: true)).thenReturn(mockQuery);
        when(mockQuery.orderBy('created_at')).thenReturn(mockQuery);
        when(mockQuery.snapshots()).thenAnswer((_) => Stream.value(mockQuerySnapshot));
        when(mockQuerySnapshot.docs).thenReturn([]);

        final stream = firestoreService.getPublicTutorialsStream('en');
        final result = await stream.first;

        expect(result, isEmpty);
        verify(mockFirestore.collection('tutorials')).called(1);
        verify(mockCollection.where('public_en', isEqualTo: true)).called(1);
      });
    });

    group('getExerciseById', () {
      test('should return exercise when document exists', () async {
        final exerciseData = {
          'id': 'exercise1',
          'description': 'Test exercise description',
          'example': 'Test example',
          'items': <Map<String, dynamic>>[
            {'text': 'test', 'translation': 'тест'}
          ],
          'order_number': 1,
          'example_translation': 'Test translation',
        };
        
        when(mockFirestore.collection('tutorials')).thenReturn(mockCollection);
        when(mockCollection.doc('tutorial1')).thenReturn(mockDocument);
        when(mockDocument.collection('exercises_en')).thenReturn(mockCollection);
        when(mockCollection.doc('exercise1')).thenReturn(mockDocument);
        when(mockDocument.get()).thenAnswer((_) async => mockDocSnapshot);
        when(mockDocSnapshot.exists).thenReturn(true);
        when(mockDocSnapshot.id).thenReturn('exercise1');
        when(mockDocSnapshot.data()).thenReturn(exerciseData);

        final result = await firestoreService.getExerciseById('tutorial1', 'en', 'exercise1');

        expect(result, isA<ExerciseFirestoreModel>());
        verify(mockDocument.get()).called(1);
      });

      test('should throw exception when exercise not found', () async {
        when(mockFirestore.collection('tutorials')).thenReturn(mockCollection);
        when(mockCollection.doc('tutorial1')).thenReturn(mockDocument);
        when(mockDocument.collection('exercises_en')).thenReturn(mockCollection);
        when(mockCollection.doc('exercise1')).thenReturn(mockDocument);
        when(mockDocument.get()).thenAnswer((_) async => mockDocSnapshot);
        when(mockDocSnapshot.exists).thenReturn(false);

        expect(
          () => firestoreService.getExerciseById('tutorial1', 'en', 'exercise1'),
          throwsA(isA<Exception>()),
        );
      });
    });

    group('getNextExerciseId', () {
      test('should return next exercise id when exists', () async {
        when(mockFirestore.collection('tutorials')).thenReturn(mockCollection);
        when(mockCollection.doc('tutorial1')).thenReturn(mockDocument);
        when(mockDocument.collection('exercises_en')).thenReturn(mockCollection);
        when(mockCollection.doc('exercise1')).thenReturn(mockDocument);
        when(mockDocument.get()).thenAnswer((_) async => mockDocSnapshot);
        when(mockCollection.orderBy('order_number')).thenReturn(mockQuery);
        when(mockQuery.startAfterDocument(any)).thenReturn(mockQuery);
        when(mockQuery.limit(1)).thenReturn(mockQuery);
        when(mockQuery.get()).thenAnswer((_) async => mockQuerySnapshot);
        when(mockQuerySnapshot.docs).thenReturn([mockQueryDocSnapshot]);
        when(mockQueryDocSnapshot.id).thenReturn('exercise2');

        final result = await firestoreService.getNextExerciseId(
          tutorialId: 'tutorial1',
          languageCode: 'en',
          currentExerciseId: 'exercise1',
        );

        expect(result, equals('exercise2'));
      });

      test('should return null when no next exercise', () async {
        when(mockFirestore.collection('tutorials')).thenReturn(mockCollection);
        when(mockCollection.doc('tutorial1')).thenReturn(mockDocument);
        when(mockDocument.collection('exercises_en')).thenReturn(mockCollection);
        when(mockCollection.doc('exercise1')).thenReturn(mockDocument);
        when(mockDocument.get()).thenAnswer((_) async => mockDocSnapshot);
        when(mockCollection.orderBy('order_number')).thenReturn(mockQuery);
        when(mockQuery.startAfterDocument(any)).thenReturn(mockQuery);
        when(mockQuery.limit(1)).thenReturn(mockQuery);
        when(mockQuery.get()).thenAnswer((_) async => mockQuerySnapshot);
        when(mockQuerySnapshot.docs).thenReturn([]);

        final result = await firestoreService.getNextExerciseId(
          tutorialId: 'tutorial1',
          languageCode: 'en',
          currentExerciseId: 'exercise1',
        );

        expect(result, isNull);
      });
    });

    group('getNextTutorialId', () {
      test('should return next tutorial id when exists', () async {
        when(mockFirestore.collection('tutorials')).thenReturn(mockCollection);
        when(mockCollection.doc('tutorial1')).thenReturn(mockDocument);
        when(mockDocument.get()).thenAnswer((_) async => mockDocSnapshot);
        when(mockCollection.orderBy('index')).thenReturn(mockQuery);
        when(mockQuery.where('public_en', isEqualTo: true)).thenReturn(mockQuery);
        when(mockQuery.startAfterDocument(any)).thenReturn(mockQuery);
        when(mockQuery.limit(1)).thenReturn(mockQuery);
        when(mockQuery.get()).thenAnswer((_) async => mockQuerySnapshot);
        when(mockQuerySnapshot.docs).thenReturn([mockQueryDocSnapshot]);
        when(mockQueryDocSnapshot.id).thenReturn('tutorial2');

        final result = await firestoreService.getNextTutorialId(
          tutorialId: 'tutorial1',
          languageCode: 'en',
        );

        expect(result, equals('tutorial2'));
      });
    });

    group('getTutorialById', () {
      test('should return tutorial with navigation ids when exists', () async {
        final tutorialData = {
          'id': 'tutorial1',
          'content_en': 'Test tutorial content',
          'content_ru': 'Тестовый контент урока',
          'created_at': Timestamp.fromDate(DateTime.now()),
          'image_url': 'https://example.com/image.jpg',
          'index': 1,
          'public_en': true,
          'public_ru': true,
          'thumb_url': 'https://example.com/thumb.jpg',
          'title_en': 'Test Tutorial',
          'title_ru': 'Тестовый урок',
        };
        
        when(mockFirestore.collection('tutorials')).thenReturn(mockCollection);
        when(mockCollection.doc('tutorial1')).thenReturn(mockDocument);
        when(mockDocument.get()).thenAnswer((_) async => mockDocSnapshot);
        when(mockCollection.orderBy('index')).thenReturn(mockQuery);
        when(mockQuery.where('public_en', isEqualTo: true)).thenReturn(mockQuery);
        when(mockQuery.endBeforeDocument(any)).thenReturn(mockQuery);
        when(mockQuery.limitToLast(1)).thenReturn(mockQuery);
        when(mockQuery.startAfterDocument(any)).thenReturn(mockQuery);
        when(mockQuery.limit(1)).thenReturn(mockQuery);
        when(mockQuery.get()).thenAnswer((_) async => mockQuerySnapshot);
        when(mockQuerySnapshot.docs).thenReturn([]);
        when(mockDocSnapshot.exists).thenReturn(true);
        when(mockDocSnapshot.id).thenReturn('tutorial1');
        when(mockDocSnapshot.data()).thenReturn(tutorialData);

        final result = await firestoreService.getTutorialById('tutorial1', 'en');

        expect(result, isA<TutorialFirestoreModel>());
        verify(mockDocument.get()).called(1);
      });

      test('should throw exception when tutorial not found', () async {
        when(mockFirestore.collection('tutorials')).thenReturn(mockCollection);
        when(mockCollection.doc('tutorial1')).thenReturn(mockDocument);
        when(mockDocument.get()).thenAnswer((_) async => mockDocSnapshot);
        when(mockCollection.orderBy('index')).thenReturn(mockQuery);
        when(mockQuery.where('public_en', isEqualTo: true)).thenReturn(mockQuery);
        when(mockQuery.endBeforeDocument(any)).thenReturn(mockQuery);
        when(mockQuery.limitToLast(1)).thenReturn(mockQuery);
        when(mockQuery.startAfterDocument(any)).thenReturn(mockQuery);
        when(mockQuery.limit(1)).thenReturn(mockQuery);
        when(mockQuery.get()).thenAnswer((_) async => mockQuerySnapshot);
        when(mockQuerySnapshot.docs).thenReturn([]);
        when(mockDocSnapshot.exists).thenReturn(false);

        expect(
          () => firestoreService.getTutorialById('tutorial1', 'en'),
          throwsA(isA<Exception>()),
        );
      });
    });

    group('getFirstExerciseId', () {
      test('should return first exercise id when exists', () async {
        when(mockFirestore.collection('tutorials')).thenReturn(mockCollection);
        when(mockCollection.doc('tutorial1')).thenReturn(mockDocument);
        when(mockDocument.collection('exercises_en')).thenReturn(mockCollection);
        when(mockCollection.orderBy('order_number')).thenReturn(mockQuery);
        when(mockQuery.limit(1)).thenReturn(mockQuery);
        when(mockQuery.get()).thenAnswer((_) async => mockQuerySnapshot);
        when(mockQuerySnapshot.docs).thenReturn([mockQueryDocSnapshot]);
        when(mockQueryDocSnapshot.id).thenReturn('exercise1');

        final result = await firestoreService.getFirstExerciseId(
          tutorialId: 'tutorial1',
          languageCode: 'en',
        );

        expect(result, equals('exercise1'));
      });

      test('should return null when no exercises exist', () async {
        when(mockFirestore.collection('tutorials')).thenReturn(mockCollection);
        when(mockCollection.doc('tutorial1')).thenReturn(mockDocument);
        when(mockDocument.collection('exercises_en')).thenReturn(mockCollection);
        when(mockCollection.orderBy('order_number')).thenReturn(mockQuery);
        when(mockQuery.limit(1)).thenReturn(mockQuery);
        when(mockQuery.get()).thenAnswer((_) async => mockQuerySnapshot);
        when(mockQuerySnapshot.docs).thenReturn([]);

        final result = await firestoreService.getFirstExerciseId(
          tutorialId: 'tutorial1',
          languageCode: 'en',
        );

        expect(result, isNull);
      });
    });
  });
}