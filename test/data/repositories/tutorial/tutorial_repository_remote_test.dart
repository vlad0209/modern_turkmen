import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modern_turkmen/data/repositories/tutorial/tutorial_repository_remote.dart';
import 'package:modern_turkmen/data/services/firestore/firestore_service.dart';
import 'package:modern_turkmen/data/services/firestore/model/tutorial/tutorial_firestore_model.dart';
import 'package:modern_turkmen/data/services/shared_preferences_service.dart';
import 'package:modern_turkmen/domain/models/tutorial/tutorial.dart';

import 'tutorial_repository_remote_test.mocks.dart';

@GenerateMocks([FirestoreService, SharedPreferencesService])
void main() {
  late TutorialRepositoryRemote repository;
  late MockFirestoreService mockFirestoreService;
  late MockSharedPreferencesService mockSharedPreferencesService;

  setUp(() {
    mockFirestoreService = MockFirestoreService();
    mockSharedPreferencesService = MockSharedPreferencesService();
    repository = TutorialRepositoryRemote(
      firestoreService: mockFirestoreService,
      sharedPreferencesService: mockSharedPreferencesService,
    );
  });

  group('TutorialRepositoryRemote', () {
    test('getTutorialsStream returns stream of tutorials', () async {
      // Arrange
      const languageCode = 'en';
      final mockTutorialModel = MockTutorialFirestoreModel();
      when(mockSharedPreferencesService.getPreferredLanguageCode())
          .thenAnswer((_) async => languageCode);
      when(mockFirestoreService.getPublicTutorialsStream(languageCode))
          .thenAnswer((_) => Stream.value([mockTutorialModel]));
      when(mockTutorialModel.id).thenReturn('1');
      when(mockTutorialModel.thumbUrl).thenReturn('thumb.jpg');
      when(mockTutorialModel.imageUrl).thenReturn('image.jpg');
      when(mockTutorialModel.prevTutorialId).thenReturn('0');
      when(mockTutorialModel.nextTutorialId).thenReturn('2');
      when(mockTutorialModel.toJson()).thenReturn({
        'title': {'en': 'Test Title'},
        'content': {'en': 'Test Content'},
      });

      // Act
      final stream = repository.getTutorialsStream();
      final result = await stream.first;

      // Assert
      expect(result, isA<List<Tutorial>>());
      expect(result.length, 1);
      expect(result.first.id, '1');
    });

    test('getNextTutorialId returns next tutorial id', () async {
      // Arrange
      const tutorialId = '1';
      const languageCode = 'en';
      const expectedNextId = '2';
      when(mockSharedPreferencesService.getPreferredLanguageCode())
          .thenAnswer((_) async => languageCode);
      when(mockFirestoreService.getNextTutorialId(
        tutorialId: tutorialId,
        languageCode: languageCode,
      )).thenAnswer((_) async => expectedNextId);

      // Act
      final result = await repository.getNextTutorialId(tutorialId: tutorialId);

      // Assert
      expect(result, expectedNextId);
      verify(mockFirestoreService.getNextTutorialId(
        tutorialId: tutorialId,
        languageCode: languageCode,
      )).called(1);
    });

    test('getTutorial returns tutorial by id', () async {
      // Arrange
      const tutorialId = '1';
      const languageCode = 'en';
      final mockTutorialModel = MockTutorialFirestoreModel();
      when(mockSharedPreferencesService.getPreferredLanguageCode())
          .thenAnswer((_) async => languageCode);
      when(mockFirestoreService.getTutorialById(tutorialId, languageCode))
          .thenAnswer((_) async => mockTutorialModel);
      when(mockTutorialModel.id).thenReturn(tutorialId);
      when(mockTutorialModel.thumbUrl).thenReturn('thumb.jpg');
      when(mockTutorialModel.imageUrl).thenReturn('image.jpg');
      when(mockTutorialModel.prevTutorialId).thenReturn('0');
      when(mockTutorialModel.nextTutorialId).thenReturn('2');
      when(mockTutorialModel.toJson()).thenReturn({
        'title': {'en': 'Test Title'},
        'content': {'en': 'Test Content'},
      });

      // Act
      final result = await repository.getTutorial(tutorialId);

      // Assert
      expect(result, isA<Tutorial>());
      expect(result.id, tutorialId);
      verify(mockFirestoreService.getTutorialById(tutorialId, languageCode))
          .called(1);
    });

    test('bookmarkTutorial calls shared preferences service', () {
      // Arrange
      const tutorialId = '1';

      // Act
      repository.bookmarkTutorial(tutorialId);

      // Assert
      verify(mockSharedPreferencesService.bookmarkTutorial(tutorialId))
          .called(1);
    });

    test('getBookmarkedTutorialId returns bookmarked tutorial id', () async {
      // Arrange
      const expectedId = '1';
      when(mockSharedPreferencesService.getBookmarkedTutorialId())
          .thenAnswer((_) async => expectedId);

      // Act
      final result = await repository.getBookmarkedTutorialId();

      // Assert
      expect(result, expectedId);
      verify(mockSharedPreferencesService.getBookmarkedTutorialId()).called(1);
    });
  });
}

@GenerateMocks([Object])
class MockTutorialFirestoreModel extends Mock implements TutorialFirestoreModel {
  @override
  String get id => super.noSuchMethod(Invocation.getter(#id), returnValue: '');
  @override
  String get thumbUrl => super.noSuchMethod(Invocation.getter(#thumbUrl), returnValue: '');
  @override
  String get imageUrl => super.noSuchMethod(Invocation.getter(#imageUrl), returnValue: '');
  @override
  String? get prevTutorialId => super.noSuchMethod(Invocation.getter(#prevTutorialId));
  @override
  String? get nextTutorialId => super.noSuchMethod(Invocation.getter(#nextTutorialId));
  @override
  Map<String, dynamic> toJson() => super.noSuchMethod(Invocation.method(#toJson, []), returnValue: <String, dynamic>{});
}