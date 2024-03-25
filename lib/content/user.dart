import 'dart:convert';

import 'package:absen_polinema/content/mapPage.dart';
import 'package:flutter/material.dart';
import 'package:absen_polinema/content/login.dart';
import 'package:http/http.dart' as http;

class UserPage extends StatefulWidget {
  final String NIM;
  final String namaLengkap;
  final String Domisili;
  final String kelas;
  final String nomorTelp;
  
  const UserPage({
    super.key,
    required this.NIM,
    required this.namaLengkap, 
    required this.Domisili, 
    required this.kelas, 
    required this.nomorTelp,
  });

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  TextEditingController nimController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController domisiliController = TextEditingController();
  TextEditingController kelasController = TextEditingController();
  TextEditingController nomorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nimController = TextEditingController(text: widget.NIM);
    namaController = TextEditingController(text: widget.namaLengkap);
    domisiliController = TextEditingController(text: widget.Domisili);
    kelasController = TextEditingController(text: widget.kelas);
    nomorController = TextEditingController(text: widget.nomorTelp);
  }

  Future<void> _update() async {
    var url = Uri.parse("http://192.168.18.204/skripsi_system/update.php");
    var response = await http.post(
      url,
      body: {
        "NIM": nimController.text,
        "namaLengkap": namaController.text,
        "Domisili" : domisiliController.text,
        "NoTelp" : nomorController.text,
      },
    );

    if (response.statusCode == 200) {
      try {
        // Handle the response here
        var jsonResponse = json.decode(response.body);

        if (jsonResponse['status'] == 'success') {
          // Navigate to the next screen on successful login
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Success"),
                content: Text(jsonResponse['message'] ?? "Data telah diupdate!"),
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
        } else {
          // Handle case when login is not successful
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Warning"),
                content: Text(jsonResponse['message'] ?? "Data Gagal di Update"),
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
      } catch (error) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Warning"),
              content: Text("Server tidak terhubung!"),
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

        // Handle error during JSON decoding
        print("Error decoding JSON: $error");
      }
    } else {
      // Handle HTTP error status codes
      print("HTTP error ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                child: const Center(
                  child: Text(
                    "Data Mahasiswa",
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
            Container(
              child: Image(
                  image: AssetImage('img/polinema_logo.png'),
                  width: 100,
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 20),
            ),
            Container(
              child: Text("Data Mahasiswa Polinema",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontFamily: 'Roboto',
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.only(top: 15),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 320,
              child: TextField(
                controller: namaController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 320,
              child: TextField(
                controller: nimController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.article_outlined,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 24),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 320,
              height: 49,
              child: Row(
                children: [
                  Icon(
                    Icons.class_outlined,
                    color: Colors.black,
                    size: 20,
                  ),
                  SizedBox(width: 15), // Jarak antara ikon dan teks
                  Text(
                    "${widget.kelas}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Roboto',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.lock_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 320,
              child: TextField(
                controller: domisiliController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.gps_fixed,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 320,
              child: TextField(
                controller: nomorController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.call,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 320,
              child: TextButton.icon(
                
                onPressed: () {
                  _update();
                },
                icon: const Icon(
                  Icons.cloud_upload_outlined,
                  color: Colors.black,
                  size: 20,
                ),
                label: const Text(
                  "\t\tUpdate Data",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}