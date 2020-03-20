// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptoms_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Form2Store on _Form2StoreBase, Store {
  Computed<String> _$chosenSymptomsErrorTextComputed;

  @override
  String get chosenSymptomsErrorText => (_$chosenSymptomsErrorTextComputed ??=
          Computed<String>(() => super.chosenSymptomsErrorText))
      .value;
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;
  Computed<List<Symptom>> _$symptomsListFromFireStoreComputed;

  @override
  List<Symptom> get symptomsListFromFireStore =>
      (_$symptomsListFromFireStoreComputed ??=
              Computed<List<Symptom>>(() => super.symptomsListFromFireStore))
          .value;

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

  final _$_symptomsListFutureAtom =
      Atom(name: '_Form2StoreBase._symptomsListFuture');

  @override
  ObservableFuture<List<Symptom>> get _symptomsListFuture {
    _$_symptomsListFutureAtom.context
        .enforceReadPolicy(_$_symptomsListFutureAtom);
    _$_symptomsListFutureAtom.reportObserved();
    return super._symptomsListFuture;
  }

  @override
  set _symptomsListFuture(ObservableFuture<List<Symptom>> value) {
    _$_symptomsListFutureAtom.context.conditionallyRunInAction(() {
      super._symptomsListFuture = value;
      _$_symptomsListFutureAtom.reportChanged();
    }, _$_symptomsListFutureAtom,
        name: '${_$_symptomsListFutureAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_Form2StoreBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$symptomsListAtom = Atom(name: '_Form2StoreBase.symptomsList');

  @override
  List<Symptom> get symptomsList {
    _$symptomsListAtom.context.enforceReadPolicy(_$symptomsListAtom);
    _$symptomsListAtom.reportObserved();
    return super.symptomsList;
  }

  @override
  set symptomsList(List<Symptom> value) {
    _$symptomsListAtom.context.conditionallyRunInAction(() {
      super.symptomsList = value;
      _$symptomsListAtom.reportChanged();
    }, _$symptomsListAtom, name: '${_$symptomsListAtom.name}_set');
  }

  final _$firstDateAtom = Atom(name: '_Form2StoreBase.firstDate');

  @override
  DateTime get firstDate {
    _$firstDateAtom.context.enforceReadPolicy(_$firstDateAtom);
    _$firstDateAtom.reportObserved();
    return super.firstDate;
  }

  @override
  set firstDate(DateTime value) {
    _$firstDateAtom.context.conditionallyRunInAction(() {
      super.firstDate = value;
      _$firstDateAtom.reportChanged();
    }, _$firstDateAtom, name: '${_$firstDateAtom.name}_set');
  }

  final _$getFromFirestoreAsyncAction = AsyncAction('getFromFirestore');

  @override
  Future<void> getFromFirestore() {
    return _$getFromFirestoreAsyncAction.run(() => super.getFromFirestore());
  }

  @override
  String toString() {
    final string =
        'chosenSymptoms: ${chosenSymptoms.toString()},errorMessage: ${errorMessage.toString()},symptomsList: ${symptomsList.toString()},firstDate: ${firstDate.toString()},chosenSymptomsErrorText: ${chosenSymptomsErrorText.toString()},state: ${state.toString()},symptomsListFromFireStore: ${symptomsListFromFireStore.toString()}';
    return '{$string}';
  }
}
