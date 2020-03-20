// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Symptom _$SymptomFromJson(Map<String, dynamic> json) {
  return Symptom(
    label: json['label'] as String,
    ref: json['ref'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$SymptomToJson(Symptom instance) => <String, dynamic>{
      'label': instance.label,
      'ref': instance.ref,
      'description': instance.description,
    };
