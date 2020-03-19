import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'form_store.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  final FormErrorState error = FormErrorState();

  @observable
  String firstName = '';

  @observable
  String lastName = '';

  @observable
  int age;

  @observable
  int gender;

  @observable
  Address address;

  @observable
  ObservableFuture<bool> usernameCheck = ObservableFuture.value(true);

  @computed
  String get fullName => firstName + lastName;

  @computed
  bool get canMoveToNextPage => !error.hasErrors;

  List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => [fullName, lastName], validateName),
      reaction((_) => age, validateAge),
      reaction((_) => gender, validateGender)
    ];
  }

  @action
  Future validateName(List<String> names) async {
    firstName = names[0];
    lastName = names[1];

    error.firstName = null;
    error.lastName = null;

    if (isNull(firstName) || firstName.isEmpty) {
      error.firstName = 'Bizin remplit ou prenom';
      return;
    }

    if (!isAlpha(firstName)) {
      error.firstName = "Ou prenom bizin ena juste ban alphabets";
    }

    if (isNull(lastName) || lastName.isEmpty) {
      error.lastName = 'Bizin remplit ou surnom';
      return;
    }

    if (!isAlpha(lastName)) {
      error.lastName = "Ou surnom bizin ena juste ban alphabets";
    }
  }

  @action
  void validateAge(int value) {
    error.age = value == null ? "Ou bizin mette ou l'age" : null;
  }

  @action
  void validateGender(int value) {
    error.gender = value != null ? 'Ou bizin choisir ou sexe' : null;
  }



  @action
  void validateLine1(String value) {
    error.line1 = null;
    if (isNull(value) || value.isEmpty) {
      error.line1 = 'Ou bizin rempli ou address line';
    }
  }

  @action
  void validateRegion(String value) {
    error.region = null;

    if (isNull(value) || value.isEmpty) {
      error.region = 'Ou bizin rempli ou region';
    }

    if (!isAlpha(value)) {
      error.region = 'Ou bizin servi juste ban alphabetes';
    }
  }

  @action
  void validateAddress(Address address) {
    error
      ..line1 = null
      ..line2 = null
      ..region = null
      ..postalCode = null
      ..district = null;

    if (isNull(address.line1) || address.line1.trim().isEmpty) {
    }

  }


  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validateName([firstName, lastName]);
    validateAge(age);
    validateGender(gender);
    // validateLine1(address);
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String firstName;

  @observable
  String lastName;

  @observable
  String email;

  @observable
  String password;

  @observable
  String age;

  @observable
  String gender;

  @observable
  String line1;

  @observable
  String line2;

  @observable
  String district;

  @observable
  String region;

  String postalCode;

  @computed
  bool get hasErrors =>
      firstName != null ||
      lastName != null ||
      age != null ||
      gender != null ||
      line1 != null ||
      line2 != null ||
      district != null ||
      postalCode != null ||
      region != null;
}

class Address = _AddressBase with _$Address;

abstract class _AddressBase with Store {
  @observable
  String line1;

  @observable
  String line2;

  @observable
  District district;

  @observable
  String region;

  @observable
  int postalCode;
}

enum District {
  Flacq,
  GrandPort,
  Moka,
  Pamplemousses,
  PlainesWilhems,
  PortLouis,
  RiviereDuRempart,
  RiviereNoire,
  Savanne,
}

extension DistrictExtension on District {
  String get value {
    switch (this) {
      case District.Flacq:
        return 'Flacq';
      case District.GrandPort:
        return 'Grand Port';
      case District.Moka:
        return 'Moka';
      case District.Pamplemousses:
        return 'Pamplemousses';
      case District.PlainesWilhems:
        return 'Plaines Wilhems';
      case District.PortLouis:
        return 'Port Louis';
      case District.RiviereDuRempart:
        return 'Riviere du Rempart';
      case District.RiviereNoire:
        return 'Riviere Noire';
      case District.Savanne:
        return 'Savanne';
      default:
        return null;
    }
  }
}
