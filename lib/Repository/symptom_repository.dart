import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coronamapp/Entity/user.dart';

class SymptomRepository {
  final dbName = 'symptom';

  Future<QuerySnapshot> findByRef(String ref)
  {
    return Firestore.instance.collection(dbName).where('ref', isEqualTo: ref).getDocuments();
  }

  Future<QuerySnapshot> getAllWithLimit({int limit = 10})
  {
    return Firestore.instance.collection(dbName).orderBy('ref').limit(limit).getDocuments();
  }
}