import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corona Map',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

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
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => SymptomsForm())),
        tooltip: 'Report Symptômes',
        label: Text("Mo Ena Symptômes"),
        backgroundColor: Colors.orange,
      ),
    );
  }
}

class SymptomsForm extends StatefulWidget {
  @override
  _SymptomsFormState createState() => _SymptomsFormState();
}

class _SymptomsFormState extends State<SymptomsForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Covid-19 Depistage")),
      body: Form(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: <Widget>[
            SizedBox(height: 20),
            Column(
              children: <Widget>[
                SectionHeaderText("Information Personelle"),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Spacer(flex: 1),
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Nom",
                        ),
                      ),
                    ),
                    Spacer(flex: 1),
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Nom",
                        ),
                      ),
                    ),
                    Spacer(flex: 1),
                  ],
                )
              ],
            ),
            SizedBox(height: 100),
            Row(
              children: <Widget>[
                Spacer(flex: 1),
                Expanded(
                  flex: 5,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Age"),
                  ),
                ),
                Spacer(flex: 1),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: <Widget>[
                      SectionHeaderText("SEXE"),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: "M",
                              groupValue: null,
                              onChanged: (val) {}),
                          Text("M"),
                          Radio(
                              value: "F",
                              groupValue: null,
                              onChanged: (val) {}),
                          Text("F"),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 1),
              ],
            ),
            SizedBox(height: 75),
            SectionHeaderText("LOCALISATION"),
            TextFormField(
              decoration: InputDecoration(labelText: "ADDRESSE DE RESIDENCE"),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeaderText extends StatelessWidget {
  final String text;

  SectionHeaderText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(color: Colors.black87, fontSize: 15),
    );
  }
}
