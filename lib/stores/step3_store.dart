import 'package:coronamapp/repository/symptom_repository.dart';
import 'package:coronamapp/models/symptom.dart';
import 'package:mobx/mobx.dart';

import 'package:coronamapp/store_state_enum.dart';
import 'package:coronamapp/risk_enum.dart';
part 'step3_store.g.dart';

class Step3Store = _Step3StoreBase with _$Step3Store;

abstract class _Step3StoreBase with Store {
  @observable
  List<Symptom> chosenSymptoms = [];

  @observable
  String otherSymptoms;

  @observable
  ObservableFuture<List<Symptom>> _symptomsListFuture;

  @observable
  String errorMessage;

  @observable
  List<Symptom> symptomsList = <Symptom>[];

  /// First date symptoms observed.
  @observable
  DateTime firstDate;

  @observable
  String chosenSymptomsErrorText;

  @observable
  String firstDateErrorText;

  @observable
  Risk risk;

  @computed
  bool get canCompleteForm =>
      chosenSymptomsErrorText == null && firstDateErrorText == null;

  @computed
  bool get hasSymptoms => chosenSymptoms.isNotEmpty || otherSymptoms != null;

  @computed
  StoreState get state {
    if (_symptomsListFuture == null ||
        _symptomsListFuture.status == FutureStatus.rejected) {
      return StoreState.initial;
    }

    return _symptomsListFuture.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  void calculateRisk(int age, bool hasPreExistingConditions) {
    if (chosenSymptoms.isEmpty) return;
    int sum;
    sum = chosenSymptoms.fold<int>(0,
        (previousValue, element) => previousValue + (element.riskFactor ?? 0));

    int severeSum;
    int atRiskSum;

    if (age > 60) {
      if (hasPreExistingConditions) {
        risk = Risk.severe;
        return;
      }

      severeSum = 10;
      atRiskSum = 9;
    } else {
      severeSum = (hasPreExistingConditions) ? 15 : 20;
      atRiskSum = (hasPreExistingConditions) ? 9 : 14;
    }

    if (sum > severeSum) {
      risk = Risk.severe;
    } else if (sum > atRiskSum) {
      risk = Risk.atRisk;
    } else {
      risk = Risk.mild;
    }
  }

  List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => firstDate, validateFirstDate),
    ];
  }


  @action
  void validateFirstDate(DateTime dateTime) {
    if (hasSymptoms) {
      firstDateErrorText = dateTime == null ? 'must_fill_date_infection' : null;
    }
  }

  void validateAll() {
    validateFirstDate(firstDate);
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  @action
  Future<void> getSymptomsFromFirestore() async {
    try {
      _symptomsListFuture =
          ObservableFuture(SymptomRepository().getAllWithLimit());
      symptomsList = await _symptomsListFuture;
    } catch (e) {
      print(e);
    }
  }
}
