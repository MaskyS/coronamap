import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coronamapp/models/user.dart';
import 'package:coronamapp/utils/utils.dart';

class UserRepository {
  final dbName = 'users';

  Future<void> save(User user) {
    String hash = generateMd5(user.phoneNumber+user.dob.year.toString()+user.firstName+user.lastName);

    var jsonString = json.encode(user);
    return Firestore.instance
        .collection(dbName)
        .document(hash)
        .setData(json.decode(jsonString));
  }

  Future<DocumentSnapshot> getByHash(String hash) {
    return Firestore.instance.collection(dbName).document(hash).get();
  }
}
