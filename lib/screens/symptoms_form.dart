import 'package:coronamapp/entity/symptom.dart';
import 'package:coronamapp/constants/routes.dart';
import 'package:coronamapp/district_enum.dart';
import 'package:coronamapp/form_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SymptomsForm extends StatefulWidget {
  @override
  _SymptomsFormState createState() => _SymptomsFormState();
}

class _SymptomsFormState extends State<SymptomsForm> {
  var _currentStep = 0;
  FormStore _store;

  @override
  Widget build(BuildContext context) {
    _store = Provider.of<FormStore>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("Covid-19 Depistage")),
      body: Stepper(
        physics: ClampingScrollPhysics(),
        type: StepperType.horizontal,
        onStepContinue: () {
          if (_currentStep == 0) {
            _store.validateAll();
            if (_store.canMoveToNextPage) {
              setState(() => _currentStep++);
            } else {
            }
          } else if (_currentStep == 1) {
            // TODO Validate.
            Navigator.pushReplacementNamed(
              context,
              Routes.thankYouPage,
            );
          }
        },
        onStepCancel: () {
          setState(() => _currentStep--);
        },
        currentStep: _currentStep,
        onStepTapped: (int stepNo) {
          setState(() => _currentStep = stepNo);
        },
        steps: [
          Step(
            content: Step1Form(),
            title: Text("Personal Details"),
          ),
          Step(
            content: Step2Form(),
            title: Text("Symptoms"),
          ),
        ],
      ),
    );
  }
}

class Step1Form extends StatefulWidget {
  Step1Form({Key key}) : super(key: key);

  @override
  _Step1FormState createState() => _Step1FormState();
}

