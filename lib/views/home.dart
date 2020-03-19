
import 'package:coronamapp/constants/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CoronaMap"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("Wassup")],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.warning),
        onPressed: () => Navigator.pushNamed(
            context, Routes.FORM_PAGE),
        tooltip: 'Report Symptômes',
        label: Text("Mo Ena Symptômes"),
        backgroundColor: Colors.orange,
      ),
    );
  }
}