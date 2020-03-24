import 'package:flutter/material.dart';
import 'package:depistazmu/risk_enum.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:location/location.dart' as Geo;

import 'package:depistazmu/config/app_localizations.dart';
import 'package:depistazmu/models/geolocation.dart';
import 'package:depistazmu/models/user.dart';
import 'package:depistazmu/repository/user_repository.dart';
import 'package:depistazmu/constants/routes.dart';
import 'package:depistazmu/stores/contact_details_step_store.dart';
import 'package:depistazmu/stores/conditions_step_store.dart';
import 'package:depistazmu/stores/symptoms_step_store.dart';
import 'package:depistazmu/widgets/contact_details_step_form.dart';
import 'package:depistazmu/widgets/conditions_step_form.dart';
import 'package:depistazmu/widgets/symptoms_step_form.dart';

class SymptomsForm extends StatefulWidget {
  @override
  _SymptomsFormState createState() => _SymptomsFormState();
}

class _SymptomsFormState extends State<SymptomsForm> {
  final s1Index = 0;
  final s2Index = 1;
  final s3Index = 2;

  var _currentStep = 0;
  ContactDetailsStepStore _store;
  ConditionsStepStore _step2Store;
  SymptomsStepStore _step3Store;

  Geo.LocationData _locationData;
  String _positionBasedAddress;

