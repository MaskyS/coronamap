import 'package:json_annotation/json_annotation.dart';
part 'geolocation.g.dart';

@JsonSerializable()
class Location {
  String latitude;
  String longitude;

  Location({
    this.latitude,
    this.longitude,
  });
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
