import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

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
  var _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Covid-19 Depistage")),
      body: Stepper(
        physics: ClampingScrollPhysics(),
        type: StepperType.horizontal,
        onStepContinue: () {
          setState(() => _currentStep++);
        },
        onStepCancel: () {
          setState(() => _currentStep--);
        },
        currentStep: _currentStep,
        onStepTapped: (int stepNo) {
          setState(() => _currentStep = stepNo);
        },
        steps: [
          Step(
            content: Step1Form(),
            title: Text("Personal Details"),
          ),
          Step(
            content: Step2Form(),
            title: Text("Symptoms"),
          ),
        ],
      ),
    );
  }
}

class Step1Form extends StatefulWidget {
  @override
  _Step1FormState createState() => _Step1FormState();
}

class _Step1FormState extends State<Step1Form> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
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
                          labelText: "Prenom",
                        ),
                      ),
                    ),
                    Spacer(flex: 1),
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Surnom",
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

class Step2Form extends StatefulWidget {
  @override
  _Step2FormState createState() => _Step2FormState();
}

class _Step2FormState extends State<Step2Form> {
  List<Symptom> _symptomsList = [Symptom("name")];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        SectionHeaderText("REMPLI OU BAN SYMPTOMS"),
        ChipsInput(
          decoration: InputDecoration(
            labelText: "Select Symptoms",
          ),
          maxChips: 3,
          findSuggestions: (String query) {
            if (query.length != 0) {
              var lowercaseQuery = query.toLowerCase();
              return _symptomsList.where((symptoms) {
                return symptoms.name
                    .toLowerCase()
                    .contains(query.toLowerCase());
              }).toList(growable: false)
                ..sort((a, b) => a.name
                    .toLowerCase()
                    .indexOf(lowercaseQuery)
                    .compareTo(b.name.toLowerCase().indexOf(lowercaseQuery)));
            } else {
              return const <Symptom>[];
            }
          },
          onChanged: (data) {
            print(data);
          },
          chipBuilder: (context, state, profile) {
            return InputChip(
              key: ObjectKey(profile),
              label: Text(profile.name),
              // avatar: CircleAvatar(
              //   backgroundImage: NetworkImage(profile.imageUrl),
              // ),
              onDeleted: () => state.deleteChip(profile),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            );
          },
          suggestionBuilder: (context, state, profile) {
            return ListTile(
              key: ObjectKey(profile),
              // ! TODO Add images for symptoms
              // leading: CircleAvatar(
              //   backgroundImage: NetworkImage(profile.imageUrl),
              // ),
              title: Text(profile.name),
              // subtitle: Text(profile.email),
              onTap: () => state.selectSuggestion(profile),
            );
          },
        )
      ],
    );
  }
}

class Symptom {
  String name;
  Symptom(this.name);
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
