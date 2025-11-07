import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modern_turkmen/data/services/firestore/model/tutorial/tutorial_firestore_model.dart';

import 'model/exercise/exercise_firestore_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore;

  FirestoreService(this._firestore);
  Stream<List<TutorialFirestoreModel>> getPublicTutorialsStream(
      String localeName) {
    return _firestore
        .collection('tutorials')
        .where('public_$localeName', isEqualTo: true)
        .orderBy('index')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => TutorialFirestoreModel.fromJson({
                'id': doc.id,
                ...doc.data(),
              }))
          .toList();
    });
  }

  Future<ExerciseFirestoreModel> getExerciseById(
      String tutorialId, String languageCode, String exerciseId) async {
    final docSnapshot = await _firestore
        .collection('tutorials')
        .doc(tutorialId)
        .collection('exercises_$languageCode')
        .doc(exerciseId)
        .get();

    if (docSnapshot.exists) {
      return ExerciseFirestoreModel.fromJson({
        'id': docSnapshot.id,
        ...docSnapshot.data()!,
      });
    } else {
      throw Exception('Exercise not found');
    }
  }

  Future<String?> getNextExerciseId(
      {required String tutorialId,
      required String languageCode,
      required String currentExerciseId}) async {
    final exercisesRef = _firestore
        .collection('tutorials')
        .doc(tutorialId)
        .collection('exercises_$languageCode');

    final snapshot = exercisesRef.doc(currentExerciseId).get();

    var nextExerciseSnapshot = await exercisesRef
        .orderBy('order_number')
        .startAfterDocument(await snapshot)
        .limit(1)
        .get();
    String? nextExerciseId;
    if (nextExerciseSnapshot.docs.isNotEmpty) {
      nextExerciseId = nextExerciseSnapshot.docs.first.id;
    }
    return nextExerciseId;
  }

  Future<String?> getNextTutorialId({required String tutorialId, required String languageCode}) async {
    String? nextTutorialId;
      final CollectionReference tutorialsRef =
            _firestore.collection('tutorials');
        final next = await tutorialsRef
            .orderBy('index')
            .where('public_$languageCode', isEqualTo: true)
            .startAfterDocument(await tutorialsRef.doc(tutorialId).get())
            .limit(1)
            .get();

        if (next.docs.isNotEmpty) {
          nextTutorialId = next.docs.first.id;
        }
    return nextTutorialId;
  }

  Future getTutorialById(String tutorialId, String languageCode) async {
    final tutorialsRef = _firestore.collection('tutorials');
    final docSnapshot =
        await tutorialsRef.doc(tutorialId).get();
    final query = tutorialsRef
            .orderBy('index')
            .where('public_$languageCode', isEqualTo: true);
    final prev = await query.endBeforeDocument(docSnapshot).limitToLast(1).get();
    final prevTutorialId = prev.docs.isNotEmpty ? prev.docs.first.id : null;
    final next = await query.startAfterDocument(docSnapshot).limit(1).get();
    final nextTutorialId = next.docs.isNotEmpty ? next.docs.first.id : null;
    
    if (docSnapshot.exists) {
      return TutorialFirestoreModel.fromJson({
        'id': docSnapshot.id,
        ...docSnapshot.data()!,
        'prevTutorialId': prevTutorialId,
        'nextTutorialId': nextTutorialId,
      });
    } else {
      throw Exception('Tutorial not found');
    }
  }

  Future<String?> getFirstExerciseId({required String tutorialId, required String languageCode}) async {
    final exercisesRef = _firestore
        .collection('tutorials')
        .doc(tutorialId)
        .collection('exercises_$languageCode');

    final firstExerciseSnapshot = await exercisesRef
        .orderBy('order_number')
        .limit(1)
        .get();

    String? firstExerciseId;
    if (firstExerciseSnapshot.docs.isNotEmpty) {
      firstExerciseId = firstExerciseSnapshot.docs.first.id;
    }
    return firstExerciseId;
  }
}
