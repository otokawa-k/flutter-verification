import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:memora/infrastructure/repositories/firestore_pin_repository.dart';

@GenerateMocks([
  FirebaseFirestore,
  CollectionReference,
  DocumentReference,
  QuerySnapshot,
  QueryDocumentSnapshot,
])
import 'firestore_pin_repository_test.mocks.dart';

void main() {
  group('FirestorePinRepository', () {
    late MockFirebaseFirestore mockFirestore;
    late MockCollectionReference<Map<String, dynamic>> mockCollection;
    late FirestorePinRepository repository;
    late MockQuerySnapshot<Map<String, dynamic>> mockQuerySnapshot;
    late MockQueryDocumentSnapshot<Map<String, dynamic>> mockDoc1;
    late MockQueryDocumentSnapshot<Map<String, dynamic>> mockDoc2;

    setUp(() {
      mockFirestore = MockFirebaseFirestore();
      mockCollection = MockCollectionReference<Map<String, dynamic>>();
      mockQuerySnapshot = MockQuerySnapshot<Map<String, dynamic>>();
      mockDoc1 = MockQueryDocumentSnapshot<Map<String, dynamic>>();
      mockDoc2 = MockQueryDocumentSnapshot<Map<String, dynamic>>();
      when(mockFirestore.collection('pins')).thenReturn(mockCollection);
      repository = FirestorePinRepository(firestore: mockFirestore);
    });

    test('savePinがpins collectionにpinId, latitude, longitudeをaddする', () async {
      const pinId = 'test-marker-id';
      const latitude = 35.0;
      const longitude = 139.0;
      when(
        mockCollection.add(any),
      ).thenAnswer((_) async => MockDocumentReference<Map<String, dynamic>>());

      await repository.savePin(pinId, latitude, longitude);

      verify(
        mockCollection.add(
          argThat(
            allOf(
              containsPair('pinId', pinId),
              containsPair('latitude', latitude),
              containsPair('longitude', longitude),
              contains('createdAt'),
            ),
          ),
        ),
      ).called(1);
    });

    test('getPinsがFirestoreからPinのリストを返す', () async {
      when(mockCollection.get()).thenAnswer((_) async => mockQuerySnapshot);
      when(mockQuerySnapshot.docs).thenReturn([mockDoc1, mockDoc2]);
      when(mockDoc1.id).thenReturn('abc123');
      when(
        mockDoc1.data(),
      ).thenReturn({'pinId': 'def123', 'latitude': 35.0, 'longitude': 139.0});
      when(mockDoc2.id).thenReturn('abc456');
      when(
        mockDoc2.data(),
      ).thenReturn({'pinId': 'def456', 'latitude': 36.0, 'longitude': 140.0});

      final result = await repository.getPins();

      expect(result.length, 2);
      expect(result[0].id, 'abc123');
      expect(result[0].pinId, 'def123');
      expect(result[0].latitude, 35.0);
      expect(result[0].longitude, 139.0);
      expect(result[1].id, 'abc456');
      expect(result[1].pinId, 'def456');
      expect(result[1].latitude, 36.0);
      expect(result[1].longitude, 140.0);
    });

    test('getPinsがエラー時に空のリストを返す', () async {
      when(mockCollection.get()).thenThrow(Exception('Firestore error'));

      final result = await repository.getPins();

      expect(result, isEmpty);
    });

    test('deletePinがpins collectionの該当ドキュメントを削除する', () async {
      const pinId = 'test-marker-id';
      final mockDocRef = MockDocumentReference<Map<String, dynamic>>();

      when(
        mockCollection.where('pinId', isEqualTo: pinId),
      ).thenReturn(mockCollection);
      when(mockCollection.get()).thenAnswer((_) async => mockQuerySnapshot);
      when(mockQuerySnapshot.docs).thenReturn([mockDoc1]);
      when(mockDoc1.id).thenReturn('dummy_id');
      when(mockFirestore.collection('pins')).thenReturn(mockCollection);
      when(mockCollection.doc('dummy_id')).thenReturn(mockDocRef);
      when(mockDocRef.delete()).thenAnswer((_) async {});

      await repository.deletePin(pinId);

      verify(mockCollection.where('pinId', isEqualTo: pinId)).called(1);
      verify(mockCollection.get()).called(1);
      verify(mockCollection.doc('dummy_id')).called(1);
      verify(mockDocRef.delete()).called(1);
    });
  });
}
