import 'package:json_annotation/json_annotation.dart';
part 'symptom.g.dart';

@JsonSerializable()
class Symptom {
  String label;
  String ref;
  String description;
  int riskFactor;

  Symptom({
    this.label,
    this.ref,
    this.description,
    this.riskFactor,
  });

  factory Symptom.fromJson(Map<String, dynamic> json) =>
      _$SymptomFromJson(json);
  Map<String, dynamic> toJson() => _$SymptomToJson(this);
}
