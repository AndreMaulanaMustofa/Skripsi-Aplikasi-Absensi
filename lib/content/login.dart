// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:absen_polinema/content/BottomNavigator/BottomNavigate.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> setLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
  }
  
  Future<void> _login() async {
    var primaryURL =
        Uri.parse("http://192.168.74.154/skripsi_system/login.php");
    var secondaryURL =
        Uri.parse("http://192.168.73.242/skripsi_system/login.php");
    var response;

    try {
      // Coba kirim permintaan ke primaryURL
      response = await http.post(
        primaryURL,
        body: {
          "NIM": username.text,
          "Password": password.text,
        },
      ).timeout(const Duration(seconds: 1));
    } catch (error) {
      print("Error connecting to primaryURL: $error");

      try {
        // Jika koneksi ke primaryURL gagal, coba koneksi ke secondaryURL
        response = await http.post(
          secondaryURL,
          body: {
            "NIM": username.text,
            "Password": password.text,
          },
        ).timeout(const Duration(seconds: 1));
      } catch (errorSecondary) {
        print("Error connecting to secondaryURL: $errorSecondary");

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Warning"),
              content: const Text("Tidak dapat terhubung ke server!"),
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
    }

    // Hasil response apabila login berhasil
    if (response.statusCode == 200) {
      // Handle the response here
      var jsonResponse = json.decode(response.body);

      if (jsonResponse['status'] == 'success') {
        await setLoggedIn();

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('NIM', jsonResponse['NIM']);
        await prefs.setString('namaLengkap', jsonResponse['namaLengkap']);
        await prefs.setString('Domisili', jsonResponse['Domisili']);
        await prefs.setString('kelas', jsonResponse['kelas']);
        await prefs.setString('nomorTelp', jsonResponse['NoTelp']);
        await prefs.setString('semester', jsonResponse['semester']);
        await prefs.setString('jenisKelamin', jsonResponse['jenisKelamin']);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavigate(
                NIM: jsonResponse['NIM'],
                namaLengkap: jsonResponse['namaLengkap'],
                Domisili: jsonResponse['Domisili'],
                nomorTelp: jsonResponse['NoTelp'],
                kelas: jsonResponse['kelas'],
                semester: jsonResponse['semester'],
                jenisKelamin: jsonResponse['jenisKelamin']),
          ),
        );
      } else if (context != null && mounted) {
        // Handle case when login is not successful
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Warning"),
              content: Text(jsonResponse['message'] ?? "Login failed"),
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
    }
    // } catch (error) {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: const Text("Warning"),
    //         content: const Text("Tidak dapat terhubung ke server!"),
    //         actions: [
    //           TextButton(
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //             child: const Text("OK"),
    //           ),
    //         ],
    //       );
    //     },
    //   );

    //   // Handle error saat koneksi ke server
    //   print("Error connecting to server: $error");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 2, 49, 88),
            image: DecorationImage(
              image: const AssetImage('img/wallpaperPoltek.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                const Color.fromARGB(255, 54, 66, 77).withOpacity(0.2),
                BlendMode.dstATop,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: const Center(
                    child: Image(
                  image: const AssetImage('img/polinema_logo.png'),
                  width: 80,
                  alignment: Alignment.center,
                )),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: const Color.fromARGB(255, 175, 117, 30),
                  border: Border.all(
                      color: const Color.fromARGB(255, 175, 117, 30),
                      width: 2.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  'SISTEM ABSENSI POLITEKNIK NEGERI MALANG MENGGUNAKAN QR CODE',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: const Color.fromARGB(255, 31, 3, 155),
                    border: Border.all(
                        color: const Color.fromARGB(255, 31, 3, 155),
                        width: 2.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          'SELAMAT DATANG',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: TextField(
                          maxLength: 10,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          controller: username,
                          decoration: const InputDecoration(
                            hintText: 'NIM',
                            fillColor: Colors.white,
                            filled: true,
                            counterText: '',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: TextField(
                          maxLength: 10,
                          textAlign: TextAlign.center,
                          obscureText: true,
                          controller: password,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            fillColor: Colors.white,
                            filled: true,
                            counterText: '',
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              _login();
                            },
                            child: const Text("Login"),
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 175, 117, 30),
                              onPrimary: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
