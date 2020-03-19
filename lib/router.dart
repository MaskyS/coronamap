import 'package:coronamapp/constants/routes.dart';
import 'package:coronamapp/views/home.dart';
import 'package:coronamapp/views/splash.dart';
import 'package:coronamapp/views/symptoms_form.dart';
import 'package:coronamapp/views/thank_you.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.thankYouPage:
        return MaterialPageRoute(builder: (_) => ThankYouForm());
      case Routes.formPage:
        return MaterialPageRoute(builder: (_) => SymptomsForm());
      case Routes.splashPage:
        return MaterialPageRoute(builder: (_) => Splash());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('404 Not Found !')),
            ));
    }
  }
}