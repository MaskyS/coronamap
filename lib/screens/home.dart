import 'dart:convert';

import 'package:coronamapp/config/app_localizations.dart';
import 'package:coronamapp/constants/routes.dart';
import 'package:coronamapp/utils/marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boom_menu/flutter_boom_menu.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong/latlong.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Widget marker = Container(
    child: Center(
      child: Icon(
        Icons.person_pin,
        color: Colors.white,
      ),
    ),
    width: 10,
    height: 10,
    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
  );

  List<Marker> markers = [];
  int pointIndex;
  List points = [
    LatLng(-20.303443, 57.567211),
  ];

  @override
  void initState() {
    pointIndex = 0;
    _controller = AnimationController(
      vsync: this,
    );
    _startAnimation();
    fetchPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: null,
        title: Text(
          "DepistazMu",
          style: GoogleFonts.rubik(fontWeight: FontWeight.w500),
        ),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: points[0],
          zoom: 10,
          plugins: [
            MarkerClusterPlugin(),
          ],
        ),
        layers: [
          TileLayerOptions(
            urlTemplate:
                "https://api.mapbox.com/styles/v1/brunobernard-cyberstorm/ck83ewn0t60en1imfefnq6rmz/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYnJ1bm9iZXJuYXJkLWN5YmVyc3Rvcm0iLCJhIjoiY2s4M2RoZDMzMGVtcjNrcXRpaDR5NTNsNyJ9.k5tTHoB34znEr6sJkpvHFA",
          ),
          MarkerClusterLayerOptions(
            maxClusterRadius: 120,
            size: Size(40, 40),
            anchor: AnchorPos.align(AnchorAlign.center),
            fitBoundsOptions: FitBoundsOptions(
              padding: EdgeInsets.all(50),
            ),
            markers: markers,
            polygonOptions: PolygonOptions(
              borderColor: Colors.redAccent,
              color: Colors.black12,
              borderStrokeWidth: 3,
            ),
            builder: (context, markers) {
              return CustomPaint(
                painter: SpritePainter(_controller),
                child: Container(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Text("${markers.length.toString()}"),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: BoomMenu(
        backgroundColor: Colors.orange,
        animatedIconTheme: IconThemeData(size: 22.0),
        overlayColor: Colors.black,
        overlayOpacity: 0.7,
        fabMenuBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fabAlignment: Alignment.bottomCenter,
        titleColor: Colors.black,
        child: Icon(Icons.add_alert),
        children: [
          MenuItem(
            child: Icon(Icons.warning, color: Colors.white),
            title: AppLocalizations.of(context).translate("test_button_label"),
            titleColor: Colors.white,
            subtitle: AppLocalizations.of(context).translate("test_button_subtitle"),
            subTitleColor: Colors.white,
            backgroundColor: Colors.deepOrange,
            onTap: () => Navigator.pushNamed(context, Routes.detectionPage),
          ),
          MenuItem(
            child: Icon(Icons.shopping_basket, color: Colors.white),
            title: AppLocalizations.of(context).translate("supplies_button_label"),
            titleColor: Colors.white,
            subtitle:
                AppLocalizations.of(context).translate("supplies_button_subtitle"),
            subTitleColor: Colors.white,
            backgroundColor: Colors.lightBlue,
            onTap: () => Navigator.pushNamed(context, Routes.suppliesPage),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.stop();
    _controller.reset();
    _controller.repeat(
      period: Duration(seconds: 1),
    );
  }

  Future fetchPoints() async {
    final response = await http.get(
        'https://us-central1-corona-mapp.cloudfunctions.net/getAllLocation');

    if (response.statusCode == 200) {
      List<dynamic> points = json.decode(response.body);

      points.forEach((value) {
        markers.add(Marker(
          anchorPos: AnchorPos.align(AnchorAlign.center),
          height: 30,
          width: 30,
          point: LatLng(
              value['position'][1],
              value['position'][
                  0]), // Mapbox read Long and lat last, here its lat then long... (shrug)
          builder: (ctx) => marker,
        ));
      });
      if (mounted) {
        setState(() {
          markers = List.from(markers);
        });
      }

    } else {
      throw Exception('Failed to load markers');
    }
  }
}
