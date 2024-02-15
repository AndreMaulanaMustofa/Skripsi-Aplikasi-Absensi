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
        body: Column(
          children: [
            Container(
              child: const Center(
                child: Text("PROTOTYPE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                ),
                ),
              ),
              color: Colors.green,
              height: 170,
            ),
            Container(
              child: const Text("Promo",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: "Roboto",
              ),
              ),
              padding: const EdgeInsets.only(left: 14, top: 14),
              alignment: Alignment.topLeft,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://dorangadget.com/wp-content/uploads/2021/03/Logitech-G-Pro-Gaming-Mouse-400x400.jpg"),
                            fit: BoxFit.scaleDown,
                          ),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
                        height: 70,
                        width: 70,
                      ),
                      Container(
                        child: const Text(
                          "Mouse Logitech\nG304 Dark Speed",
                          style: TextStyle(
                              fontSize: 9, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(bottom: 5, right: 15, left: 15, top: 5),
                      ),
                      Container(
                        child: const Text(
                          "220.000",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        padding: const EdgeInsets.only(right: 15, left: 15),
                      ),
                      Container(
                        child: const Text("Save 20%",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 9,
                          color: Colors.red,
                        ),
                        textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(top: 5),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//93/MTA-2765253/acer_monitor-acer-kg251q-f--1ms-144hz-_full05.jpg"),
                            fit: BoxFit.scaleDown,
                          ),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
                        height: 70,
                        width: 70,
                      ),
                      Container(
                        child: const Text(
                          "Monitor Acer\nKG251A-F",
                          style: TextStyle(
                              fontSize: 9, 
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                        ),

                        padding: const EdgeInsets.only(
                            bottom: 5, right: 15, left: 15, top: 5),
                      ),
                      Container(
                        child: const Text(
                          "4.200.000",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        padding: const EdgeInsets.only(right: 15, left: 15),
                      ),
                      Container(
                        child: const Text(
                          "Save 5%",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 9,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(top: 5),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://carisinyal.com/wp-content/uploads/2017/09/Logitech-G733_.webp"),
                            fit: BoxFit.scaleDown,
                          ),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
                        height: 70,
                        width: 70,
                      ),
                      Container(
                        child: const Text(
                          "Headset Logitech\nG733 Dark Speed",
                          style: TextStyle(
                              fontSize: 9, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                        ),

                        padding: const EdgeInsets.only(
                            bottom: 5, right: 15, left: 15, top: 5),
                      ),
                      Container(
                        child: const Text(
                          "1.220.000",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        padding: const EdgeInsets.only(right: 15, left: 15),
                      ),
                      Container(
                        child: const Text(
                          "Save 15%",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 9,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(top: 5),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://sylargaming.com/image/cache/MSI%20GAMING%20CHAIR/SYLAR_GAMING_MSI_CH120_I_3-800x800.jpg"),
                            fit: BoxFit.scaleDown,
                          ),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
                        height: 70,
                        width: 70,
                      ),
                      Container(
                        child: const Text(
                          "Gaming Chair\nMAG CH120",
                          style: TextStyle(
                              fontSize: 9, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(
                            bottom: 5, right: 15, left: 15, top: 5),
                      ),
                      Container(
                        child: const Text(
                          "1.500.000",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        padding: const EdgeInsets.only(right: 15, left: 15),
                      ),
                      Container(
                        child: const Text(
                          "Save 10%",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 9,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(top: 5),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://assets.skor.id/crop/0x91:800x731/x/photo/2021/07/13/3981331541.jpg"),
                            fit: BoxFit.scaleDown,
                          ),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
                        height: 70,
                        width: 70,
                      ),
                      Container(
                        child: const Text(
                          "Mousepad Fantech\nMP25 Speed",
                          style: TextStyle(
                              fontSize: 9, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                        ),

                        padding: const EdgeInsets.only(
                            bottom: 5, right: 15, left: 15, top: 5),
                      ),
                      Container(
                        child: const Text(
                          "220.000",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        padding: const EdgeInsets.only(right: 15, left: 15),
                      ),
                      Container(
                        child: const Text(
                          "Save 20%",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 9,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(top: 5),
                      ),
                    ],
                  ),
              ],
            ),
            ),
            Container(
              child: const Text("Best Product",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: "Roboto",
              ),
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 14, top: 14),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://dorangadget.com/wp-content/uploads/2021/03/Logitech-G-Pro-Gaming-Mouse-400x400.jpg"),
                            fit: BoxFit.scaleDown,
                          ),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
                        height: 70,
                        width: 70,
                      ),
                      Container(
                        child: const Text(
                          "Mouse Logitech\nG304 Dark Speed",
                          style: TextStyle(
                              fontSize: 9, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(
                            bottom: 5, right: 15, left: 15, top: 5),
                      ),
                      Container(
                        child: const Text(
                          "220.000",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(right: 15, left: 15),
                      ),
                      Container(
                        child: const Text(
                          "Save 20%",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 9,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(top: 5),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//93/MTA-2765253/acer_monitor-acer-kg251q-f--1ms-144hz-_full05.jpg"),
                            fit: BoxFit.scaleDown,
                          ),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
                        height: 70,
                        width: 70,
                      ),
                      Container(
                        child: const Text(
                          "Monitor Acer\nKG251A-F",
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(
                            bottom: 5, right: 15, left: 15, top: 5),
                      ),
                      Container(
                        child: const Text(
                          "4.200.000",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(right: 15, left: 15),
                      ),
                      Container(
                        child: const Text(
                          "Save 5%",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 9,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(top: 5),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://carisinyal.com/wp-content/uploads/2017/09/Logitech-G733_.webp"),
                            fit: BoxFit.scaleDown,
                          ),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
                        height: 70,
                        width: 70,
                      ),
                      Container(
                        child: const Text(
                          "Headset Logitech\nG733 Dark Speed",
                          style: TextStyle(
                              fontSize: 9, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(
                            bottom: 5, right: 15, left: 15, top: 5),
                      ),
                      Container(
                        child: const Text(
                          "1.220.000",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(right: 15, left: 15),
                      ),
                      Container(
                        child: const Text(
                          "Save 15%",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 9,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(top: 5),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://sylargaming.com/image/cache/MSI%20GAMING%20CHAIR/SYLAR_GAMING_MSI_CH120_I_3-800x800.jpg"),
                            fit: BoxFit.scaleDown,
                          ),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
                        height: 70,
                        width: 70,
                      ),
                      Container(
                        child: const Text(
                          "Gaming Chair\nMAG CH120",
                          style: TextStyle(
                              fontSize: 9, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(
                            bottom: 5, right: 15, left: 15, top: 5),
                      ),
                      Container(
                        child: const Text(
                          "1.500.000",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(right: 15, left: 15),
                      ),
                      Container(
                        child: const Text(
                          "Save 10%",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 9,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(top: 5),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://assets.skor.id/crop/0x91:800x731/x/photo/2021/07/13/3981331541.jpg"),
                            fit: BoxFit.scaleDown,
                          ),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
                        height: 70,
                        width: 70,
                      ),
                      Container(
                        child: const Text(
                          "Mousepad Fantech\nMP25 Speed",
                          style: TextStyle(
                              fontSize: 9, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(
                            bottom: 5, right: 15, left: 15, top: 5),
                      ),
                      Container(
                        child: const Text(
                          "220.000",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(right: 15, left: 15),
                      ),
                      Container(
                        child: const Text(
                          "Save 20%",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 9,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.only(top: 5),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
