import 'package:coronamapp/config/app_localizations.dart';
import 'package:coronamapp/models/geolocation.dart';
import 'package:coronamapp/models/user.dart';
import 'package:coronamapp/repository/user_repository.dart';
import 'package:coronamapp/step2_store.dart';
import 'package:coronamapp/constants/routes.dart';
import 'package:coronamapp/form_store.dart';
import 'package:coronamapp/screens/symptoms_store.dart';
import 'package:coronamapp/widgets/step1_form.dart';
import 'package:coronamapp/widgets/step2_form.dart';
import 'package:coronamapp/widgets/step3_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class SymptomsForm extends StatefulWidget {
  @override
  _SymptomsFormState createState() => _SymptomsFormState();
}

class _SymptomsFormState extends State<SymptomsForm> {
  final s1Index = 0;
  final s2Index = 1;
  final s3Index = 2;

  var _currentStep = 0;
  Step1Store _store;
  Step2Store _step2Store;
  Step3Store _step3Store;

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
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
    _store = Provider.of<Step1Store>(context);
    _step2Store = Provider.of<Step2Store>(context);
    _step3Store = Provider.of<Step3Store>(context);

    if (!_isLoaded)
      return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).translate("form_title"))),
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
            title: Text(_currentStep == s1Index ?
            AppLocalizations.of(context).translate('step1_personal_details') : ''),
            isActive: (_currentStep == 0),
            state: getStepState(s1Index),
          ),
          Step(
            content: Step2Form(),
            title: Text(_currentStep == s2Index ? AppLocalizations.of(context).translate("step2_pre_conditions") : ''),
            isActive: _currentStep == s2Index,
            state: getStepState(s2Index),
          ),
          Step(
            content: Step3Form(),
            title: Text(_currentStep == s3Index ? AppLocalizations.of(context).translate("step3_symptoms") : ''),
            isActive: (_currentStep == s3Index),
            state: getStepState(s3Index),
          ),
        ],
      ),
    );
  }

  void saveAndNext(User user) {
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
            user.symptoms = _step3Store.symptomsList;
            user.firstSymptomDate = _step3Store.firstDate;
            _getCurrentLocation().then((value) {
              user.location = Location(
                latitude: _currentPosition.latitude.toString(),
                longitude: _currentPosition.longitude.toString(),
                positionBasedAddress: _positionBasedAddress,
              );
              Navigator.pop(context);
            });

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
        Navigator.pushReplacementNamed(context, Routes.thankYouPage);
      }
    }
  }

  Future<void> _getCurrentLocation() {
    return geolocator.getCurrentPosition().then((Position position) async {
      setState(() {
        _currentPosition = position;
      });

      await _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  Future<void> _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _positionBasedAddress =
            "${place.subThoroughfare}, ${place.thoroughfare}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}";
      });
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
              label: Text(AppLocalizations.of(context).translate("step_back"), style: buttonStyle),
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
<<<<<<< HEAD
                      _currentStep == 2 ? "FINISH" : "NEXT",
=======
                      _currentStep == 1 ?  AppLocalizations.of(context).translate("step_finish") : AppLocalizations.of(context).translate("step_next"),
>>>>>>> 5f51837ff17d8a10f0ced26ca0021ee5791247cb
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
