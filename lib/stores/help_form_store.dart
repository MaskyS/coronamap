import 'package:coronamapp/repository/necessity_repository.dart';
import 'package:coronamapp/store_state_enum.dart';
import 'package:mobx/mobx.dart';
import 'package:coronamapp/models/necessity.dart';

part 'help_form_store.g.dart';

class NecessitiesStore = _NecessitiesStoreBase with _$NecessitiesStore;

abstract class _NecessitiesStoreBase with Store {
  @observable
  List<Necessity> necessities = [];

  @observable
  List<Necessity> chosenNecessities;

  @observable
  String otherNecessities;

  @observable
  ObservableFuture<List<Necessity>> _necessitiesFuture;

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
