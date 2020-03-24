import 'package:coronamapp/constants/routes.dart';
import 'package:coronamapp/models/necessity.dart';
import 'package:coronamapp/models/user.dart';
import 'package:coronamapp/repository/user_repository.dart';
import 'package:coronamapp/store_state_enum.dart';
import 'package:coronamapp/stores/help_form_store.dart';
import 'package:coronamapp/stores/step1_store.dart';
import 'package:coronamapp/widgets/step1_form.dart';
import 'package:flutter/material.dart';

import 'package:coronamapp/config/app_localizations.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

class NecessitiesForm extends StatefulWidget {
  @override
  _NecessitiesFormState createState() => _NecessitiesFormState();
}

class _NecessitiesFormState extends State<NecessitiesForm> {
  NecessitiesStore _store;

  // TODO extract and make this common for every widget.
  final _baseDeco = InputDecoration(
    fillColor: Colors.grey.shade100,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 0.0, style: BorderStyle.none),
    ),
  );

  @override
  void initState() {
    super.initState();
    _store = Provider.of<NecessitiesStore>(context, listen: false);
    _store.getNecessitiesFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FormBuilder(
          child: Column(
            children: <Widget>[
              Text(
                "Choose your necessities", // Translate
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 20),
              Observer(builder: (_) {
                if (_store.state == StoreState.loading ||
                    _store.state == StoreState.initial) {
                  return Center(child: CircularProgressIndicator());
                }
                return FormBuilderCheckboxList(
                  attribute: 'necessities',
                  initialValue: <Necessity>[],
                  options: _store.necessities
                      .map(
                        (e) => FormBuilderFieldOption(
                          value: e,
                          child: Text(
                            e.ref, //TODO!
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (v) {
                    _store.chosenNecessities = v as List<Necessity>;
                  },
                );
              }),
              Observer(builder: (_) {
                return FormBuilderTextField(
                  attribute: 'other_necessities',
                  initialValue: _store.otherNecessities,
                  onChanged: (v) => _store.otherNecessities = v,
                  decoration: _baseDeco.copyWith(labelText: 'Other'),
                  validators: [
                    FormBuilderValidators.required(errorText: 'required')
                  ], // TODO!
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}

class HelpForm extends StatefulWidget {
  @override
  _HelpFormState createState() => _HelpFormState();
}

class _HelpFormState extends State<HelpForm> {
  final s1Index = 0;
  final s2Index = 1;
  var _currentStep = 0;

  Step1Store _store;
  NecessitiesStore _necessitiesStore;

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
        _isLoaded = true;
      });
    }
  }

  /// ! TODO Extract all Stepper/Geolocation logic into a store.
  @override
  Widget build(BuildContext context) {
    _store = Provider.of<Step1Store>(context);
    _necessitiesStore = Provider.of<NecessitiesStore>(context);

    if (!_isLoaded)
      return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    return Scaffold(
      appBar: AppBar(title: Text("G")),
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
            content: NecessitiesForm(),
            title: Text(_currentStep == s2Index
                ? AppLocalizations.of(context).translate("step2_pre_conditions")
                : ''),
            isActive: _currentStep == s2Index,
            state: getStepState(s2Index),
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
      user.necessities = _necessitiesStore.chosenNecessities;
      saveAndNext(user);
      userRepo.save(user);
      Navigator.pushReplacementNamed(
        context,
        Routes.thankYouPage,
      );
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
        if (_necessitiesStore.necessities != null)
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
