import 'package:coronamapp/models/condition.dart';
import 'package:mobx/mobx.dart';
part 'step2_store.g.dart';

class Step2Store = _Step2StoreBase with _$Step2Store;

abstract class _Step2StoreBase with Store {
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
  // @observable
  // bool hasOtherConditions;

  // @observable
  // String otherConditions;
}
