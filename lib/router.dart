import 'package:coronamapp/constants/routes.dart';
import 'package:coronamapp/form_store.dart';
import 'package:coronamapp/screens/home.dart';
import 'package:coronamapp/screens/splash.dart';
import 'package:coronamapp/screens/symptoms_form.dart';
import 'package:coronamapp/screens/thank_you.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.thankYouPage:
        return MaterialPageRoute(builder: (_) => ThankYouForm());
      case Routes.formPage:
        return MaterialPageRoute(
          builder: (_) => Provider(
            create: (_) => FormStore(),
            child: SymptomsForm(),
          ),
        );
      case Routes.splashPage:
        return MaterialPageRoute(builder: (_) => Splash());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('404 Not Found !')),
                ));
    }
  }
}
