import 'package:depistazmu/config/app_localizations.dart';
import 'package:depistazmu/constants/routes.dart';
import 'package:depistazmu/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  int _langIndex = 0;
  SharedPreferences _prefs;

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
  Future<bool> _goToHomeIfLocaleAlreadySelected() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getBool(Utils.permanentLanguage);
  }

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
                            'Depistaz-Mu',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                letterSpacing: 3,
                                fontSize: 24,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
               FutureBuilder(
                 future: _goToHomeIfLocaleAlreadySelected(),
                 builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data) {
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        Navigator.pushNamedAndRemoveUntil(context, Routes.homePage, (route) => false);
                      });
                   }
                    return Expanded(
                      flex: 2,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                   return  Expanded(
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
                                             ? Colors.orange.withOpacity(.90)
                                             : Colors.transparent,
                                         blurRadius: 15.0,
                                         spreadRadius: 2.0,
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
                                 Navigator.pop(context);
                               }
                             },
                           ),
                         ),
                         Center(
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text(
                               'With geolocation/Avek ou position/Avec Géolocalisation',
                               style: TextStyle(
                                 fontSize: 8.0,
                                 color: Color.fromRGBO(128, 122, 122, 0.8),
                               ),
                             ),
                           ),
                         ),
                       ],
                     ),
                   );
                 },
               )
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

    _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('language_code', locale.languageCode);
    await _prefs.setString('country_code', locale.countryCode);
    await _prefs.setBool(Utils.permanentLanguage, true);

    AppLocalizations.load(locale);
  }

  Future<PermissionStatus> requestPermission(PermissionGroup permission) async {
    final List<PermissionGroup> permissions = <PermissionGroup>[permission];
    final Map<PermissionGroup, PermissionStatus> permissionRequestResult =
        await PermissionHandler().requestPermissions(permissions);

    return permissionRequestResult[permission];
  }
}
