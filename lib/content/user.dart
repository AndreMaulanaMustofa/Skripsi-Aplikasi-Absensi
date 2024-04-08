import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  final String NIM;
  final String namaLengkap;
  final String Domisili;
  final String kelas;
  final String nomorTelp;
  final String jenisKelamin;
  
  const UserPage({
    super.key,
    required this.NIM,
    required this.namaLengkap, 
    required this.Domisili, 
    required this.kelas, 
    required this.nomorTelp, 
    required this.jenisKelamin
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
  TextEditingController jenisController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nimController = TextEditingController(text: widget.NIM);
    namaController = TextEditingController(text: widget.namaLengkap);
    domisiliController = TextEditingController(text: widget.Domisili);
    kelasController = TextEditingController(text: widget.kelas);
    nomorController = TextEditingController(text: widget.nomorTelp);
    jenisController = TextEditingController(text: widget.jenisKelamin);
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
                readOnly: true,
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
                readOnly: true,
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
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 320,
              child: TextField(
                controller: kelasController,
                readOnly: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.class_outlined,
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
                controller: domisiliController,
                readOnly: true,
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
                readOnly: true,
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
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 320,
              child: TextField(
                controller: jenisController,
                readOnly: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: (widget.jenisKelamin == 'Laki-Laki')
                    ? Icon(
                    Icons.boy_sharp,
                    color: Colors.black,
                    size: 20,
                  ) : Icon(
                    Icons.girl_sharp,
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
          ],
        ),
      ),
    ),
    );
  }
}