  User user;
  var userRepo = UserRepository();
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    getFirebaseData();
  }

  Future<void> getFirebaseData() async {
    final storage = FlutterSecureStorage();
    var userKey = await storage.read(key: 'userKey');
    if (userKey != null) {
      user = await userRepo.getByHash(userKey);
      if (!mounted) return;
      if (user == null) {
        setState(() => _isLoaded = true);
        return;
      }

      setState(() {
        _store.setStore(user);

        if (user.preExistingConditions != null) {
          _step2Store.chosenConditionsList = user.preExistingConditions;
        }

        if (user.symptoms != null) {
          _step3Store
            ..chosenSymptoms = user.symptoms
            ..firstDate = user.firstSymptomDate;
        }
      });
    }

    setState(() {
      _isLoaded = true;
    });
  }

  /// ! TODO Extract all Stepper/Geolocation logic into a store.
  @override
  Widget build(BuildContext context) {
    _store = Provider.of<ContactDetailsStepStore>(context);
    _step2Store = Provider.of<ConditionsStepStore>(context);
    _step3Store = Provider.of<SymptomsStepStore>(context);

    if (!_isLoaded)
      return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate("test_form_title"),
          style: GoogleFonts.rubik(),
        ),
      ),
      body: Stepper(
        physics: ClampingScrollPhysics(),
        type: StepperType.horizontal,
        onStepContinue: _onStepContinue,
        onStepCancel: _onStepCancel,
        currentStep: _currentStep,
        onStepTapped: _onStepTapped,
        controlsBuilder: _buildControlButtons,
        steps: [
          Step(
            content: Step1Form(),
            title: Text(_currentStep == s1Index
                ? AppLocalizations.of(context)
                    .translate('step1_personal_details')
                : ''),
            isActive: (_currentStep == 0),
            state: getStepState(s1Index),
          ),
          Step(
            content: Step2Form(),
            title: Text(_currentStep == s2Index
                ? AppLocalizations.of(context).translate("step2_pre_conditions")
                : ''),
            isActive: _currentStep == s2Index,
            state: getStepState(s2Index),
          ),
          Step(
            content: Step3Form(),
            title: Text(_currentStep == s3Index
                ? AppLocalizations.of(context).translate("step3_symptoms")
                : ''),
            isActive: (_currentStep == s3Index),
            state: getStepState(s3Index),
          ),
        ],
      ),
    );
  }

  Future<void> saveAndNext(User user) async {
    userRepo.save(user);
    increaseStep();
  }

  void _onStepContinue() async {
    if (_currentStep == s1Index) {
      _store.validateAll();
      if (_store.canMoveToNextPage) {
        user = _store.userPersonalFormData;
        saveAndNext(user);
      }
    } else if (_currentStep == s2Index) {
      user.preExistingConditions = _step2Store.chosenConditionsList;
      saveAndNext(user);
    } else if (_currentStep == s3Index) {
      _step3Store.validateAll();
      if (_step3Store.canCompleteForm) {
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            user.symptoms = _step3Store.chosenSymptoms;
            user.firstSymptomDate = _step3Store.firstDate;
            _step3Store.calculateRisk(_store.age, _step2Store.hasConditions);
            user.risk = _step3Store.risk.value;
            _getCurrentLocation().then(
              (value) {
                user.location = Location(
                  latitude: _locationData.latitude.toString(),
                  longitude: _locationData.longitude.toString(),
                  positionBasedAddress: _positionBasedAddress,
                );
                Navigator.pop(context);
              },
            );

            return AlertDialog(
              content: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text(AppLocalizations.of(context).translate("loading")),
                  ],
                ),
              ),
            );
          },
        );

        userRepo.save(user);
        Navigator.pushReplacementNamed(
          context,
          Routes.testResultPage,
          arguments: _step3Store.risk,
        );
      }
    }
  }

  Future<void> _getCurrentLocation() async {
    Geo.Location location = Geo.Location();
    bool _serviceEnabled;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _locationData = await location.getLocation();
    _positionBasedAddress = await _getAddressFromLatLng(
        _locationData.latitude, _locationData.longitude);
  }

  Future<String> _getAddressFromLatLng(
      double latitude, double longitude) async {
    try {
      final geolocator = Geolocator()..forceAndroidLocationManager;

      List<Placemark> p =
          await geolocator.placemarkFromCoordinates(latitude, longitude);

      Placemark place = p[0];

      return _positionBasedAddress =
          "${place.subThoroughfare}, ${place.thoroughfare}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}";
    } catch (e) {
      print(e);
    }
  }

  void _onStepCancel() {
    if (_currentStep > s1Index) {
      setState(() => _currentStep--);
    }
  }

  void _onStepTapped(int stepNo) {
    if (stepNo != _currentStep) {
      if (stepNo == s1Index) {
        setState(() {
          _currentStep = stepNo;
        });
      } else {
        _store.validateAll();
        if (_store.canMoveToNextPage) {
          setState(() {
            _currentStep = stepNo;
          });
        }
      }
    }
  }

  StepState getStepState(int stepIndex) {
    if (stepIndex == _currentStep) return StepState.editing;

    switch (stepIndex) {
      case 0:
        _store.validateAll();
        if (_store.canMoveToNextPage)
          return StepState.complete;
        else
          return StepState.indexed;
        break;
      case 1:
        if (_step2Store.hasConditions)
          return StepState.complete;
        else
          return StepState.indexed;
        break;
      case 2:
        if (_step3Store.canCompleteForm && _step3Store.chosenSymptoms != null)
          return StepState.complete;
        return StepState.indexed;
        break;
      default:
        return StepState.indexed;
    }
  }

  void decreaseStep() => setState(() => _currentStep--);
  void increaseStep() => setState(() => _currentStep++);

  Widget _buildControlButtons(context, {onStepCancel, onStepContinue}) {
    var buttonStyle = TextStyle(fontWeight: FontWeight.w800);
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 25,
            child: FlatButton.icon(
              onPressed: onStepCancel,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              icon: Icon(Icons.keyboard_arrow_left),
              label: Text(AppLocalizations.of(context).translate("step_back"),
                  style: buttonStyle),
              color: Colors.grey.shade200,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Spacer(flex: 1),
          Expanded(
            flex: 25,
            child: FlatButton(
              onPressed: onStepContinue,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      _currentStep == 2
                          ? AppLocalizations.of(context)
                              .translate("step_finish")
                          : AppLocalizations.of(context).translate("step_next"),
                      style: buttonStyle,
                    ),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
              ),
              textColor: Colors.white,
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
