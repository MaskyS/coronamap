import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;


enum Hotlines { Production, Research, Purchasing, Marketing, Accounting }
Future<Hotlines> _asyncSimpleDialog(BuildContext context) async {
  return await showDialog<Hotlines>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select the nearby hospital!'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                UrlLauncher.launch("tel://8924");
              },
              child: const Text('Hotline - Day use'),
            ),
            SimpleDialogOption(
              onPressed: () {
                UrlLauncher.launch("tel://8925");
              },
              child: const Text('Hotline - Dr.A.G.Jeetoo – Port-Louis'),
            ),
            SimpleDialogOption(
              onPressed: () {
                UrlLauncher.launch("tel://8926");
              },
              child: const Text('Hotline - SSRN – Pamplemousses'),
            ),
            SimpleDialogOption(
              onPressed: () {
                UrlLauncher.launch("tel://8927");
              },
              child: const Text('Hotline - Hôpital de Flacq'),
            ),
            SimpleDialogOption(
              onPressed: () {
                UrlLauncher.launch("tel://8928");
              },
              child: const Text('Hotline - Victoria – Candos'),
            ),
            SimpleDialogOption(
              onPressed: () {
                UrlLauncher.launch("tel://8929");
              },
              child: const Text('Hotline - J.Nehru – Rose-Belle'),
            )
          ],
        );
      });
}

class ThankYouForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Spacer(flex: 3),
          Expanded(
            flex: 3,
            child: Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 200,
            ),
          ),
          Expanded(child: Text("Merci Pu Rapporter")),
          Spacer(flex: 1),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    FlatButton(
                      child: Text("Retour"),
                      onPressed: () => Navigator.pop(context),
                      color: Colors.green,
                    ),
                    // ! TODO Use location-specific hotlines instead
                    FlatButton.icon(
                      onPressed: ()   => UrlLauncher.launch("tel://114"),
                      icon: Icon(Icons.call),
                      label: Text("Call SAMU"),
                      color: Colors.blue,
                    ),
                    new RaisedButton(
                      onPressed: () async {
                        final Hotlines hotline = await _asyncSimpleDialog(context);
                        //print("Selected Departement is $deptName");
                      },
                      splashColor: Colors.red,
                      child: const Text(
                      'Call Hotlines'
                      )
                      //child: const Text("Simple dialog"),
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
}
