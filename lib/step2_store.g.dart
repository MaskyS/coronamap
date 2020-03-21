// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step2_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Step2Store on _Step2StoreBase, Store {
  Computed<bool> _$hasConditionsComputed;

  @override
  bool get hasConditions =>
      (_$hasConditionsComputed ??= Computed<bool>(() => super.hasConditions))
          .value;

  final _$chosenConditionsListAtom =
      Atom(name: '_Step2StoreBase.chosenConditionsList');

  @override
  List<Condition> get chosenConditionsList {
    _$chosenConditionsListAtom.context
        .enforceReadPolicy(_$chosenConditionsListAtom);
    _$chosenConditionsListAtom.reportObserved();
    return super.chosenConditionsList;
  }

  @override
  set chosenConditionsList(List<Condition> value) {
    _$chosenConditionsListAtom.context.conditionallyRunInAction(() {
      super.chosenConditionsList = value;
      _$chosenConditionsListAtom.reportChanged();
    }, _$chosenConditionsListAtom,
        name: '${_$chosenConditionsListAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'chosenConditionsList: ${chosenConditionsList.toString()},hasConditions: ${hasConditions.toString()}';
    return '{$string}';
  }
}
