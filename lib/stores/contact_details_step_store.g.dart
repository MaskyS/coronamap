// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_details_step_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContactDetailsStepStore on _ContactDetailsStepStore, Store {
  Computed<String> _$fullNameComputed;

  @override
  String get fullName =>
      (_$fullNameComputed ??= Computed<String>(() => super.fullName)).value;
  Computed<int> _$ageComputed;

  @override
  int get age => (_$ageComputed ??= Computed<int>(() => super.age)).value;
  Computed<bool> _$canMoveToNextPageComputed;

  @override
  bool get canMoveToNextPage => (_$canMoveToNextPageComputed ??=
          Computed<bool>(() => super.canMoveToNextPage))
      .value;

  final _$errorAtom = Atom(name: '_ContactDetailsStepStore.error');

  @override
  StepErrorState get error {
    _$errorAtom.context.enforceReadPolicy(_$errorAtom);
    _$errorAtom.reportObserved();
    return super.error;
  }

  @override
  set error(StepErrorState value) {
    _$errorAtom.context.conditionallyRunInAction(() {
      super.error = value;
      _$errorAtom.reportChanged();
    }, _$errorAtom, name: '${_$errorAtom.name}_set');
  }

  final _$firstNameAtom = Atom(name: '_ContactDetailsStepStore.firstName');

  @override
  String get firstName {
    _$firstNameAtom.context.enforceReadPolicy(_$firstNameAtom);
    _$firstNameAtom.reportObserved();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    _$firstNameAtom.context.conditionallyRunInAction(() {
      super.firstName = value;
      _$firstNameAtom.reportChanged();
    }, _$firstNameAtom, name: '${_$firstNameAtom.name}_set');
  }

  final _$lastNameAtom = Atom(name: '_ContactDetailsStepStore.lastName');

  @override
  String get lastName {
    _$lastNameAtom.context.enforceReadPolicy(_$lastNameAtom);
    _$lastNameAtom.reportObserved();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    _$lastNameAtom.context.conditionallyRunInAction(() {
      super.lastName = value;
      _$lastNameAtom.reportChanged();
    }, _$lastNameAtom, name: '${_$lastNameAtom.name}_set');
  }

  final _$dobAtom = Atom(name: '_ContactDetailsStepStore.dob');

  @override
  DateTime get dob {
    _$dobAtom.context.enforceReadPolicy(_$dobAtom);
    _$dobAtom.reportObserved();
    return super.dob;
  }

  @override
  set dob(DateTime value) {
    _$dobAtom.context.conditionallyRunInAction(() {
      super.dob = value;
      _$dobAtom.reportChanged();
    }, _$dobAtom, name: '${_$dobAtom.name}_set');
  }

  final _$genderAtom = Atom(name: '_ContactDetailsStepStore.gender');

  @override
  String get gender {
    _$genderAtom.context.enforceReadPolicy(_$genderAtom);
    _$genderAtom.reportObserved();
    return super.gender;
  }

  @override
  set gender(String value) {
    _$genderAtom.context.conditionallyRunInAction(() {
      super.gender = value;
      _$genderAtom.reportChanged();
    }, _$genderAtom, name: '${_$genderAtom.name}_set');
  }

  final _$phoneNoTextAtom = Atom(name: '_ContactDetailsStepStore.phoneNoText');

  @override
  String get phoneNoText {
    _$phoneNoTextAtom.context.enforceReadPolicy(_$phoneNoTextAtom);
    _$phoneNoTextAtom.reportObserved();
    return super.phoneNoText;
  }

  @override
  set phoneNoText(String value) {
    _$phoneNoTextAtom.context.conditionallyRunInAction(() {
      super.phoneNoText = value;
      _$phoneNoTextAtom.reportChanged();
    }, _$phoneNoTextAtom, name: '${_$phoneNoTextAtom.name}_set');
  }

  final _$homeNoTextAtom = Atom(name: '_ContactDetailsStepStore.homeNoText');

  @override
  String get homeNoText {
    _$homeNoTextAtom.context.enforceReadPolicy(_$homeNoTextAtom);
    _$homeNoTextAtom.reportObserved();
    return super.homeNoText;
  }

  @override
  set homeNoText(String value) {
    _$homeNoTextAtom.context.conditionallyRunInAction(() {
      super.homeNoText = value;
      _$homeNoTextAtom.reportChanged();
    }, _$homeNoTextAtom, name: '${_$homeNoTextAtom.name}_set');
  }

  final _$addressAtom = Atom(name: '_ContactDetailsStepStore.address');

  @override
  Address get address {
    _$addressAtom.context.enforceReadPolicy(_$addressAtom);
    _$addressAtom.reportObserved();
    return super.address;
  }

  @override
  set address(Address value) {
    _$addressAtom.context.conditionallyRunInAction(() {
      super.address = value;
      _$addressAtom.reportChanged();
    }, _$addressAtom, name: '${_$addressAtom.name}_set');
  }

  final _$validateFirstNameAsyncAction = AsyncAction('validateFirstName');

  @override
  Future<dynamic> validateFirstName(String value) {
    return _$validateFirstNameAsyncAction
        .run(() => super.validateFirstName(value));
  }

  final _$validateLastNameAsyncAction = AsyncAction('validateLastName');

  @override
  Future<dynamic> validateLastName(String value) {
    return _$validateLastNameAsyncAction
        .run(() => super.validateLastName(value));
  }

  final _$_ContactDetailsStepStoreActionController =
      ActionController(name: '_ContactDetailsStepStore');

  @override
  void setStore(User user) {
    final _$actionInfo =
        _$_ContactDetailsStepStoreActionController.startAction();
    try {
      return super.setStore(user);
    } finally {
      _$_ContactDetailsStepStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateDob(DateTime value) {
    final _$actionInfo =
        _$_ContactDetailsStepStoreActionController.startAction();
    try {
      return super.validateDob(value);
    } finally {
      _$_ContactDetailsStepStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateGender(String value) {
    final _$actionInfo =
        _$_ContactDetailsStepStoreActionController.startAction();
    try {
      return super.validateGender(value);
    } finally {
      _$_ContactDetailsStepStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePhoneNo(String value) {
    final _$actionInfo =
        _$_ContactDetailsStepStoreActionController.startAction();
    try {
      return super.validatePhoneNo(value);
    } finally {
      _$_ContactDetailsStepStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateHomeNo(String value) {
    final _$actionInfo =
        _$_ContactDetailsStepStoreActionController.startAction();
    try {
      return super.validateHomeNo(value);
    } finally {
      _$_ContactDetailsStepStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateLine1(String value) {
    final _$actionInfo =
        _$_ContactDetailsStepStoreActionController.startAction();
    try {
      return super.validateLine1(value);
    } finally {
      _$_ContactDetailsStepStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateDistrict(District district) {
    final _$actionInfo =
        _$_ContactDetailsStepStoreActionController.startAction();
    try {
      return super.validateDistrict(district);
    } finally {
      _$_ContactDetailsStepStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateRegion(String value) {
    final _$actionInfo =
        _$_ContactDetailsStepStoreActionController.startAction();
    try {
      return super.validateRegion(value);
    } finally {
      _$_ContactDetailsStepStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateAll() {
    final _$actionInfo =
        _$_ContactDetailsStepStoreActionController.startAction();
    try {
      return super.validateAll();
    } finally {
      _$_ContactDetailsStepStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'error: ${error.toString()},firstName: ${firstName.toString()},lastName: ${lastName.toString()},dob: ${dob.toString()},gender: ${gender.toString()},phoneNoText: ${phoneNoText.toString()},homeNoText: ${homeNoText.toString()},address: ${address.toString()},fullName: ${fullName.toString()},age: ${age.toString()},canMoveToNextPage: ${canMoveToNextPage.toString()}';
    return '{$string}';
  }
}

mixin _$StepErrorState on _StepErrorState, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors)).value;

  final _$firstNameAtom = Atom(name: '_StepErrorState.firstName');

  @override
  String get firstName {
    _$firstNameAtom.context.enforceReadPolicy(_$firstNameAtom);
    _$firstNameAtom.reportObserved();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    _$firstNameAtom.context.conditionallyRunInAction(() {
      super.firstName = value;
      _$firstNameAtom.reportChanged();
    }, _$firstNameAtom, name: '${_$firstNameAtom.name}_set');
  }

  final _$lastNameAtom = Atom(name: '_StepErrorState.lastName');

  @override
  String get lastName {
    _$lastNameAtom.context.enforceReadPolicy(_$lastNameAtom);
    _$lastNameAtom.reportObserved();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    _$lastNameAtom.context.conditionallyRunInAction(() {
      super.lastName = value;
      _$lastNameAtom.reportChanged();
    }, _$lastNameAtom, name: '${_$lastNameAtom.name}_set');
  }

  final _$phoneNoAtom = Atom(name: '_StepErrorState.phoneNo');

  @override
  String get phoneNo {
    _$phoneNoAtom.context.enforceReadPolicy(_$phoneNoAtom);
    _$phoneNoAtom.reportObserved();
    return super.phoneNo;
  }

  @override
  set phoneNo(String value) {
    _$phoneNoAtom.context.conditionallyRunInAction(() {
      super.phoneNo = value;
      _$phoneNoAtom.reportChanged();
    }, _$phoneNoAtom, name: '${_$phoneNoAtom.name}_set');
  }

  final _$homeNoAtom = Atom(name: '_StepErrorState.homeNo');

  @override
  String get homeNo {
    _$homeNoAtom.context.enforceReadPolicy(_$homeNoAtom);
    _$homeNoAtom.reportObserved();
    return super.homeNo;
  }

  @override
  set homeNo(String value) {
    _$homeNoAtom.context.conditionallyRunInAction(() {
      super.homeNo = value;
      _$homeNoAtom.reportChanged();
    }, _$homeNoAtom, name: '${_$homeNoAtom.name}_set');
  }

  final _$ageAtom = Atom(name: '_StepErrorState.age');

  @override
  String get age {
    _$ageAtom.context.enforceReadPolicy(_$ageAtom);
    _$ageAtom.reportObserved();
    return super.age;
  }

  @override
  set age(String value) {
    _$ageAtom.context.conditionallyRunInAction(() {
      super.age = value;
      _$ageAtom.reportChanged();
    }, _$ageAtom, name: '${_$ageAtom.name}_set');
  }

  final _$genderAtom = Atom(name: '_StepErrorState.gender');

  @override
  String get gender {
    _$genderAtom.context.enforceReadPolicy(_$genderAtom);
    _$genderAtom.reportObserved();
    return super.gender;
  }

  @override
  set gender(String value) {
    _$genderAtom.context.conditionallyRunInAction(() {
      super.gender = value;
      _$genderAtom.reportChanged();
    }, _$genderAtom, name: '${_$genderAtom.name}_set');
  }

  final _$line1Atom = Atom(name: '_StepErrorState.line1');

  @override
  String get line1 {
    _$line1Atom.context.enforceReadPolicy(_$line1Atom);
    _$line1Atom.reportObserved();
    return super.line1;
  }

  @override
  set line1(String value) {
    _$line1Atom.context.conditionallyRunInAction(() {
      super.line1 = value;
      _$line1Atom.reportChanged();
    }, _$line1Atom, name: '${_$line1Atom.name}_set');
  }

  final _$districtAtom = Atom(name: '_StepErrorState.district');

  @override
  String get district {
    _$districtAtom.context.enforceReadPolicy(_$districtAtom);
    _$districtAtom.reportObserved();
    return super.district;
  }

  @override
  set district(String value) {
    _$districtAtom.context.conditionallyRunInAction(() {
      super.district = value;
      _$districtAtom.reportChanged();
    }, _$districtAtom, name: '${_$districtAtom.name}_set');
  }

  final _$regionAtom = Atom(name: '_StepErrorState.region');

  @override
  String get region {
    _$regionAtom.context.enforceReadPolicy(_$regionAtom);
    _$regionAtom.reportObserved();
    return super.region;
  }

  @override
  set region(String value) {
    _$regionAtom.context.conditionallyRunInAction(() {
      super.region = value;
      _$regionAtom.reportChanged();
    }, _$regionAtom, name: '${_$regionAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'firstName: ${firstName.toString()},lastName: ${lastName.toString()},phoneNo: ${phoneNo.toString()},homeNo: ${homeNo.toString()},age: ${age.toString()},gender: ${gender.toString()},line1: ${line1.toString()},district: ${district.toString()},region: ${region.toString()},hasErrors: ${hasErrors.toString()}';
    return '{$string}';
  }
}
