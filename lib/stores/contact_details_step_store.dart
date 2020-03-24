import 'package:coronamapp/models/address.dart';
import 'package:coronamapp/models/gender.dart';
import 'package:coronamapp/models/user.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobx/mobx.dart';
import 'package:coronamapp/district_enum.dart';
import 'package:validators/validators.dart';

part 'contact_details_step_store.g.dart';

class ContactDetailsStepStore = _ContactDetailsStepStore with _$ContactDetailsStepStore;

abstract class _ContactDetailsStepStore with Store {
  @observable
  StepErrorState error = StepErrorState();

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
  int get age => DateTime.now().year - (dob?.year ?? 0);

  @computed
  bool get canMoveToNextPage => !error.hasErrors;
  User get userPersonalFormData => User.fromForm(
        firstName: firstName,
        lastName: lastName,
        dob: dob,
        age: age,
        gender: Gender.create(label: gender, ref: gender),
        phoneNumber: phoneNoText,
        homeNumber: homeNoText,
        address: address,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

  List<ReactionDisposer> _disposers;

  @action
  void setStore(User user) {
    firstName = user.firstName;
    lastName = user.lastName;
    gender = user.gender?.ref;
    dob = user.dob;
    phoneNoText = user.phoneNumber;
    homeNoText = user.homeNumber;
    address = user.address ?? Address();
  }

  void setupValidations() {
    _disposers = [
      reaction((_) => firstName, validateFirstName),
      reaction((_) => lastName, validateLastName),
      reaction((_) => dob, validateDob),
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
        FormBuilderValidators.required(errorText: 'form_error_first_name');
    error.firstName = requiredValidator(value);
    if (!isAlpha(value.replaceAll(' ', ''))) {
      error.firstName = "form_error_first_name_alpha";
    }
  }

  @action
  Future validateLastName(String value) async {
    error.lastName = null;

    var requiredValidator =
        FormBuilderValidators.required(errorText: 'form_error_last_name');
    error.lastName = requiredValidator(value);

    if (!isAlpha(lastName.replaceAll(' ',''))) {
      error.lastName = "form_error_last_name_alpha";
    }
  }

  @action
  void validateDob(DateTime value) {
    error.age = null;

    error.age = FormBuilderValidators.required(
        errorText: 'form_error_age_valid_range')(value);
  }

  @action
  void validateGender(String value) {
    error.gender = value == null ? 'form_error_gender' : null;
  }

  @action
  void validatePhoneNo(String value) {
    error.phoneNo = null;

    error.phoneNo =
        FormBuilderValidators.required(errorText: "form_error_phone_no")(value);
    if (error.phoneNo != null) return;

    if (!value.startsWith('5')) {
      error.phoneNo = 'form_error_phone_no_start_five';
      return;
    }

    error.phoneNo = FormBuilderValidators.numeric(
            errorText: 'form_error_phone_no_invalid')(value) ??
        FormBuilderValidators.minLength(8,
            errorText: "form_error_phone_no_fill_eight")(value) ??
        FormBuilderValidators.maxLength(8,
            errorText: "form_error_phone_no_fill_eight")(value);
  }

  @action
  void validateHomeNo(String value) {
    error.homeNo = null;
    if (isNull(value)) return;

    if (value.startsWith('0')) {
      error.phoneNo = 'form_error_home_no_start_zero';
      return;
    }

    error.homeNo = FormBuilderValidators.numeric(
            errorText: 'form_error_home_no_start_zero')(value) ??
        FormBuilderValidators.minLength(7,
            errorText: 'form_error_home_no_fill_seven')(value) ??
        FormBuilderValidators.maxLength(7,
            errorText: "form_error_home_no_fill_seven")(value);
  }

  @action
  void validateLine1(String value) {
    error.line1 = null;
    if (isNull(value) || value.isEmpty) {
      error.line1 = 'form_error_address_line_1';
    }
  }

  @action
  void validateDistrict(District district) {
    error.district = district == null ? 'form_error_district' : null;
  }

  @action
  void validateRegion(String value) {
    error.region = null;

    if (isNull(value) || value.isEmpty) {
      error.region = 'form_error_city';
      return;
    }

    if (!isAlpha(value.replaceAll(' ', ''))) {
      error.region = 'form_error_city_alpha';
    }
  }

  @action
  void validatePostalCode(String value) {
    error.postalCode = null;

    if (value != null) {
      error.postalCode = FormBuilderValidators.numeric(
              errorText: 'form_error_postal')(value) ??
          FormBuilderValidators.maxLength(5,
              errorText: "form_error_postal_fill_five")(value);
    }
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  @action
  void validateAll() {
    validateFirstName(firstName);
    validateLastName(lastName);
    validateGender(gender);
    validateDob(dob);
    validatePhoneNo(phoneNoText);
    validateHomeNo(homeNoText);
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