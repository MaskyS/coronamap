import 'package:depistazmu/config/app_localizations.dart';
import 'package:depistazmu/risk_enum.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class TestResult extends StatefulWidget {
  TestResult({Key key, @required this.risk}) : super(key: key);
  final Risk risk;
  @override
  _TestResultState createState() => _TestResultState();
}

class _TestResultState extends State<TestResult> {
  final _buttonStyle = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Spacer(flex: 2),
          Expanded(
            flex: 3,
            child: getIcon(widget.risk),
          ),
          Spacer(flex: 2),
          Expanded(
            flex:5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                getText(widget.risk),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Spacer(flex: 1),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    FlatButton(
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text(
                            AppLocalizations.of(context).translate("step_back"),
                            style: _buttonStyle),
                      ),
                      onPressed: () => Navigator.pop(context),
                      color: Colors.green,
                      textColor: Colors.white,
                    ),
                    // ! TODO Use location-specific hotlines instead
                    FlatButton.icon(
                      onPressed: () => UrlLauncher.launch("tel://114"),
                      icon: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Icon(Icons.call),
                      ),
                      label: Text(
                          AppLocalizations.of(context)
                              .translate("call_emergency"),
                          style: _buttonStyle),
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Icon getIcon(Risk risk) {
    switch (risk) {
      case Risk.mild:
        return Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 200,
        );
      case Risk.atRisk:
        return Icon(
          Icons.warning,
          color: Colors.orange,
          size: 200,
        );
        break;
      case Risk.severe:
        return Icon(
          Icons.add_call,
          color: Colors.redAccent,
          size: 200,
        );
        break;
      default:
    }
  }

  String getText(Risk risk) {
    switch (risk) {
      case Risk.mild:
        return AppLocalizations.of(context).translate("thank_report");

      case Risk.atRisk:
        return AppLocalizations.of(context).translate("at_risk_report");

      case Risk.severe:
        return AppLocalizations.of(context).translate("severe_report");
    }
  }
}
