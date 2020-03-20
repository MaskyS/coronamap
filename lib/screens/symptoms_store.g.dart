// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptoms_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Form2Store on _Form2StoreBase, Store {
  final _$chosenSymptomsAtom = Atom(name: '_Form2StoreBase.chosenSymptoms');

  @override
  List<Symptom> get chosenSymptoms {
    _$chosenSymptomsAtom.context.enforceReadPolicy(_$chosenSymptomsAtom);
    _$chosenSymptomsAtom.reportObserved();
    return super.chosenSymptoms;
  }

  @override
  set chosenSymptoms(List<Symptom> value) {
    _$chosenSymptomsAtom.context.conditionallyRunInAction(() {
      super.chosenSymptoms = value;
      _$chosenSymptomsAtom.reportChanged();
    }, _$chosenSymptomsAtom, name: '${_$chosenSymptomsAtom.name}_set');
  }

  final _$firstDateSymptomsObservedAtom =
      Atom(name: '_Form2StoreBase.firstDateSymptomsObserved');

  @override
  DateTime get firstDateSymptomsObserved {
    _$firstDateSymptomsObservedAtom.context
        .enforceReadPolicy(_$firstDateSymptomsObservedAtom);
    _$firstDateSymptomsObservedAtom.reportObserved();
    return super.firstDateSymptomsObserved;
  }

  @override
  set firstDateSymptomsObserved(DateTime value) {
    _$firstDateSymptomsObservedAtom.context.conditionallyRunInAction(() {
      super.firstDateSymptomsObserved = value;
      _$firstDateSymptomsObservedAtom.reportChanged();
    }, _$firstDateSymptomsObservedAtom,
        name: '${_$firstDateSymptomsObservedAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'chosenSymptoms: ${chosenSymptoms.toString()},firstDateSymptomsObserved: ${firstDateSymptomsObserved.toString()}';
    return '{$string}';
  }
}
