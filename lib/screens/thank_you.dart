import 'package:coronamapp/Repository/user_repository.dart';
import 'package:coronamapp/models/user.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class ThankYouForm extends StatefulWidget {
  final User user;
  ThankYouForm({Key key, this.user}) : super(key: key);

  @override
  _ThankYouFormState createState() => _ThankYouFormState();
}

class _ThankYouFormState extends State<ThankYouForm> {
  @override
  void initState() {
    UserRepository().save(widget.user);
    super.initState();
  }

  final _buttonStyle = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 18,
  );

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
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    FlatButton(
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text("Retour", style: _buttonStyle),
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
                      label: Text("Call SAMU", style: _buttonStyle),
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
}
