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

  @computed
  bool get canCompleteForm =>
      chosenSymptomsErrorText == null && firstDateErrorText == null;

  @observable
  Risk risk;

  @action
  void calculateRisk(int age, bool hasPreExistingConditions) {
    if (chosenSymptoms.isEmpty) return;
    int sum;
    sum = chosenSymptoms.fold<int>(
        0, (previousValue, element) => previousValue + (element.riskFactor ?? 0));

    if ((age > 60) && (hasPreExistingConditions)) {
      risk = Risk.severe;
    }

    int severeSum = 20;
    int atRiskSum = 15;

    if (age > 60) {
      severeSum = 10;
      atRiskSum = 0;
    } else if (hasPreExistingConditions) {
      severeSum = 15;
      atRiskSum = 9;
    }

    if (sum > severeSum) {
      risk = Risk.severe;
    } else if (sum > atRiskSum) {
      risk = Risk.atRisk;
    } else {
      risk = Risk.mild;
    }
  }

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

  List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => chosenSymptoms, validateChosenSymptoms),
      reaction((_) => firstDate, validateFirstDate),
    ];
  }

  @action
  void validateChosenSymptoms(List<Symptom> values) {
    if (values == null) {
      chosenSymptomsErrorText = "must_fill_symptoms";
    } else {
      chosenSymptomsErrorText = values.length < 1 ? 'must_fill_symptoms' : null;
    }
  }

  @action
  void validateFirstDate(DateTime dateTime) {
    firstDateErrorText = dateTime == null ? 'must_fill_date_infection' : null;
  }

  void validateAll() {
    validateChosenSymptoms(chosenSymptoms);
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
          ObservableFuture(SymptomRepository().getAllWithLimit(limit: 20));
      symptomsList = await _symptomsListFuture;
    } catch (e) {
      print(e);
    }
  }
}
