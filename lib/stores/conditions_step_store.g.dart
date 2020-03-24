// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conditions_step_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConditionsStepStore on _ConditionsStepStoreBase, Store {
  Computed<bool> _$hasConditionsComputed;

  @override
  bool get hasConditions =>
      (_$hasConditionsComputed ??= Computed<bool>(() => super.hasConditions))
          .value;

  final _$chosenConditionsListAtom =
      Atom(name: '_ConditionsStepStoreBase.chosenConditionsList');

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

  final _$_ConditionsStepStoreBaseActionController =
      ActionController(name: '_ConditionsStepStoreBase');

  @override
  dynamic setConditions(List<Condition> conditions) {
    final _$actionInfo =
        _$_ConditionsStepStoreBaseActionController.startAction();
    try {
      return super.setConditions(conditions);
    } finally {
      _$_ConditionsStepStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'chosenConditionsList: ${chosenConditionsList.toString()},hasConditions: ${hasConditions.toString()}';
    return '{$string}';
  }
}
