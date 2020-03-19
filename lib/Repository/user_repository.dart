import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coronamapp/Entity/user.dart';

class UserRepository {
  final dbName = 'user';

  save(User user)
  {
    Firestore.instance.collection(dbName).document(user.phoneNumber).setData(user.toJson());
  }

  Future<DocumentSnapshot> getByPhoneNumber(String phoneNumber)
  {
    return Firestore.instance.collection(dbName).document(phoneNumber).get();
  }
}