class _Step1FormState extends State<Step1Form> {
  FormStore _store;
  final _baseDeco = InputDecoration(
    fillColor: Colors.grey.shade100,
    filled: true,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 0.0, style: BorderStyle.none)),
  );

  @override
  void initState() {
    super.initState();
    _store = Provider.of<FormStore>(context, listen: false);
    _store.setupValidations();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FormBuilder(
          autovalidate: true,
          child: Column(
            children: <Widget>[
              Observer(builder: (_) {
                return FormBuilderTextField(
                  attribute: 'first_name',
                  initialValue: _store.firstName,
                  onChanged: (v) => _store.firstName = v,
                  decoration: _baseDeco.copyWith(
                    labelText: "Prenom",
                    errorText: _store.error.firstName,
                  ),
                );
              }),
              SizedBox(height: 10),
              Observer(builder: (_) {
                return FormBuilderTextField(
                  attribute: 'first_name',
                  initialValue: _store.lastName,
                  onChanged: (v) => _store.lastName = v,
                  decoration: _baseDeco.copyWith(
                    labelText: "Surnom",
                    errorText: _store.error.lastName,
                  ),
                );
              }),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Observer(builder: (_) {
                      return FormBuilderDropdown(
                        attribute: "gender",
                        hint: Text('Sexe'),
                        decoration: _baseDeco,
                        initialValue: _store.gender,
                        items: ['Male', 'Female']
                            .map((gender) => DropdownMenuItem(
                                value: gender, child: Text("$gender")))
                            .toList(),
                      );
                    }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    flex: 5,
                    child: Observer(builder: (_) {
                      return FormBuilderTextField(
                        attribute: "age",
                        initialValue: _store.ageText,
                        onChanged: (v) => _store.ageText = v,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        decoration: _baseDeco.copyWith(
                          labelText: "Age",
                          errorText: _store.error.age,
                        ),
                      );
                    }),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: Observer(builder: (_) {
                      return FormBuilderTextField(
                        attribute: "mobile_no",
                        initialValue: _store.phoneNoText,
                        onChanged: (v) => _store.phoneNoText = v,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        decoration: _baseDeco.copyWith(
                          labelText: "Mobile No",
                          errorText: _store.error.phoneNo,
                        ),
                      );
                    }),
                  ),
                  Spacer(flex: 2),
                  Expanded(
                    flex: 8,
                    child: Observer(builder: (_) {
                      return FormBuilderTextField(
                        attribute: "home_no",
                        initialValue: _store.homeNoText,
                        onChanged: (v) => _store.homeNoText = v,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        decoration: _baseDeco.copyWith(
                          labelText: "Home No",
                          errorText: _store.error.homeNo,
                        ),
                      );
                    }),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Observer(builder: (_) {
                return FormBuilderTextField(
                  attribute: "address_line_1",
                  initialValue: _store.address.line1,
                  onChanged: (v) => _store.address.line1 = v,
                  decoration: _baseDeco.copyWith(
                      labelText: "Address Line 1",
                      errorText: _store.error.line1),
                );
              }),
              SizedBox(height: 10),
              Observer(builder: (_) {
                return FormBuilderTextField(
                  attribute: "address_line_2",
                  initialValue: _store.address.line2,
                  onChanged: (v) => _store.address.line2 = v,
                  decoration: _baseDeco.copyWith(labelText: "Address Line 2"),
                );
              }),
              SizedBox(height: 20),
              Observer(builder: (_) {
                return FormBuilderDropdown(
                  attribute: "district",
                  initialValue: _store.address.district,
                  onChanged: (v) => _store.address.district,
                  decoration: _baseDeco.copyWith(
                    errorText: _store.error.district,
                  ),
                  hint: Text('Choisir ou Districte'),
                  items: District.values
                      .map(
                        (distr) => DropdownMenuItem(
                          value: distr,
                          child: Text("${distr.value}"),
                        ),
                      )
                      .toList(),
                );
              }),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Observer(builder: (_) {
                      return FormBuilderTextField(
                        attribute: 'region',
                        initialValue: _store.address.region,
                        onChanged: (v) => _store.address.region = v,
                        decoration: _baseDeco.copyWith(
                            labelText: 'Region',
                            errorText: _store.error.region),
                      );
                    }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    flex: 5,
                    child: Observer(builder: (_) {
                      return FormBuilderTextField(
                        attribute: "postal_code",
                        initialValue: _store.address.postalCodeText,
                        onChanged: (v) => _store.address.postalCodeText = v,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        decoration: _baseDeco.copyWith(
                          labelText: "Code Postale",
                          errorText: _store.error.postalCode,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }
}

class Step2Form extends StatefulWidget {
  @override
  _Step2FormState createState() => _Step2FormState();
}

class _Step2FormState extends State<Step2Form> {
  List<Symptom> _symptomsList = [Symptom(label: "name")];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        SectionHeaderText("REMPLI OU BAN SYMPTOMS"),
        ChipsInput(
          decoration: InputDecoration(
            labelText: "Select Symptoms",
          ),
          maxChips: 3,
          findSuggestions: (String query) {
            if (query.length != 0) {
              var lowercaseQuery = query.toLowerCase();
              return _symptomsList.where((symptoms) {
                return symptoms.label
                    .toLowerCase()
                    .contains(query.toLowerCase());
              }).toList(growable: false)
                ..sort((a, b) => a.label
                    .toLowerCase()
                    .indexOf(lowercaseQuery)
                    .compareTo(b.label.toLowerCase().indexOf(lowercaseQuery)));
            } else {
              return const <Symptom>[];
            }
          },
          onChanged: (data) {
            print(data);
          },
          chipBuilder: (context, state, symptom) {
            return InputChip(
              key: ObjectKey(symptom),
              label: Text(symptom.label),
              // avatar: CircleAvatar(
              //   backgroundImage: NetworkImage(profile.imageUrl),
              // ),
              onDeleted: () => state.deleteChip(symptom),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            );
          },
          suggestionBuilder: (context, state, symptom) {
            return ListTile(
              key: ObjectKey(symptom),
              // ! TODO Add images for symptoms
              // leading: CircleAvatar(
              //   backgroundImage: NetworkImage(profile.imageUrl),
              // ),
              title: Text(symptom.label),
              // subtitle: Text(profile.email),
              onTap: () => state.selectSuggestion(symptom),
            );
          },
        )
      ],
    );
  }
}


class SectionHeaderText extends StatelessWidget {
  final String text;

  SectionHeaderText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(color: Colors.black87, fontSize: 15),
    );
  }
}
