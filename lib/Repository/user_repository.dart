import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coronamapp/models/user.dart';

class UserRepository {
  final dbName = 'user';

  Future<void> save(User user) {
    return Firestore.instance
        .collection(dbName)
        .document(user.phoneNumber)
        .setData(user.toJson());
  }

  Future<DocumentSnapshot> getByPhoneNumber(String phoneNumber) {
    return Firestore.instance.collection(dbName).document(phoneNumber).get();
  }
}
