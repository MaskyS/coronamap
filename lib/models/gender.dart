import 'package:json_annotation/json_annotation.dart';
part 'gender.g.dart';

@JsonSerializable()
class Gender {
  String label;
  String ref;

  Gender({
    this.label,
    this.ref,
  });

  factory Gender.fromJson(Map<String, dynamic> json) =>
      _$GenderFromJson(json);
  Map<String, dynamic> toJson() => _$GenderToJson(this);
}