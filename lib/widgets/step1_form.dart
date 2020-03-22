import 'package:coronamapp/config/app_localizations.dart';
import 'package:coronamapp/district_enum.dart';
import 'package:coronamapp/form_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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
                  attribute: AppLocalizations.of(context).translate("first_name"),
                  initialValue: _store.firstName,
                  onChanged: (v) => _store.firstName = v,
                  decoration: _baseDeco.copyWith(
                    labelText: AppLocalizations.of(context).translate("form_first_name"),
                    errorText: _store.error.firstName == null  ? null :  AppLocalizations.of(context).translate(_store.error.firstName),
                  ),
                );
              }),
              SizedBox(height: 10),
              Observer(builder: (_) {
                return FormBuilderTextField(
                  attribute: AppLocalizations.of(context).translate("first_name"),
                  initialValue: _store.lastName,
                  onChanged: (v) => _store.lastName = v,
                  decoration: _baseDeco.copyWith(
                    labelText: AppLocalizations.of(context).translate("form_last_name"),
                    errorText: _store.error.lastName == null  ? null :  AppLocalizations.of(context).translate(_store.error.lastName),
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
                        hint: Text('form_gender'),
                        decoration:
                            _baseDeco.copyWith(errorText: _store.error.gender),
                        onChanged: (v) => _store.gender = v,
                        initialValue: _store.gender,
                        items: ['Male', 'Female']
                            .map(
                              (gender) => DropdownMenuItem(
                                value: gender,
                                child: Text(AppLocalizations.of(context).translate('form_'+gender.toLowerCase())),
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
                        datePicker: (context) async {
                          const doneStyle = TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          );
                          return DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            minTime: DateTime(1900, 5, 5),
                            maxTime: DateTime(2019, 12),
                            currentTime: _store.dob ?? DateTime(2000),
                            theme: DatePickerTheme(
                              doneStyle: doneStyle,
                              cancelStyle: TextStyle(color: Colors.redAccent),
                            ),
                          );
                        },
                        decoration: _baseDeco.copyWith(
                          labelText: AppLocalizations.of(context).translate("form_dob"),
                          errorText: _store.error.age == null  ? null :  AppLocalizations.of(context).translate(_store.error.age),
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
                          labelText: AppLocalizations.of(context).translate("form_mobile_no"),
                          errorText: _store.error.phoneNo == null  ? null :  AppLocalizations.of(context).translate(_store.error.phoneNo),
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
                          labelText: AppLocalizations.of(context).translate("form_home_no"),
                          errorText: _store.error.homeNo == null  ? null :  AppLocalizations.of(context).translate(_store.error.homeNo),
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
                      labelText: AppLocalizations.of(context).translate("form_address_line_1"),
                      errorText: _store.error.line1 == null  ? null :  AppLocalizations.of(context).translate(_store.error.line1)),
                );
              }),
              SizedBox(height: 10),
              Observer(builder: (_) {
                return FormBuilderTextField(
                  attribute: "address_line_2",
                  initialValue: _store.address.line2,
                  onChanged: (v) => _store.address.line2 = v,
                  decoration: _baseDeco.copyWith(labelText: AppLocalizations.of(context).translate("form_address_line_2")),
                );
              }),
              SizedBox(height: 20),
              Observer(builder: (_) {
                return FormBuilderDropdown(
                  attribute: "district",
                  initialValue: _store.address.district,
                  onChanged: (v) => _store.address.district = v,
                  decoration: _baseDeco.copyWith(
                    errorText: AppLocalizations.of(context).translate(_store.error.district),
                  ),
                  hint: Text(AppLocalizations.of(context).translate("form_choose_district")),
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
                            labelText: AppLocalizations.of(context).translate("form_city"),
                            errorText: _store.error.region == null  ? null :  AppLocalizations.of(context).translate(_store.error.region)),
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
                          labelText: AppLocalizations.of(context).translate("form_postal_code"),
                          errorText: _store.error.postalCode == null  ? null :  AppLocalizations.of(context).translate(_store.error.region),
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
