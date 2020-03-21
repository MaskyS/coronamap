import 'package:coronamapp/config/app_localizations.dart';
import 'package:coronamapp/constants/routes.dart';
import 'package:coronamapp/main.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  int _langIndex = 0;

  var localeFlag = [
    {
      "flag": "assets/uk_flag.png",
      "locale": Locale('en', 'EN'),
    },
    {
      "flag": "assets/mauritius_flag.png",
      "locale": Locale('en', 'MU'),
    },
    {
      "flag": "assets/france_flag.png",
      "locale": Locale('fr', 'FR'),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Center(
                        child: Image.asset(
                          'assets/logo.png',
                          height: 200,
                          width: 200,
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'CORONA-MAPP',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 3,
                                fontSize: 24,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Language/Langaz/Langue:',
                            style: TextStyle(
                                color: Color.fromRGBO(128, 122, 122, 1)),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:
                            localeFlag.asMap().entries.map<Widget>((entry) {
                          int idx = entry.key;
                          var value = entry.value;
                          return GestureDetector(
                            onTap: () => setState(() {
                              switchLocale(idx, value, context);
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: _langIndex == idx
                                          ? Colors.black54
                                          : Colors.transparent,
                                      blurRadius: 15.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(
                                        1.0,
                                        1.0,
                                      ),
                                    )
                                  ]),
                              child: Image.asset(value['flag'],
                                  height: 37, width: 37),
                            ),
                          );
                        }).toList(),
                      ),
                      Center(
                        child: RaisedButton.icon(
                          color: Colors.red,
                          textColor: Colors.white,
                          icon: Icon(Icons.arrow_forward),
                          label: Text("GO"),
                          // TODO Make language matter.
                          onPressed: () async {
                            PermissionStatus permissionResult =
                                await requestPermission(
                                    PermissionGroup.location);
                            if (permissionResult == PermissionStatus.granted) {
                              Navigator.pushNamed(context, Routes.homePage);
                            }
                          },
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Avec Géolocalisation/Avek ou position/With geolocation',
                            style: TextStyle(
                                fontSize: 8.0,
                                color: Color.fromRGBO(128, 122, 122, 0.8)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future switchLocale(
      int idx, Map<String, Object> value, BuildContext context) async {
    _langIndex = idx;
    Locale locale = value['locale'];

    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', locale.languageCode);
    await prefs.setString('countryCode', locale.countryCode);

    MyApp.setLocale(context, locale);
  }

  Future<PermissionStatus> requestPermission(PermissionGroup permission) async {
    final List<PermissionGroup> permissions = <PermissionGroup>[permission];
    final Map<PermissionGroup, PermissionStatus> permissionRequestResult =
        await PermissionHandler().requestPermissions(permissions);

    return permissionRequestResult[permission];
  }
}
