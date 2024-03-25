import 'package:flutter/material.dart';

class scanPage extends StatefulWidget {
  const scanPage({super.key});

  @override
  State<scanPage> createState() => _scanPageState();
}

class _scanPageState extends State<scanPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Text('Percobaan Page'),
        ),
      ),
    );
  }
}