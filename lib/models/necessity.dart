import 'package:json_annotation/json_annotation.dart';
part 'necessity.g.dart';

@JsonSerializable()
class Necessity {
  String ref;
  String label;

  Necessity({this.ref, this.label});
    Necessity.create({this.label, this.ref});

  factory Necessity.fromJson(Map<String, dynamic> json) =>
      _$NecessityFromJson(json);
  Map<String, dynamic> toJson() => _$NecessityToJson(this);
}