import 'package:coronamapp/models/gender.dart';
import 'package:coronamapp/models/geolocation.dart';
import 'package:coronamapp/models/symptom.dart';
import 'package:coronamapp/models/address.dart';

class User {
  String firstName;
  String lastName;
  Gender gender;
  Location location;
  String phoneNumber;
  List<Symptom> symptoms;
  Address address;
  String firstSymptomDate;
  String dob;
  String createdAt;
  String updatedAt;

  User({
    this.firstName,
    this.lastName,
    this.gender,
    this.location,
    this.phoneNumber,
    this.symptoms,
    this.address,
    this.firstSymptomDate,
    this.dob,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json["firstName"],
    lastName: json["lastName"],
    gender: Gender.fromJson(json["gender"]),
    location: Location.fromJson(json["location"]),
    phoneNumber: json["phoneNumber"],
    symptoms: List<Symptom>.from(json["symptoms"].map((x) => Symptom.fromJson(x))),
    address: Address.fromJson(json["address"]),
    firstSymptomDate: json["firstSymptomDate"],
    dob: json["dob"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "gender": gender.toJson(),
    "location": location.toJson(),
    "phoneNumber": phoneNumber,
    "symptoms": List<dynamic>.from(symptoms.map((x) => x.toJson())),
    "address": address.toJson(),
    "firstSymptomDate": firstSymptomDate,
    "dob": dob,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}