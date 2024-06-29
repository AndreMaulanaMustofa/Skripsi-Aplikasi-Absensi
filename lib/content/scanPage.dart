import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;

class scanPage extends StatefulWidget {
  final String NIM;
  final String namaLengkap;
  final String kelas;
  final String semester;

  const scanPage(
      {super.key,
      required this.NIM,
      required this.namaLengkap,
      required this.kelas,
      required this.semester});

  @override
  State<scanPage> createState() => _scanPageState();
}

class _scanPageState extends State<scanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;
  Barcode? result;
  String semester = '';
  String kelas = '';
  String matkul = '';
  String jamMatkul = '';
  String hari = '';
  bool isBottomSheetOpened = false;

  Future<void> _create(matkul, jam, hari) async {
    var primaryURL =
        Uri.parse("http://192.168.18.204/skripsi_system/update.php");
    var secondaryURL =
        Uri.parse("http://192.168.73.182/skripsi_system/update.php");
    var thirdURL = 
        Uri.parse("http://192.168.74.187/skripsi_system/update.php");
    var response;

    try {
      response = await http.post(
        primaryURL,
        body: {
          "NIM": nimController.text,
          "namaMahasiswa": namaController.text,
          "kelas": kelasController.text,
          "semester": semesterController.text,
          "mataKuliah": matkul,
          "jam_kuliah": jam,
          "hari": hari
        },
      ).timeout(const Duration(seconds: 1));
    } catch (error) {
      print("Error connecting to primaryURL: $error");

      try {
        // Jika koneksi ke primaryURL gagal, coba koneksi ke secondaryURL
        response = await http.post(
          secondaryURL,
          body: {
            "NIM": nimController.text,
            "namaMahasiswa": namaController.text,
            "kelas": kelasController.text,
            "semester": semesterController.text,
            "mataKuliah": matkul,
            "jam_kuliah": jam,
            "hari": hari
          },
        ).timeout(const Duration(seconds: 1));
      } catch (errorSecondary) {
        print("Error connecting to secondaryURL: $errorSecondary");

        try {
          response = await http.post(
            thirdURL,
            body: {
              "NIM": nimController.text,
              "namaMahasiswa": namaController.text,
              "kelas": kelasController.text,
              "semester": semesterController.text,
              "mataKuliah": matkul,
              "jam_kuliah": jam,
              "hari": hari
            },
          ).timeout(const Duration(seconds: 1));
        } catch (errorThird) {
          print("Error connecting to thirdURL: $errorThird");

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
    }

    if (response.statusCode == 200) {
      try {
        // Handle the response here
        var jsonResponse = json.decode(response.body);

        if (jsonResponse['status'] == 'success') {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Success"),
                content: Text("Absensi telah ditambahkan!"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
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
                content: Text("Absensi Gagal Ditambahkan!"),
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
              content: const Text("Server tidak terhubung!"),
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
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if (!isBottomSheetOpened) {
          if (result!.code != null && result!.code!.contains(',')) {
            kelas = result!.code!.split(',')[0].trim();
            semester = result!.code!.split(',')[1].trim();
            matkul = result!.code!.split(',')[2].trim();
            jamMatkul = result!.code!.split(',')[3].trim();
            hari = result!.code!.split(',')[4].trim();

            List<String> jamMenit = jamMatkul.split(':');
            int jamKuliah = int.parse(jamMenit[0]);
            int menitKuliah = int.parse(jamMenit[1]);

            DateTime waktuSekarang = DateTime.now();
            int jamSekarang = waktuSekarang.hour;
            int menitSekarang = waktuSekarang.minute;

            int selisihMenit =
                (jamKuliah - jamSekarang) * 60 + (menitKuliah - menitSekarang);

            if (selisihMenit > 15) {
              isBottomSheetOpened = true;
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Pemberitahuan"),
                    content: const Text("Anda terlalu awal untuk absen!"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          isBottomSheetOpened = false;
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  );
                },
              );
            } else if (kelas != widget.kelas || semester != widget.semester) {
              isBottomSheetOpened = true;

              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Pemberitahuan"),
                      content: const Text("Anda melakukan absen di kelas lain"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            isBottomSheetOpened = false;
                          },
                          child: const Text("OK"),
                        )
                      ],
                    );
                  });
            } else {
              isBottomSheetOpened = true;

              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  isDismissible: true,
                  builder: (BuildContext context) {
                    return Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(right: 50, left: 50),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 31, 3, 155),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.center,
                              width: 100,
                              height: 40,
                              child: const Text(
                                'Data Absensi',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Roboto',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 55),
                              margin: const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 100,
                              child: Text(
                                'NIM:',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 65),
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 100,
                              child: Text(
                                '${nimController.text}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 55),
                              margin: const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 100,
                              child: const Text(
                                'Nama Mahasiswa:',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 65),
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 100,
                              child: Text(
                                '${namaController.text}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 55),
                              margin: const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 100,
                              child: const Text(
                                'Kelas:',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 65),
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 100,
                              child: Text(
                                '${kelasController.text}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 55),
                              margin: const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 100,
                              child: const Text(
                                'Semester:',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 65),
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 100,
                              child: Text(
                                '${semesterController.text}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 55),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 100,
                              child: const Text(
                                'Hari:',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 65),
                              margin: const EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 100,
                              child: Text(
                                '${hari}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 55),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 100,
                              child: const Text(
                                'Mata Kuliah:',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 65),
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 20),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 100,
                              child: Text(
                                '${matkul}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 55),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 100,
                              child: const Text(
                                'Jam Matkul:',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 65),
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 20),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 100,
                              child: Text(
                                '${jamMatkul}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green.shade400,
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.save_alt_sharp,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Absen',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    _create(matkul, jamMatkul, hari);
                                  },
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red.shade400,
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.cancel,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Cancel',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    isBottomSheetOpened = false;
                                  },
                                ),
                              ],
                            ),
                          ],
                        ));
                  });
            }
          }
        }
        ;
      });
    });
  }

  TextEditingController nimController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController semesterController = TextEditingController();
  TextEditingController kelasController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nimController = TextEditingController(text: widget.NIM);
    namaController = TextEditingController(text: widget.namaLengkap);
    semesterController = TextEditingController(text: widget.semester);
    kelasController = TextEditingController(text: widget.kelas);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  cameraFacing: CameraFacing.back,
                  formatsAllowed: const [BarcodeFormat.qrcode],
                  overlay: QrScannerOverlayShape(
                    borderColor: Colors.blue,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: MediaQuery.of(context).size.width * 0.8,
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
