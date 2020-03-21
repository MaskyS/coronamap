import 'package:coronamapp/config/app_localizations.dart';
import 'package:coronamapp/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state =
    context.findAncestorStateOfType<_MyAppState>();

    state.setState(() {
      state.locale = newLocale;
    });
  }
}

class _MyAppState extends State<MyApp> {

  Locale locale;
  bool localeLoaded = false;

  @override
  void initState() {
    super.initState();
    this._fetchLocale().then((locale) {
      setState(() {
        this.localeLoaded = true;
        this.locale = locale;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    if (this.localeLoaded == false) {
      return CircularProgressIndicator();
    } else {
      print("LOCALE/FLUTTER");
      print(this.locale == null ? "No locale": this.locale.languageCode);
      return MaterialApp(
        title: 'Corona Mapp',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        locale: this.locale == null ? Locale('en', 'EN'): this.locale,

        supportedLocales: [
          Locale('en', 'EN'),
          Locale('en', 'MU'),
          Locale('fr', 'FR'),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          return this.locale == null ? Locale('en', 'EN'): this.locale;
        },
        onGenerateRoute: Router.generateRoute,
        initialRoute: Routes.splashPage,
      );
    }

  }

  _fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      return null;
    }
    return Locale(prefs.getString('language_code'),
        prefs.getString('country_code'));
  }
}

