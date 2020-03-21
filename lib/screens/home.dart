import 'package:coronamapp/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

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
          children: <Widget>[Text("Bonjour!")],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.warning),
        onPressed: () async {
          PermissionStatus permissionResult =
              await requestPermission(PermissionGroup.location);
          if (permissionResult == PermissionStatus.granted) {
            Navigator.pushNamed(context, Routes.formPage);
          }
        },
        tooltip: 'Report Symptômes',
        label: Text("MO ENA SYMPTOMES"),
        backgroundColor: Colors.orange,
      ),
    );
  }

  Future<PermissionStatus> requestPermission(PermissionGroup permission) async {
    final List<PermissionGroup> permissions = <PermissionGroup>[permission];
    final Map<PermissionGroup, PermissionStatus> permissionRequestResult =
        await PermissionHandler().requestPermissions(permissions);

    return permissionRequestResult[permission];
  }
}
