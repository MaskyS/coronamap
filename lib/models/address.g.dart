// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    line1: json['line1'] as String,
    line2: json['line2'] as String,
    region: json['region'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'line1': instance.line1,
      'line2': instance.line2,
      'region': instance.region,
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
        'line1: ${line1.toString()},line2: ${line2.toString()},region: ${region.toString()}';
    return '{$string}';
  }
}
