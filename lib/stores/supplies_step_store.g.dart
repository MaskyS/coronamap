// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplies_step_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SuppliesStepStore on _SuppliesStepStoreBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$fbKeyAtom = Atom(name: '_SuppliesStepStoreBase.fbKey');

  @override
  GlobalKey<FormBuilderState> get fbKey {
    _$fbKeyAtom.context.enforceReadPolicy(_$fbKeyAtom);
    _$fbKeyAtom.reportObserved();
    return super.fbKey;
  }

  @override
  set fbKey(GlobalKey<FormBuilderState> value) {
    _$fbKeyAtom.context.conditionallyRunInAction(() {
      super.fbKey = value;
      _$fbKeyAtom.reportChanged();
    }, _$fbKeyAtom, name: '${_$fbKeyAtom.name}_set');
  }

  final _$necessitiesAtom = Atom(name: '_SuppliesStepStoreBase.necessities');

  @override
  List<Necessity> get necessities {
    _$necessitiesAtom.context.enforceReadPolicy(_$necessitiesAtom);
    _$necessitiesAtom.reportObserved();
    return super.necessities;
  }

  @override
  set necessities(List<Necessity> value) {
    _$necessitiesAtom.context.conditionallyRunInAction(() {
      super.necessities = value;
      _$necessitiesAtom.reportChanged();
    }, _$necessitiesAtom, name: '${_$necessitiesAtom.name}_set');
  }

  final _$chosenNecessitiesAtom =
      Atom(name: '_SuppliesStepStoreBase.chosenNecessities');

  @override
  List<Necessity> get chosenNecessities {
    _$chosenNecessitiesAtom.context.enforceReadPolicy(_$chosenNecessitiesAtom);
    _$chosenNecessitiesAtom.reportObserved();
    return super.chosenNecessities;
  }

  @override
  set chosenNecessities(List<Necessity> value) {
    _$chosenNecessitiesAtom.context.conditionallyRunInAction(() {
      super.chosenNecessities = value;
      _$chosenNecessitiesAtom.reportChanged();
    }, _$chosenNecessitiesAtom, name: '${_$chosenNecessitiesAtom.name}_set');
  }

  final _$otherNecessitiesAtom =
      Atom(name: '_SuppliesStepStoreBase.otherNecessities');

  @override
  String get otherNecessities {
    _$otherNecessitiesAtom.context.enforceReadPolicy(_$otherNecessitiesAtom);
    _$otherNecessitiesAtom.reportObserved();
    return super.otherNecessities;
  }

  @override
  set otherNecessities(String value) {
    _$otherNecessitiesAtom.context.conditionallyRunInAction(() {
      super.otherNecessities = value;
      _$otherNecessitiesAtom.reportChanged();
    }, _$otherNecessitiesAtom, name: '${_$otherNecessitiesAtom.name}_set');
  }

  final _$_necessitiesFutureAtom =
      Atom(name: '_SuppliesStepStoreBase._necessitiesFuture');

  @override
  ObservableFuture<List<Necessity>> get _necessitiesFuture {
    _$_necessitiesFutureAtom.context
        .enforceReadPolicy(_$_necessitiesFutureAtom);
    _$_necessitiesFutureAtom.reportObserved();
    return super._necessitiesFuture;
  }

  @override
  set _necessitiesFuture(ObservableFuture<List<Necessity>> value) {
    _$_necessitiesFutureAtom.context.conditionallyRunInAction(() {
      super._necessitiesFuture = value;
      _$_necessitiesFutureAtom.reportChanged();
    }, _$_necessitiesFutureAtom, name: '${_$_necessitiesFutureAtom.name}_set');
  }

  final _$isEmergencyAtom = Atom(name: '_SuppliesStepStoreBase.isEmergency');

  @override
  bool get isEmergency {
    _$isEmergencyAtom.context.enforceReadPolicy(_$isEmergencyAtom);
    _$isEmergencyAtom.reportObserved();
    return super.isEmergency;
  }

  @override
  set isEmergency(bool value) {
    _$isEmergencyAtom.context.conditionallyRunInAction(() {
      super.isEmergency = value;
      _$isEmergencyAtom.reportChanged();
    }, _$isEmergencyAtom, name: '${_$isEmergencyAtom.name}_set');
  }

  final _$getNecessitiesFromFirestoreAsyncAction =
      AsyncAction('getNecessitiesFromFirestore');

  @override
  Future<void> getNecessitiesFromFirestore() {
    return _$getNecessitiesFromFirestoreAsyncAction
        .run(() => super.getNecessitiesFromFirestore());
  }

  @override
  String toString() {
    final string =
        'fbKey: ${fbKey.toString()},necessities: ${necessities.toString()},chosenNecessities: ${chosenNecessities.toString()},otherNecessities: ${otherNecessities.toString()},isEmergency: ${isEmergency.toString()},isValid: ${isValid.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
