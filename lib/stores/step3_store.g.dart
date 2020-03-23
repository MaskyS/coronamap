// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step3_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Step3Store on _Step3StoreBase, Store {
  Computed<bool> _$canCompleteFormComputed;

  @override
  bool get canCompleteForm => (_$canCompleteFormComputed ??=
          Computed<bool>(() => super.canCompleteForm))
      .value;
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$chosenSymptomsAtom = Atom(name: '_Step3StoreBase.chosenSymptoms');

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
      Atom(name: '_Step3StoreBase._symptomsListFuture');

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

  final _$errorMessageAtom = Atom(name: '_Step3StoreBase.errorMessage');

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

  final _$symptomsListAtom = Atom(name: '_Step3StoreBase.symptomsList');

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

  final _$firstDateAtom = Atom(name: '_Step3StoreBase.firstDate');

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

  final _$chosenSymptomsErrorTextAtom =
      Atom(name: '_Step3StoreBase.chosenSymptomsErrorText');

  @override
  String get chosenSymptomsErrorText {
    _$chosenSymptomsErrorTextAtom.context
        .enforceReadPolicy(_$chosenSymptomsErrorTextAtom);
    _$chosenSymptomsErrorTextAtom.reportObserved();
    return super.chosenSymptomsErrorText;
  }

  @override
  set chosenSymptomsErrorText(String value) {
    _$chosenSymptomsErrorTextAtom.context.conditionallyRunInAction(() {
      super.chosenSymptomsErrorText = value;
      _$chosenSymptomsErrorTextAtom.reportChanged();
    }, _$chosenSymptomsErrorTextAtom,
        name: '${_$chosenSymptomsErrorTextAtom.name}_set');
  }

  final _$firstDateErrorTextAtom =
      Atom(name: '_Step3StoreBase.firstDateErrorText');

  @override
  String get firstDateErrorText {
    _$firstDateErrorTextAtom.context
        .enforceReadPolicy(_$firstDateErrorTextAtom);
    _$firstDateErrorTextAtom.reportObserved();
    return super.firstDateErrorText;
  }

  @override
  set firstDateErrorText(String value) {
    _$firstDateErrorTextAtom.context.conditionallyRunInAction(() {
      super.firstDateErrorText = value;
      _$firstDateErrorTextAtom.reportChanged();
    }, _$firstDateErrorTextAtom, name: '${_$firstDateErrorTextAtom.name}_set');
  }

  final _$riskAtom = Atom(name: '_Step3StoreBase.risk');

  @override
  Risk get risk {
    _$riskAtom.context.enforceReadPolicy(_$riskAtom);
    _$riskAtom.reportObserved();
    return super.risk;
  }

  @override
  set risk(Risk value) {
    _$riskAtom.context.conditionallyRunInAction(() {
      super.risk = value;
      _$riskAtom.reportChanged();
    }, _$riskAtom, name: '${_$riskAtom.name}_set');
  }

  final _$getSymptomsFromFirestoreAsyncAction =
      AsyncAction('getSymptomsFromFirestore');

  @override
  Future<void> getSymptomsFromFirestore() {
    return _$getSymptomsFromFirestoreAsyncAction
        .run(() => super.getSymptomsFromFirestore());
  }

  final _$_Step3StoreBaseActionController =
      ActionController(name: '_Step3StoreBase');

  @override
  void calculateRisk(int age, bool hasPreExistingConditions) {
    final _$actionInfo = _$_Step3StoreBaseActionController.startAction();
    try {
      return super.calculateRisk(age, hasPreExistingConditions);
    } finally {
      _$_Step3StoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateChosenSymptoms(List<Symptom> values) {
    final _$actionInfo = _$_Step3StoreBaseActionController.startAction();
    try {
      return super.validateChosenSymptoms(values);
    } finally {
      _$_Step3StoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateFirstDate(DateTime dateTime) {
    final _$actionInfo = _$_Step3StoreBaseActionController.startAction();
    try {
      return super.validateFirstDate(dateTime);
    } finally {
      _$_Step3StoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'chosenSymptoms: ${chosenSymptoms.toString()},errorMessage: ${errorMessage.toString()},symptomsList: ${symptomsList.toString()},firstDate: ${firstDate.toString()},chosenSymptomsErrorText: ${chosenSymptomsErrorText.toString()},firstDateErrorText: ${firstDateErrorText.toString()},risk: ${risk.toString()},canCompleteForm: ${canCompleteForm.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
