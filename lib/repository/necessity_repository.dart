import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depistazmu/models/necessity.dart';

class NecessityRepository {
  final dbName = 'necessities';

  Future<Necessity> findByRef(String ref) {
    return Firestore.instance
        .collection(dbName)
        .where('ref', isEqualTo: ref)
        .getDocuments()
        .then((snapshot) {
      return snapshot.documents
          .map((doc) => Necessity.fromJson(doc.data['necessity']))
          .toList()
          .first;
    });
  }

  Future<List<Necessity>> getAllWithLimit({int limit = 10}) {
    return Firestore.instance
        .collection(dbName)
        .limit(limit)
        .getDocuments()
        .then(
      (snapshot) {
        return snapshot.documents.map((doc) {
          return Necessity.fromJson(doc.data['necessity']);
        }).toList();
      },
    );
  }
}
