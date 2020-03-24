// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    line1: json['line1'] as String,
    line2: json['line2'] as String,
    district: _$enumDecodeNullable(_$DistrictEnumMap, json['district']),
    region: json['region'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'line1': instance.line1,
      'line2': instance.line2,
      'district': _$DistrictEnumMap[instance.district],
      'region': instance.region,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$DistrictEnumMap = {
  District.Flacq: 'Flacq',
  District.GrandPort: 'GrandPort',
  District.Moka: 'Moka',
  District.Pamplemousses: 'Pamplemousses',
  District.PlainesWilhems: 'PlainesWilhems',
  District.PortLouis: 'PortLouis',
  District.RiviereDuRempart: 'RiviereDuRempart',
  District.RiviereNoire: 'RiviereNoire',
  District.Savanne: 'Savanne',
};

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Address on _AddressBase, Store {
  final _$line1Atom = Atom(name: '_AddressBase.line1');

  @override
  String get line1 {
    _$line1Atom.context.enforceReadPolicy(_$line1Atom);
    _$line1Atom.reportObserved();
    return super.line1;
  }

  @override
  set line1(String value) {
    _$line1Atom.context.conditionallyRunInAction(() {
      super.line1 = value;
      _$line1Atom.reportChanged();
    }, _$line1Atom, name: '${_$line1Atom.name}_set');
  }

  final _$line2Atom = Atom(name: '_AddressBase.line2');

  @override
  String get line2 {
    _$line2Atom.context.enforceReadPolicy(_$line2Atom);
    _$line2Atom.reportObserved();
    return super.line2;
  }

  @override
  set line2(String value) {
    _$line2Atom.context.conditionallyRunInAction(() {
      super.line2 = value;
      _$line2Atom.reportChanged();
    }, _$line2Atom, name: '${_$line2Atom.name}_set');
  }

  final _$districtAtom = Atom(name: '_AddressBase.district');

  @override
  District get district {
    _$districtAtom.context.enforceReadPolicy(_$districtAtom);
    _$districtAtom.reportObserved();
    return super.district;
  }

  @override
  set district(District value) {
    _$districtAtom.context.conditionallyRunInAction(() {
      super.district = value;
      _$districtAtom.reportChanged();
    }, _$districtAtom, name: '${_$districtAtom.name}_set');
  }

  final _$regionAtom = Atom(name: '_AddressBase.region');

  @override
  String get region {
    _$regionAtom.context.enforceReadPolicy(_$regionAtom);
    _$regionAtom.reportObserved();
    return super.region;
  }

  @override
  set region(String value) {
    _$regionAtom.context.conditionallyRunInAction(() {
      super.region = value;
      _$regionAtom.reportChanged();
    }, _$regionAtom, name: '${_$regionAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'line1: ${line1.toString()},line2: ${line2.toString()},district: ${district.toString()},region: ${region.toString()}';
    return '{$string}';
  }
}
