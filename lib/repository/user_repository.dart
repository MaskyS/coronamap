import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coronamapp/models/user.dart';
import 'package:coronamapp/utils/utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepository {
  final dbName = 'users-re';

  Future<void> save(User user) async {
    String hash = generateMd5(user.phoneNumber +
        user.dob.year.toString() +
        user.firstName +
        user.lastName);

    var jsonString = json.encode(user);
    Firestore.instance
        .collection(dbName)
        .document(hash)
        .setData(json.decode(jsonString));

    final storage = FlutterSecureStorage();
    storage.write(key: 'userKey', value: hash);

    return hash;
  }

  Future<User> getByHash(String hash) {
    return Firestore.instance
        .collection(dbName)
        .document(hash)
        .get()
        .then((value) => value.data != null ? User.fromJson(value.data) : null);
  }
}
