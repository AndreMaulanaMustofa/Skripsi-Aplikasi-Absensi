// ignore_for_file: file_names

import 'package:absen_polinema/content/LocationSystem/location_service.dart';
import 'package:absen_polinema/content/LocationSystem/user_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class mapPage extends StatefulWidget {
  const mapPage({super.key});

  @override
  State<mapPage> createState() => _mapPageState();
}

class _mapPageState extends State<mapPage> {
  LocationService locationService = LocationService();
  MapController mapController = MapController();
  double latitude  = 0;
  double longitude = 0;
  
  @override
  void initState(){
    super.initState();
    locationService.locationStream.listen((userLocation) {
      setState(() {
        latitude  = userLocation.latitude;
        longitude = userLocation.longitude;
      });
    });
  }

  @override
  void dispose(){
    locationService.dispose();
    super.dispose();
  }

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
                child: Text("Polinema Location",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                ),
                ),
              ),
              color: Color.fromARGB(255, 31, 3, 155),
              height: 60,
            ),
            Flexible(
              child: FlutterMap(
                options: const MapOptions(
                  initialCenter: LatLng(-7.94385, 112.61463),
                  initialZoom: 18,
                ),
                mapController: mapController,
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(latitude, longitude),
                        child: Builder(
                          builder: (context) => const Icon(
                            Icons.circle_rounded,
                            color: Colors.blue,
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
      floatingActionButton: Padding(
          padding:
              const EdgeInsets.only(bottom: 25.0),
          child: FloatingActionButton(
            onPressed: () {
              mapController.move(LatLng(latitude, longitude), 19);
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.my_location),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
  }
}
