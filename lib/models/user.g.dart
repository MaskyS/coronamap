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
    symptoms: (json['symptoms'] as List)
        ?.map((e) =>
            e == null ? null : Symptom.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    firstSymptomDate: json['firstSymptomDate'] as String,
    dob: json['dob'] as String,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'location': instance.location,
      'phoneNumber': instance.phoneNumber,
      'symptoms': instance.symptoms,
      'address': instance.address,
      'firstSymptomDate': instance.firstSymptomDate,
      'dob': instance.dob,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
