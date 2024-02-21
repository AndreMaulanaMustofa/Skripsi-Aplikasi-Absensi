// ignore_for_file: sort_child_properties_last, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class mapPage extends StatefulWidget {
  const mapPage({super.key});

  @override
  State<mapPage> createState() => _mapPageState();
}

class _mapPageState extends State<mapPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
          children: [
            Container(
              child: const Center(
                child: Text("Your Location",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                ),
                ),
              ),
              color: Colors.green,
              height: 60,
            ),
            Flexible(
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(-7.94295, 112.63572),
                  initialZoom: 19,
                ), 
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(-7.94295, 112.63572),
                        child: Builder(
                          builder: (context) => Icon(
                            Icons.pin_drop,
                            color: Colors.red,
                          )
                        )
                      )
                    ]
                  )
                ]
              )
            )
          ],
        ),
      ),
      ),
    );
  }
}
