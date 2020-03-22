import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coronamapp/models/user.dart';

class GenderRepository {
  final dbName = 'gender';

  Future<QuerySnapshot> getAll(String phoneNumber)
  {
    return Firestore.instance.collection(dbName).getDocuments();
  }
}
