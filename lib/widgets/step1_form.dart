
import 'package:coronamapp/district_enum.dart';
import 'package:coronamapp/form_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Step1Form extends StatefulWidget {
  Step1Form({Key key}) : super(key: key);

  @override
  _Step1FormState createState() => _Step1FormState();
}

class _Step1FormState extends State<Step1Form> {
  Step1Store _store;
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
    _store = Provider.of<Step1Store>(context, listen: false);
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
                    labelText: "Prenom﹡",
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
                    labelText: "Surnom﹡",
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
                        hint: Text('Sexe﹡'),
                        decoration:
                            _baseDeco.copyWith(errorText: _store.error.gender),
                        onChanged: (v) => _store.gender = v,
                        initialValue: _store.gender,
                        items: ['Male', 'Female']
                            .map(
                              (gender) => DropdownMenuItem(
                                value: gender,
                                child: Text("$gender"),
                              ),
                            )
                            .toList(),
                      );
                    }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    flex: 5,
                    child: Observer(builder: (_) {
                      return FormBuilderDateTimePicker(
                        attribute: "date",
                        inputType: InputType.date,
                        initialValue: _store.dob,
                        onChanged: (v) => _store.dob = v,
                        format: DateFormat("yyyy-MM-dd"),
                        initialDatePickerMode: DatePickerMode.year,
                        decoration: _baseDeco.copyWith(
                          labelText: "DOB﹡",
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
                          labelText: "Mobile No﹡",
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
                      labelText: "Street Name﹡",
                      errorText: _store.error.line1),
                );
              }),
              SizedBox(height: 10),
              Observer(builder: (_) {
                return FormBuilderTextField(
                  attribute: "address_line_2",
                  initialValue: _store.address.line2,
                  onChanged: (v) => _store.address.line2 = v,
                  decoration: _baseDeco.copyWith(labelText: "Street Name 2"),
                );
              }),
              SizedBox(height: 20),
              Observer(builder: (_) {
                return FormBuilderDropdown(
                  attribute: "district",
                  initialValue: _store.address.district,
                  onChanged: (v) => _store.address.district = v,
                  decoration: _baseDeco.copyWith(
                    errorText: _store.error.district,
                  ),
                  hint: Text('Choisir ou Districte﹡'),
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
                            labelText: 'Region﹡',
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
