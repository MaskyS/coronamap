// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormStore on _FormStore, Store {
  Computed<String> _$fullNameComputed;

  @override
  String get fullName =>
      (_$fullNameComputed ??= Computed<String>(() => super.fullName)).value;
  Computed<bool> _$canMoveToNextPageComputed;

  @override
  bool get canMoveToNextPage => (_$canMoveToNextPageComputed ??=
          Computed<bool>(() => super.canMoveToNextPage))
      .value;

  final _$firstNameAtom = Atom(name: '_FormStore.firstName');

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

  final _$lastNameAtom = Atom(name: '_FormStore.lastName');

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

  final _$ageAtom = Atom(name: '_FormStore.age');

  @override
  int get age {
    _$ageAtom.context.enforceReadPolicy(_$ageAtom);
    _$ageAtom.reportObserved();
    return super.age;
  }

  @override
  set age(int value) {
    _$ageAtom.context.conditionallyRunInAction(() {
      super.age = value;
      _$ageAtom.reportChanged();
    }, _$ageAtom, name: '${_$ageAtom.name}_set');
  }

  final _$genderAtom = Atom(name: '_FormStore.gender');

  @override
  int get gender {
    _$genderAtom.context.enforceReadPolicy(_$genderAtom);
    _$genderAtom.reportObserved();
    return super.gender;
  }

  @override
  set gender(int value) {
    _$genderAtom.context.conditionallyRunInAction(() {
      super.gender = value;
      _$genderAtom.reportChanged();
    }, _$genderAtom, name: '${_$genderAtom.name}_set');
  }

  final _$addressAtom = Atom(name: '_FormStore.address');

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

  final _$usernameCheckAtom = Atom(name: '_FormStore.usernameCheck');

  @override
  ObservableFuture<bool> get usernameCheck {
    _$usernameCheckAtom.context.enforceReadPolicy(_$usernameCheckAtom);
    _$usernameCheckAtom.reportObserved();
    return super.usernameCheck;
  }

  @override
  set usernameCheck(ObservableFuture<bool> value) {
    _$usernameCheckAtom.context.conditionallyRunInAction(() {
      super.usernameCheck = value;
      _$usernameCheckAtom.reportChanged();
    }, _$usernameCheckAtom, name: '${_$usernameCheckAtom.name}_set');
  }

  final _$validateNameAsyncAction = AsyncAction('validateName');

  @override
  Future<dynamic> validateName(List<String> names) {
    return _$validateNameAsyncAction.run(() => super.validateName(names));
  }

  final _$_FormStoreActionController = ActionController(name: '_FormStore');

  @override
  void validateAge(int value) {
    final _$actionInfo = _$_FormStoreActionController.startAction();
    try {
      return super.validateAge(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateGender(int value) {
    final _$actionInfo = _$_FormStoreActionController.startAction();
    try {
      return super.validateGender(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateLine1(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction();
    try {
      return super.validateLine1(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateRegion(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction();
    try {
      return super.validateRegion(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateAddress(Address address) {
    final _$actionInfo = _$_FormStoreActionController.startAction();
    try {
      return super.validateAddress(address);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'firstName: ${firstName.toString()},lastName: ${lastName.toString()},age: ${age.toString()},gender: ${gender.toString()},address: ${address.toString()},usernameCheck: ${usernameCheck.toString()},fullName: ${fullName.toString()},canMoveToNextPage: ${canMoveToNextPage.toString()}';
    return '{$string}';
  }
}

mixin _$FormErrorState on _FormErrorState, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors)).value;

  final _$firstNameAtom = Atom(name: '_FormErrorState.firstName');

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

  final _$lastNameAtom = Atom(name: '_FormErrorState.lastName');

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

  final _$emailAtom = Atom(name: '_FormErrorState.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_FormErrorState.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$ageAtom = Atom(name: '_FormErrorState.age');

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

  final _$genderAtom = Atom(name: '_FormErrorState.gender');

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

  final _$line1Atom = Atom(name: '_FormErrorState.line1');

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

  final _$line2Atom = Atom(name: '_FormErrorState.line2');

  @override
  String get line2 {
    _$line2Atom.context.enforceReadPolicy(_$line2Atom);
    _$line2Atom.reportObserved();
    return super.line2;
  }

  @override
  set line2(String value) {
    _$line2Atom.context.conditionallyRunInAction(() {
      super.line2 = value;
      _$line2Atom.reportChanged();
    }, _$line2Atom, name: '${_$line2Atom.name}_set');
  }

  final _$districtAtom = Atom(name: '_FormErrorState.district');

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

  final _$regionAtom = Atom(name: '_FormErrorState.region');

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
        'firstName: ${firstName.toString()},lastName: ${lastName.toString()},email: ${email.toString()},password: ${password.toString()},age: ${age.toString()},gender: ${gender.toString()},line1: ${line1.toString()},line2: ${line2.toString()},district: ${district.toString()},region: ${region.toString()},hasErrors: ${hasErrors.toString()}';
    return '{$string}';
  }
}

mixin _$Address on _AddressBase, Store {
  final _$line1Atom = Atom(name: '_AddressBase.line1');

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

  final _$line2Atom = Atom(name: '_AddressBase.line2');

  @override
  String get line2 {
    _$line2Atom.context.enforceReadPolicy(_$line2Atom);
    _$line2Atom.reportObserved();
    return super.line2;
  }

  @override
  set line2(String value) {
    _$line2Atom.context.conditionallyRunInAction(() {
      super.line2 = value;
      _$line2Atom.reportChanged();
    }, _$line2Atom, name: '${_$line2Atom.name}_set');
  }

  final _$districtAtom = Atom(name: '_AddressBase.district');

  @override
  District get district {
    _$districtAtom.context.enforceReadPolicy(_$districtAtom);
    _$districtAtom.reportObserved();
    return super.district;
  }

  @override
  set district(District value) {
    _$districtAtom.context.conditionallyRunInAction(() {
      super.district = value;
      _$districtAtom.reportChanged();
    }, _$districtAtom, name: '${_$districtAtom.name}_set');
  }

  final _$regionAtom = Atom(name: '_AddressBase.region');

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

  final _$postalCodeAtom = Atom(name: '_AddressBase.postalCode');

  @override
  int get postalCode {
    _$postalCodeAtom.context.enforceReadPolicy(_$postalCodeAtom);
    _$postalCodeAtom.reportObserved();
    return super.postalCode;
  }

  @override
  set postalCode(int value) {
    _$postalCodeAtom.context.conditionallyRunInAction(() {
      super.postalCode = value;
      _$postalCodeAtom.reportChanged();
    }, _$postalCodeAtom, name: '${_$postalCodeAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'line1: ${line1.toString()},line2: ${line2.toString()},district: ${district.toString()},region: ${region.toString()},postalCode: ${postalCode.toString()}';
    return '{$string}';
  }
}
