import 'package:coronamapp/config/app_localizations.dart';
import 'package:coronamapp/constants/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CoronaMap"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("Bonjour!")],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.warning),
        onPressed: () async {
          Navigator.pushNamed(context, Routes.formPage);
        },
        tooltip: AppLocalizations.of(context).translate("tooltip_report_button"),
        label: Text(AppLocalizations.of(context).translate("report_button")),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
