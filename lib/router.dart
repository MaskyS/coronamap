import 'package:coronamapp/constants/routes.dart';
import 'package:coronamapp/screens/help_form.dart';
import 'package:coronamapp/screens/supplies_result.dart';
import 'package:coronamapp/stores/help_form_store.dart';
import 'package:coronamapp/stores/step2_store.dart';
import 'package:coronamapp/stores/step1_store.dart';
import 'package:coronamapp/screens/home.dart';
import 'package:coronamapp/screens/splash.dart';
import 'package:coronamapp/screens/detection_form.dart';
import 'package:coronamapp/stores/step3_store.dart';
import 'package:coronamapp/screens/test_result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.testResultPage:
        var risk = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => TestResult(
            risk: risk,
          ),
        );
      case Routes.suppliesResultPage:
        return MaterialPageRoute(
          builder: (_) => SuppliesResult(),
        );
      case Routes.detectionPage:
        return MaterialPageRoute(
          builder: (_) => MultiProvider(
            providers: [
              Provider<Step1Store>(create: (_) => Step1Store()),
              Provider<Step2Store>(create: (_) => Step2Store()),
              Provider<Step3Store>(create: (_) => Step3Store()),
            ],
            child: SymptomsForm(),
          ),
        );
      case Routes.splashPage:
        return MaterialPageRoute(builder: (_) => Splash());
      case Routes.suppliesPage:
        return MaterialPageRoute(
          builder: (_) => MultiProvider(
            providers: [
              Provider<Step1Store>(create: (_) => Step1Store()),
              Provider<NecessitiesStore>(create: (_) => NecessitiesStore()),
            ],
            child: HelpForm(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('404 Not Found !')),
          ),
        );
    }
  }
}
