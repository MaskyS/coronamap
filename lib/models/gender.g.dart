// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gender.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gender _$GenderFromJson(Map<String, dynamic> json) {
  return Gender(
    label: json['label'] as String,
    ref: json['ref'] as String,
  );
}

Map<String, dynamic> _$GenderToJson(Gender instance) => <String, dynamic>{
      'label': instance.label,
      'ref': instance.ref,
    };
