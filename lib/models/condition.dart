
import 'package:json_annotation/json_annotation.dart';
part 'condition.g.dart';

@JsonSerializable()
class Condition {
  String ref;
  String label;

  Condition({this.ref, this.label});
    Condition.create({this.label, this.ref});

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);
  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}