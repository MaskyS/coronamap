import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, String> _localizedStrings;

  static Future<AppLocalizations> load(Locale locale) async {
    print('language/${locale.languageCode}_${locale.countryCode}.json');
    String jsonString =
    await rootBundle.loadString('language/${locale.languageCode}_${locale.countryCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return AppLocalizations();
  }

  String translate(String key) {
    return _localizedStrings[key];
  }
}



class AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  final Locale overriddenLocale;

  const AppLocalizationsDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) {
    return ['EN', 'MU', 'FR'].contains(locale.countryCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);


  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}