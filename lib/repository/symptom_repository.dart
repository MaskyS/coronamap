import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depistazmu/models/symptom.dart';

class SymptomRepository {
  final dbName = 'symptoms';

  Future<Symptom> findByRef(String ref) {
    return Firestore.instance
        .collection(dbName)
        .where('ref', isEqualTo: ref)
        .getDocuments()
        .then((snapshot) {
      return snapshot.documents
          .map((doc) => Symptom.fromJson(doc.data['symptom']))
          .toList()
          .first;
    });
  }

  Future<List<Symptom>> getAllWithLimit({int limit = 10}) {
    return Firestore.instance
        .collection(dbName)
        .limit(limit)
        .getDocuments()
        .then(
      (snapshot) {
        return snapshot.documents.map((doc) {
          return Symptom.fromJson(doc.data['symptom']);
        }).toList();
      },
    );
  }
}
