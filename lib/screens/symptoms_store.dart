import 'package:coronamapp/Repository/symptom_repository.dart';
import 'package:coronamapp/models/symptom.dart';
import 'package:mobx/mobx.dart';

import '../store_state_enum.dart';
part 'symptoms_store.g.dart';

class Form2Store = _Form2StoreBase with _$Form2Store;

abstract class _Form2StoreBase with Store {
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
    chosenSymptomsErrorText =
        values.length < 1 ? 'Ou bizin remplit symptoms' : null;
  }

  @action
  void validateFirstDate(DateTime dateTime) {
    firstDateErrorText = dateTime == null
        ? 'Faut choisir date ou in coummence gagne symptoms'
        : null;
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
