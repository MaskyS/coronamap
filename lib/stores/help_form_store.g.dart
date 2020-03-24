// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'help_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NecessitiesStore on _NecessitiesStoreBase, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$necessitiesAtom = Atom(name: '_NecessitiesStoreBase.necessities');

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
      Atom(name: '_NecessitiesStoreBase.chosenNecessities');

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
      Atom(name: '_NecessitiesStoreBase.otherNecessities');

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
      Atom(name: '_NecessitiesStoreBase._necessitiesFuture');

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
        'necessities: ${necessities.toString()},chosenNecessities: ${chosenNecessities.toString()},otherNecessities: ${otherNecessities.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
