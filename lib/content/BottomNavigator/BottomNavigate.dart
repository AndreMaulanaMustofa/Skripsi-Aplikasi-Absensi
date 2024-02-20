// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:absen_polinema/content/mapPage.dart';
import 'package:absen_polinema/content/user.dart';

class BottomNavigate extends StatefulWidget {
  const BottomNavigate({super.key});

  @override
  State<BottomNavigate> createState() => _BottomNavigateState();
}

class _BottomNavigateState extends State<BottomNavigate> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts), 
            label: "User",
          ),
        ],
        iconSize: 25,
        selectedIconTheme: const IconThemeData(color: Colors.black, size: 30),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        // selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        showUnselectedLabels: false,
      ),
      body: pageList.elementAt(_selectedIndex),
      ),
    );
  }

void _onItemTapped(int index){
  setState(() {
    _selectedIndex = index;
  });
}

List<Widget> pageList = [
  const mapPage(),
  const UserPage(),
];
}