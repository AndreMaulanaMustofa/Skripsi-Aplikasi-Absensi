// ignore_for_file: sort_child_properties_last, camel_case_types

import 'package:flutter/material.dart';

class itemPage extends StatefulWidget {
  const itemPage({super.key});

  @override
  State<itemPage> createState() => _itemPageState();
}

class _itemPageState extends State<itemPage> {
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
                child: Text("Your Location",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                ),
                ),
              ),
              color: Colors.green,
              height: 60,
            ),
          ],
        ),
      ),
      ),
    );
  }
}
