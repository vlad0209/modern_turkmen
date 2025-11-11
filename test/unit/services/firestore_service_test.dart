import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/services/firestore_service.dart';

void main() {
  group('FirestoreService', () {
    test('should return data when fetching documents', () async {
      final firestoreService = FirestoreService();
      final data = await firestoreService.fetchDocuments();
      expect(data, isNotNull);
      expect(data, isA<List>());
    });

    test('should add a document successfully', () async {
      final firestoreService = FirestoreService();
      final result = await firestoreService.addDocument({'key': 'value'});
      expect(result, isTrue);
    });

    test('should delete a document successfully', () async {
      final firestoreService = FirestoreService();
      final result = await firestoreService.deleteDocument('documentId');
      expect(result, isTrue);
    });
  });
}