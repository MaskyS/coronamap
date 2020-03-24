import 'package:depistazmu/config/app_localizations.dart';
import 'package:depistazmu/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var prefs;

  @override
  void initState() {
    this._fetchLocale().then((locale) {
      AppLocalizations.load(locale);
    });
    super.initState();
  }

  AppLocalizationsDelegate _localeOverrideDelegate =
  AppLocalizationsDelegate(Locale('en', 'EN'));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Depistaz-Mu',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.rubikTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      supportedLocales: [
        Locale('en', 'EN'),
        Locale('en', 'MU'),
        Locale('fr', 'FR'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        _localeOverrideDelegate,
      ],
      onGenerateRoute: Router.generateRoute,
      initialRoute: Routes.splashPage,
    );
  }

  _fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      return null;
    }
    return Locale(
        prefs.getString('language_code'), prefs.getString('country_code'));
  }
}
