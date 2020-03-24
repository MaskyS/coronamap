import 'package:depistazmu/repository/necessity_repository.dart';
import 'package:depistazmu/store_state_enum.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobx/mobx.dart';
import 'package:depistazmu/models/necessity.dart';

part 'supplies_step_store.g.dart';

class SuppliesStepStore = _SuppliesStepStoreBase with _$SuppliesStepStore;

abstract class _SuppliesStepStoreBase with Store {
  @observable
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

  @observable
  List<Necessity> necessities = [];

  @observable
  List<Necessity> chosenNecessities;

  @observable
  String otherNecessities;

  @observable
  ObservableFuture<List<Necessity>> _necessitiesFuture;

  @computed
  bool get isValid => fbKey.currentState.validate();

  @action
  Future<void> getNecessitiesFromFirestore() async {
    try {
      _necessitiesFuture =
          ObservableFuture(NecessityRepository().getAllWithLimit(limit: 20));
      necessities = await _necessitiesFuture;
    } catch (e) {
      print(e);
    }
  }

  @computed
  StoreState get state {
    if (_necessitiesFuture == null ||
        _necessitiesFuture.status == FutureStatus.rejected) {
      return StoreState.initial;
    }

    return _necessitiesFuture.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }
}
