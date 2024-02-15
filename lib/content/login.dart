import 'package:flutter/material.dart';
import 'package:absen_polinema/content/BottomNavigator/BottomNavigate.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});
  
  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 240),
            child: const Center(
              child: Text("PROTOTYPE",
            style: TextStyle(
              color: Colors.green,
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
                decoration: const InputDecoration(
                  hintText: "Email",
                  icon: Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Icon(Icons.account_circle, size: 35,),
                  ),
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                controller: username,
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
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Password",
                          icon: Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Icon(Icons.lock, size: 35,),
                          ),
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                        controller: password,
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
                    var usernametxt = username.text;
                    var passwordtxt = password.text;
                    if(usernametxt == "andre1442" && passwordtxt == "password"){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomNavigate(),
                        ),
                      );
                    }else if(passwordtxt != "password"  && passwordtxt.isEmpty){
                      AlertDialog alert = AlertDialog(
                        title: const Text("Warning"),
                        content: const Text("Password anda salah"),
                        actions: [
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            }, 
                            child: const Text("OK")
                          ),
                        ],
                      );

                      showDialog(
                        context: context, 
                        builder: (BuildContext context) {
                          return alert;
                        }
                      );
                    }else if(usernametxt.isEmpty && passwordtxt.isEmpty){
                      AlertDialog warn = AlertDialog(
                        title: const Text("Warning"),
                        content: const Text("Isi Data Terlebih Dahulu!"),
                        actions: [
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            }, 
                            child: const Text("OK")
                          ),
                        ],
                      );

                      showDialog(
                        context: context, 
                        builder: (BuildContext context) {
                          return warn;
                        }
                      );
                    }
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
    );
  }
}