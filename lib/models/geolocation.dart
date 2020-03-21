import 'package:json_annotation/json_annotation.dart';
part 'geolocation.g.dart';

@JsonSerializable()
class Location {
  String latitude;
  String longitude;
  String positionBasedAddress;

  Location({
    this.latitude,
    this.longitude,
    this.positionBasedAddress,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
