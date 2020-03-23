import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'address.g.dart';

@JsonSerializable()
class Address extends _AddressBase with _$Address {
  Address({
    String line1,
    String line2,
    String region,
  }) : super(
          line1: line1,
          line2: line2,
          region: region,
        );


  Address.fromForm({line1, line2, region});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

abstract class _AddressBase with Store {
  _AddressBase({
    @required this.line1,
    this.line2,
    @required this.region,
  });

  @observable
  String line1;

  @observable
  String line2;


  @observable
  String region;
}
