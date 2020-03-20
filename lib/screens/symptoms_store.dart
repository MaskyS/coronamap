import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coronamapp/models/symptom.dart';
import 'package:coronamapp/repository/gender_repository.dart';
import 'package:coronamapp/repository/symptom_repository.dart';
import 'package:flutter/services.dart';
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
  List<Symptom> symptomsList = List();

  @computed
  String get chosenSymptomsErrorText =>
      chosenSymptoms.length >= 0 ? 'Choisir ou ban symptoms' : null;

  /// First date symptoms observed.
  @observable
  DateTime firstDate;

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

  @computed
  List<Symptom> get symptomsListFromFireStore => _symptomsListFuture.value;

  @action
  Future<void> getFromFirestore() async {
    try {
      _symptomsListFuture =
          ObservableFuture(SymptomRepository().getAllWithLimit(limit: 20));
      symptomsList = await _symptomsListFuture;
    } catch (e) {
      print(e);
    }
  }
}
