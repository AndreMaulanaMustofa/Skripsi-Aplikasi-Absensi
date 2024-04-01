import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class scanPage extends StatefulWidget {
  const scanPage({super.key});

  @override
  State<scanPage> createState() => _scanPageState();
}

class _scanPageState extends State<scanPage> {

  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  QRViewController ? controller;
  Barcode? result;

  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller){
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) { 
      setState(() {
        result = scanData;
      });
    });
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
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: (result != null)
                    ? Text(
                        'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                    : Text('Scan a code'),
                ),
              )
            ],
          ) 
        ),
      ),
    );
  }
}