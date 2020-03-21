
import 'package:coronamapp/models/condition.dart';
import 'package:coronamapp/step2_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
    _store = Provider.of<Step2Store>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      child: Column(
        children: <Widget>[
          Text(
            "Choisir ban condition pre-existent ki ou ena:",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          SizedBox(height: 20),
          FormBuilderCheckboxList(
            attribute: 'prexisting_symptoms',
            initialValue: _store.chosenConditionsList,
            options: _store.preExistingConditionList
                .map(
                  (e) => FormBuilderFieldOption(
                    value: e,
                    child: Text(e.ref),
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
          ),
        ],
      ),
    );
  }
}
