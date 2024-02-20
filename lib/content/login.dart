import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:absen_polinema/content/BottomNavigator/BottomNavigate.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class loginPage extends StatefulWidget {
  const loginPage({super.key});
  
  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> _login() async {
    var url = Uri.parse("http://192.168.18.204/skripsi_system/login.php");
    var response = await http.post(
      url,
      body: {
        "NIM": username.text,
        "Password": password.text,
      },
    );

    if (response.statusCode == 200) {
      try {
        // Handle the response here
        var jsonResponse = json.decode(response.body);

        if (jsonResponse['status'] == 'success') {
          // Navigate to the next screen on successful login
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavigate(),
            ),
          );
        } else {
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
      } catch (error) {
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
              child: Text("LOGIN",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Roboto",
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
            child: Center(
              child: TextField(
                controller: username,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "NIM",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                style: const TextStyle(
                  fontFamily: "Calibri",
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 30),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: password,
                        textAlign: TextAlign.center,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Calibri",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    _login();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 149, right: 149),
                    child: Text("Login"),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                  ),
                ),
              ),
            )
        ],
      ),
      ),
      ),
    );
  }
}