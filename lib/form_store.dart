import 'package:coronamapp/models/address.dart';
import 'package:coronamapp/models/gender.dart';
import 'package:coronamapp/models/user.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobx/mobx.dart';
import 'package:coronamapp/district_enum.dart';
import 'package:validators/validators.dart';

part 'form_store.g.dart';

class Step1Store = _Step1Store with _$Step1Store;

abstract class _Step1Store with Store {
  final StepErrorState error = StepErrorState();

  @observable
  String firstName = '';

  @observable
  String lastName = '';

  @observable
  DateTime dob;

  @observable
  String gender = 'Male';

  @observable
  String phoneNoText;

  @observable
  String homeNoText;

  @observable
  Address address = Address();

  @computed
  String get fullName => firstName + lastName;

  @computed
  DateTime get age => dob;

  @computed
  int get phoneNo => int.tryParse(phoneNoText);

  @computed
  int get homeNo => int.tryParse(homeNoText);

  @computed
  bool get canMoveToNextPage => !error.hasErrors;
  User get userPersonalFormData => User.fromForm(
      firstName: firstName, lastName: lastName,
      dob: dob, gender: Gender.create(label: gender, ref: gender.toLowerCase()),
      phoneNumber: phoneNo.toString(),
      address: address, createdAt: DateTime.now(), updatedAt: DateTime.now()
  );

  List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => firstName, validateFirstName),
      reaction((_) => lastName, validateLastName),
      reaction((_) => dob, validateAge),
      reaction((_) => gender, validateGender),
      reaction((_) => phoneNoText, validatePhoneNo),
      reaction((_) => homeNoText, validateHomeNo),
      reaction((_) => address.line1, validateLine1),
      reaction((_) => address.district, validateDistrict),
      reaction((_) => address.region, validateRegion),
    ];
  }

  @action
  Future validateFirstName(String value) async {
    error.firstName = null;

    var requiredValidator =
        FormBuilderValidators.required(errorText: 'Bizin remplit ou prenom');
    error.firstName = requiredValidator(value);
    if (!isAlpha(value)) {
      error.firstName = "Ou prenom bizin ena juste ban alphabets";
    }
  }

  Future validateLastName(String value) async {
    error.lastName = null;

    var requiredValidator =
        FormBuilderValidators.required(errorText: 'Bizin remplit ou surnom');
    error.lastName = requiredValidator(value);

    if (!isAlpha(lastName)) {
      error.lastName = "Ou surnom bizin ena juste ban alphabets";
    }
  }

  @action
  void validateAge(DateTime value) {
    error.age = null;
    var ageRange = DateTime.now().year - value.year;
    error.age = ageRange < 0 || ageRange > 100  ? 'Bizin mette enn l\'age valid' : null;
  }

  @action
  void validateGender(String value) {
    error.gender = value == null ? 'Ou bizin choisir ou sexe' : null;
  }

  @action
  void validatePhoneNo(String value) {
    error.phoneNo = null;

    error.phoneNo = FormBuilderValidators.required(
        errorText: "Bizin mette ou numero")(value);
    if (error.phoneNo != null) return;

    if (!value.startsWith('5')) {
      error.phoneNo = 'Bizin mett 5 devant';
      return;
    }

    error.phoneNo = FormBuilderValidators.numeric(
            errorText: 'Ena ban characters invalides')(value) ??
        FormBuilderValidators.minLength(8,
            errorText: "Ou numero bizin ena 8 numeros")(value) ??
        FormBuilderValidators.maxLength(8,
            errorText: "Ou numero bizin ena 8 numeros")(value);
  }

  @action
  void validateHomeNo(String value) {
    error.homeNo = null;
    if (isNull(value)) return;

    if (value.startsWith('0')) {
      error.phoneNo = 'Ou pas cav mette 0 devant';
      return;
    }

    error.homeNo = FormBuilderValidators.numeric(
            errorText: 'Ena ban characters invalides')(value) ??
        FormBuilderValidators.minLength(7, errorText: 'Bizin ena 7 numeros')(
            value) ??
        FormBuilderValidators.maxLength(7, errorText: "Bizin ena 7 numeros")(
            value);
  }

  @action
  void validateLine1(String value) {
    error.line1 = null;
    if (isNull(value) || value.isEmpty) {
      error.line1 = 'Ou bizin rempli ou address line';
    }
  }

  validateDistrict(District district) {
    error.district = district == null ? 'Ou bizin choisir ene district' : null;
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
  void validatePostalCode(String value) {
    error.postalCode = null;

    if(value!=null){
      error.postalCode = FormBuilderValidators.numeric(
            errorText: 'Ena ban characters invalides')(value) ??
        FormBuilderValidators.maxLength(5, errorText: "Bizin ena 5 numeros")(
            value);
    }
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validateFirstName(firstName);
    validateLastName(lastName);
    validateGender(gender);
    validateAge(dob);
    validatePhoneNo(phoneNoText);
    validateLine1(address.line1);
    validateRegion(address.region);
    validateDistrict(address.district);
    validatePostalCode(address.postalCodeText);
  }
}

class StepErrorState = _StepErrorState with _$StepErrorState;

abstract class _StepErrorState with Store {
  @observable
  String firstName;

  @observable
  String lastName;

  @observable
  String phoneNo;

  @observable
  String homeNo;

  @observable
  String age;

  @observable
  String gender;

  @observable
  String line1;

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
      phoneNo != null ||
      line1 != null ||
      district != null ||
      region != null;
}
