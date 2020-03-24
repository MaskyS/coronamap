import 'package:coronamapp/config/app_localizations.dart';
import 'package:coronamapp/models/necessity.dart';
import 'package:coronamapp/store_state_enum.dart';
import 'package:coronamapp/stores/supplies_step_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SuppliesStepForm extends StatefulWidget {
  @override
  _SuppliesStepFormState createState() => _SuppliesStepFormState();
}

class _SuppliesStepFormState extends State<SuppliesStepForm> {
  SuppliesStepStore _store;

  // TODO extract and make this common for every widget.
  final _baseDeco = InputDecoration(
    fillColor: Colors.grey.shade100,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 0.0, style: BorderStyle.none),
    ),
    labelStyle: TextStyle(fontSize: 18),
  );

  @override
  void initState() {
    super.initState();
    _store = Provider.of<SuppliesStepStore>(context, listen: false);
    _store.getNecessitiesFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FormBuilder(
          key: _store.fbKey,
          autovalidate: true,
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
                            AppLocalizations.of(context).translate(e.ref),
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (v) {
                    _store.chosenNecessities = v as List<Necessity>;
                  },
                  validators: [
                    FormBuilderValidators.required(
                      errorText: AppLocalizations.of(context)
                          .translate("must_fill_necessities"),
                    )
                  ],
                );
              }),
              SizedBox(height: 20),
              Observer(builder: (_) {
                return FormBuilderTextField(
                  attribute: 'other_necessities',
                  initialValue: _store.otherNecessities,
                  onChanged: (v) => _store.otherNecessities = v,
                  decoration: _baseDeco.copyWith(
                    labelText:
                        AppLocalizations.of(context).translate('other_label'),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
