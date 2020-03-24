import 'package:depistazmu/config/app_localizations.dart';
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class SuppliesResult extends StatefulWidget {
  @override
  _SuppliesResultState createState() => _SuppliesResultState();
}

class _SuppliesResultState extends State<SuppliesResult> {
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
            child: Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 200,
            ),
          ),
          Spacer(flex: 2),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                AppLocalizations.of(context).translate('necessities_report'),
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
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                    // ? Replace with another hotline if needed later
                    // FlatButton.icon(
                    //   onPressed: () => UrlLauncher.launch("tel://114"),
                    //   icon: Container(
                    //     margin: EdgeInsets.symmetric(vertical: 10),
                    //     child: Icon(Icons.call),
                    //   ),
                    //   label: Text(
                    //       AppLocalizations.of(context)
                    //           .translate("call_emergency"),
                    //       style: _buttonStyle),
                    //   color: Colors.blue,
                    //   textColor: Colors.white,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
