import 'package:coronamapp/config/app_localizations.dart';
import 'package:coronamapp/models/condition.dart';
import 'package:coronamapp/stores/step2_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Step2Form extends StatefulWidget {
  @override
  _Step2FormState createState() => _Step2FormState();
}

class _Step2FormState extends State<Step2Form> {
  Step2Store _store;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _store = Provider.of<Step2Store>(context);

    return Column(
      children: <Widget>[
        FormBuilder(
          child: Column(
            children: <Widget>[
              Text(
                AppLocalizations.of(context)
                    .translate("form_choose_pre_condition"),
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 20),
              Observer(builder: (_) {
                return FormBuilderCheckboxList(
                  attribute: 'prexisting_symptoms',
                  initialValue: _store.chosenConditionsList,
                  options: _store.preExistingConditionList
                      .map(
                        (e) => FormBuilderFieldOption(
                          value: e,
                          child: Text(
                            AppLocalizations.of(context).translate(e.ref),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (v) {
                    List<Condition> temp = [];
                    v.forEach((element) {
                      temp.add(element as Condition);
                    });
                    _store.chosenConditionsList = temp;
                  },
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
