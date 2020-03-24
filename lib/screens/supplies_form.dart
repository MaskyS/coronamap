import 'package:depistazmu/constants/routes.dart';
import 'package:depistazmu/models/geolocation.dart';
import 'package:depistazmu/models/user.dart';
import 'package:depistazmu/repository/user_repository.dart';
import 'package:depistazmu/screens/location_helper.dart';
import 'package:depistazmu/stores/supplies_step_store.dart';
import 'package:depistazmu/stores/contact_details_step_store.dart';
import 'package:depistazmu/widgets/contact_details_step_form.dart';
import 'package:depistazmu/widgets/supplies_step_form.dart';
import 'package:flutter/material.dart';

import 'package:depistazmu/config/app_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:location/location.dart' as Geo;

class HelpForm extends StatefulWidget {
  @override
  _HelpFormState createState() => _HelpFormState();
}

class _HelpFormState extends State<HelpForm> {
  final s1Index = 0;
  final s2Index = 1;
  var _currentStep = 0;

  ContactDetailsStepStore _store;
  SuppliesStepStore _necessitiesStore;
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

  /// ! TODO Extract all Stepper/Geolocation logic into a store.
  @override
  Widget build(BuildContext context) {
    _store = Provider.of<ContactDetailsStepStore>(context);
    _necessitiesStore = Provider.of<SuppliesStepStore>(context);

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
          AppLocalizations.of(context).translate("supplies_form_title"),
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
            content: SuppliesStepForm(),
            title: Text(_currentStep == s2Index
                ? AppLocalizations.of(context).translate("step_supplies_title")
                : ''),
            isActive: _currentStep == s2Index,
            state: getStepState(s2Index),
          ),
        ],
      ),
    );
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
      });
    }

    setState(() {
      _isLoaded = true;
    });
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
      if (_necessitiesStore.isValid) {
        _locationData = await LocationHelper.getCurrentLocation();
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            LocationHelper.getAddressFromLatLng(
              _locationData.latitude,
              _locationData.longitude,
            ).then((positionBasedAdress) {
              user.location = Location(
                latitude: _locationData.latitude.toString(),
                longitude: _locationData.longitude.toString(),
                positionBasedAddress: _positionBasedAddress,
              );

              user.necessities = _necessitiesStore.chosenNecessities;
              user.isEmergency = _necessitiesStore.isEmergency;
              userRepo.save(user);
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

        Navigator.pushReplacementNamed(
          context,
          Routes.suppliesResultPage,
        );
      }
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
        if (_necessitiesStore.isValid)
          return StepState.complete;
        else
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
                borderRadius: BorderRadius.circular(10),
              ),
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
