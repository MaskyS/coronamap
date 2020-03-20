import 'package:coronamapp/models/symptom.dart';
import 'package:mobx/mobx.dart';
part 'symptoms_store.g.dart';

class Form2Store = _Form2StoreBase with _$Form2Store;

abstract class _Form2StoreBase with Store {
  @observable
  List<Symptom> chosenSymptoms;

  @observable
  DateTime firstDateSymptomsObserved;

}