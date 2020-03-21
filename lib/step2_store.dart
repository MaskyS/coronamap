import 'package:coronamapp/models/condition.dart';
import 'package:mobx/mobx.dart';
part 'step2_store.g.dart';

class Step2Store = _Step2StoreBase with _$Step2Store;

abstract class _Step2StoreBase with Store {
  final List<Condition> preExistingConditionList = [
    Condition(label: 'Asthma', ref: 'Asthma'),
    Condition(label: 'Diabetes', ref: 'Diabetes'),
    Condition(
        label: 'Insuffisance cardiaque chronique',
        ref: 'Insuffisance cardiaque chronique'),
    Condition(
      label: 'Maladie rénale chronique',
      ref: 'Maladie rénale chronique',
    ),
    Condition(
        label: 'Maladie hépatique chronique',
        ref: 'Maladie hépatique chronique'),
    Condition(label: 'Grossesse', ref: 'Grossesse'),
    Condition(label: 'HIV', ref: 'HIV'),
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
