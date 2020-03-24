import 'package:depistazmu/models/condition.dart';
import 'package:depistazmu/models/gender.dart';
import 'package:depistazmu/models/geolocation.dart';
import 'package:depistazmu/models/necessity.dart';
import 'package:depistazmu/models/symptom.dart';
import 'package:depistazmu/models/address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String firstName;
  String lastName;
  Gender gender;
  Location location;
  String phoneNumber;
  String homeNumber;
  List<Symptom> symptoms;
  List<Condition> preExistingConditions;
  List<Necessity> necessities;
  bool isEmergency;
  Address address;
  DateTime firstSymptomDate;
  DateTime dob;
  int age;
  DateTime createdAt;
  DateTime updatedAt;
  String risk;

  User({
    this.firstName,
    this.lastName,
    this.gender,
    this.location,
    this.phoneNumber,
    this.homeNumber,
    this.preExistingConditions,
    this.necessities,
    this.isEmergency,
    this.symptoms,
    this.address,
    this.firstSymptomDate,
    this.dob,
    this.age,
    this.createdAt,
    this.updatedAt,
    this.risk,
  });

  User.fromForm({
    this.firstName,
    this.lastName,
    this.gender,
    this.phoneNumber,
    this.homeNumber,
    this.address,
    this.dob,
    this.age,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
