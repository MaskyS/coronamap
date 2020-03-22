import 'package:coronamapp/models/condition.dart';
import 'package:coronamapp/models/gender.dart';
import 'package:coronamapp/models/geolocation.dart';
import 'package:coronamapp/models/symptom.dart';
import 'package:coronamapp/models/address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String firstName;
  String lastName;
  Gender gender;
  Location location;
  String phoneNumber;
  List<Symptom> symptoms;
  List<Condition> preExistingConditions;
  Address address;
  DateTime firstSymptomDate;
  DateTime dob;
  DateTime createdAt;
  DateTime updatedAt;
  String risk;

  User({
    this.firstName,
    this.lastName,
    this.gender,
    this.location,
    this.phoneNumber,
    this.preExistingConditions,
    this.symptoms,
    this.address,
    this.firstSymptomDate,
    this.dob,
    this.createdAt,
    this.updatedAt,
    this.risk,
  });

  User.fromForm({
    this.firstName,
    this.lastName,
    this.gender,
    this.phoneNumber,
    this.address,
    this.dob,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
