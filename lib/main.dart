import 'package:coronamapp/router.dart';
import 'package:coronamapp/views/symptoms_form.dart';
import 'package:flutter/material.dart';

import 'constants/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corona Mapp',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      onGenerateRoute: Router.generateRoute,
      initialRoute: Routes.SPLASH_PAGE,
    );
  }
}

