// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    gender: json['gender'] == null
        ? null
        : Gender.fromJson(json['gender'] as Map<String, dynamic>),
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    phoneNumber: json['phoneNumber'] as String,
    preExistingConditions: (json['preExistingConditions'] as List)
        ?.map((e) =>
            e == null ? null : Condition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    symptoms: (json['symptoms'] as List)
        ?.map((e) =>
            e == null ? null : Symptom.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    firstSymptomDate: json['firstSymptomDate'] == null
        ? null
        : DateTime.parse(json['firstSymptomDate'] as String),
    dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    risk: json['risk'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'location': instance.location,
      'phoneNumber': instance.phoneNumber,
      'symptoms': instance.symptoms,
      'preExistingConditions': instance.preExistingConditions,
      'address': instance.address,
      'firstSymptomDate': instance.firstSymptomDate?.toIso8601String(),
      'dob': instance.dob?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'risk': instance.risk,
    };
