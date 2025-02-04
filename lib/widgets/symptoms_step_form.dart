import 'package:depistazmu/config/app_localizations.dart';
import 'package:depistazmu/models/symptom.dart';
import 'package:depistazmu/stores/symptoms_step_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../store_state_enum.dart';

class Step3Form extends StatefulWidget {
  @override
  _Step3FormState createState() => _Step3FormState();
}

class _Step3FormState extends State<Step3Form> {
  final _baseDeco = InputDecoration(
    fillColor: Colors.grey.shade100,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 0.0, style: BorderStyle.none),
    ),
  );

  SymptomsStepStore _store;

  @override
  void initState() {
    super.initState();
    _store = Provider.of<SymptomsStepStore>(context, listen: false);
    _store.getSymptomsFromFirestore();
    _store.setupValidations();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      autovalidate: true,
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Observer(builder: (_) {
            if (_store.state == StoreState.loading ||
                _store.state == StoreState.initial) {
              return Center(child: CircularProgressIndicator());
            }

            return Observer(builder: (_) {
              return FormBuilderFilterChip(
                attribute: 'symptoms',
                options: _store.symptomsList
                    .map((e) => FormBuilderFieldOption(
                          value: e,
                          child: Text(
                              AppLocalizations.of(context).translate(e.ref)),
                        ))
                    .toList(),
                spacing: 10,
                alignment: WrapAlignment.center,
                initialValue: <Symptom>[],
                selectedColor: Colors.green.shade300,
                onChanged: (v) {
                  List<Symptom> temp = v as List<Symptom>;
                  _store.chosenSymptoms = temp;
                },
                decoration: _baseDeco.copyWith(
                  labelText: AppLocalizations.of(context)
                      .translate("form_choose_symptom"),
                  errorText: _store.chosenSymptomsErrorText == null
                      ? null
                      : AppLocalizations.of(context)
                          .translate(_store.chosenSymptomsErrorText),
                ),
              );
            });
          }),
          SizedBox(height: 30),
          Observer(builder: (_) {
            return FormBuilderTextField(
              attribute: 'other_symptoms',
              initialValue: _store.otherSymptoms,
              onChanged: (v) => _store.otherSymptoms = v,
              decoration: _baseDeco.copyWith(
                labelText: AppLocalizations.of(context)
                    .translate('form_other_symptoms'),
              ),
            );
          }),
          Observer(builder: (_) {
            return FormBuilderDateTimePicker(
              attribute: 'first_date',
              inputType: InputType.date,
              initialDatePickerMode: DatePickerMode.day,
              format: DateFormat("dd-MM-yyyy"),
              initialDate: _store.firstDate,
              initialValue: _store.firstDate,
              onChanged: (v) => _store.firstDate = v,
              decoration: _baseDeco.copyWith(
                labelText: AppLocalizations.of(context)
                    .translate("form_date_infection"),
                errorText: _store.firstDateErrorText == null
                    ? null
                    : AppLocalizations.of(context)
                        .translate(_store.firstDateErrorText),
              ),
            );
          }),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }
}
