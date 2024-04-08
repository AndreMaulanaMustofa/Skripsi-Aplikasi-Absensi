// ignore_for_file: file_names

import 'package:absen_polinema/content/LocationSystem/geofencing_service.dart';
import 'package:absen_polinema/content/LocationSystem/location_service.dart';
import 'package:absen_polinema/content/scanPage.dart';
import 'package:flutter/material.dart';
import 'package:absen_polinema/content/mapPage.dart';
import 'package:absen_polinema/content/user.dart';

class BottomNavigate extends StatefulWidget {
  final String NIM;
  final String namaLengkap;
  final String Domisili;
  final String kelas;
  final String nomorTelp;
  final String semester;
  final String jenisKelamin;
  
  const BottomNavigate({
    super.key,
    required this.NIM,
    required this.namaLengkap, 
    required this.Domisili, 
    required this.kelas,
    required this.nomorTelp, 
    required this.semester, 
    required this.jenisKelamin
  });

  @override
  State<BottomNavigate> createState() => _BottomNavigateState();
}

class _BottomNavigateState extends State<BottomNavigate> {
  int _selectedIndex = 0;
  LocationService locationService = LocationService();
  double latitude = 0.0;
  double longitude = 0.0;
  bool zoneStatus = false;

  @override
  void initState() {
    super.initState();
    locationService.locationStream.listen((userLocation) {
      setState(() {
        latitude = userLocation.latitude;
        longitude = userLocation.longitude;

        if (GeofenceHaversine.isInsideGeofence(latitude, longitude)) {
          print('User telah memasuki zona');
          zoneStatus = true;
        } else {
          print('User sedang diluar zona');
          zoneStatus = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: "Map",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts), 
            label: "Data Mahasiswa",
          ),
        ],
        iconSize: 25,
        selectedIconTheme: const IconThemeData(color: Colors.black, size: 30),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        // selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        showUnselectedLabels: false,

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(zoneStatus){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => scanPage(
                  NIM: widget.NIM,
                  namaLengkap: widget.namaLengkap,
                  kelas: widget.kelas,
                  semester: widget.semester,
                )
              ),
            );
          }else{
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Success"),
                  content: Text("Lokasi anda tidak berada di kampus!"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("OK"),
                    ),
                  ],
                );
              },
            );
          }
        },
        child: Icon(Icons.qr_code_scanner_rounded),
        backgroundColor: (zoneStatus) ?Color.fromARGB(255, 175, 117, 30) : Colors.grey.shade700,
        foregroundColor: Colors.white,
      ),
      body: _selectedIndex == 0 ? UserPage(
          NIM: widget.NIM,
          namaLengkap: widget.namaLengkap,
          Domisili: widget.Domisili,
          nomorTelp: widget.nomorTelp,
          kelas: widget.kelas,
          jenisKelamin: widget.jenisKelamin
        ) : const mapPage(),
      ),
    );
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  // List<Widget> pageList = [
  //   const UserPage(NIM: widget.NIM),
  //   const mapPage(),
  // ];
}