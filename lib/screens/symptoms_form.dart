import 'package:coronamapp/step2_store.dart';
import 'package:coronamapp/constants/routes.dart';
import 'package:coronamapp/form_store.dart';
import 'package:coronamapp/screens/symptoms_store.dart';
import 'package:coronamapp/widgets/step1_form.dart';
import 'package:coronamapp/widgets/step2_form.dart';
import 'package:coronamapp/widgets/step3_form.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    _store = Provider.of<Step1Store>(context, listen: false);
    _step2Store = Provider.of<Step2Store>(context, listen: false);
    _step3Store = Provider.of<Step3Store>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text("Covid-19 Depistage")),
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
            title: Text(_currentStep == s1Index ? "Personal Details" : ''),
            isActive: (_currentStep == 0),
            state: getStepState(s1Index),
          ),
          Step(
            content: Step2Form(),
            title: Text(_currentStep == s2Index ? "Prexisting Conditions" : ''),
            isActive: _currentStep == s2Index,
            state: getStepState(s2Index),
          ),
          Step(
            content: Step3Form(),
            title: Text(_currentStep == s3Index ? "Symptoms" : ''),
            isActive: (_currentStep == s3Index),
            state: getStepState(s3Index),
          ),
        ],
      ),
    );
  }

  void _onStepContinue() {
    if (_currentStep == s1Index) {
      _store.validateAll();
      if (_store.canMoveToNextPage) {
        increaseStep();
      }
    }

    if (_currentStep == s2Index) {
      increaseStep();
    }

    if (_currentStep == s3Index) {
      _step3Store.validateAll();
      if (_step3Store.canCompleteForm) {
        var user = _store.userPersonalFormData;
        user.firstSymptomDate = _step3Store.firstDate;
        user.symptoms = _step3Store.symptomsList;
        Navigator.pushReplacementNamed(context, Routes.thankYouPage,
            arguments: user);
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
        _currentStep = stepNo;
      } else {
        _store.validateAll();
        if (_store.canMoveToNextPage) {
          _currentStep = stepNo;
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
              label: Text("BACK", style: buttonStyle),
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
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      _currentStep == 1 ? "FINISH" : "NEXT",
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
