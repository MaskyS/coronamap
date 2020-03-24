import 'package:coronamapp/models/condition.dart';
import 'package:mobx/mobx.dart';
part 'conditions_step_store.g.dart';

class ConditionsStepStore = _ConditionsStepStoreBase with _$ConditionsStepStore;

abstract class _ConditionsStepStoreBase with Store {
  final List<Condition> preExistingConditionList = [
    Condition(label: 'Asthma', ref: 'asthma'),
    Condition(label: 'Diabetes', ref: 'diabetes'),
    Condition(
        label: 'Insuffisance cardiaque chronique',
        ref: 'chronic_heart_failure'),
    Condition(
      label: 'Maladie rénale chronique',
      ref: 'chronic_kidney_disease',
    ),
    Condition(
        label: 'Maladie hépatique chronique',
        ref: 'chronic_liver_disease'),
    Condition(label: 'Grossesse', ref: 'pregnant'),
    Condition(label: 'HIV', ref: 'hiv'),
  ];

  @observable
  List<Condition> chosenConditionsList;

  @computed
  bool get hasConditions => chosenConditionsList != null;
  // ! TODO Allow adding other conditions not in the list.

  @action
  setConditions(List<Condition> conditions) {
    chosenConditionsList = conditions;
  }
}
