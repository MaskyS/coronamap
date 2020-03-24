import 'package:coronamapp/constants/routes.dart';
import 'package:coronamapp/screens/supplies_form.dart';
import 'package:coronamapp/screens/supplies_result.dart';
import 'package:coronamapp/stores/supplies_step_store.dart';
import 'package:coronamapp/stores/symptoms_step_store.dart';
import 'package:coronamapp/stores/contact_details_step_store.dart';
import 'package:coronamapp/screens/home.dart';
import 'package:coronamapp/screens/splash.dart';
import 'package:coronamapp/screens/detection_form.dart';
import 'package:coronamapp/stores/conditions_step_store.dart';
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
              Provider<ContactDetailsStepStore>(create: (_) => ContactDetailsStepStore()),
              Provider<ConditionsStepStore>(create: (_) => ConditionsStepStore()),
              Provider<SymptomsStepStore>(create: (_) => SymptomsStepStore()),
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
              Provider<ContactDetailsStepStore>(create: (_) => ContactDetailsStepStore()),
              Provider<SuppliesStepStore>(create: (_) => SuppliesStepStore()),
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
