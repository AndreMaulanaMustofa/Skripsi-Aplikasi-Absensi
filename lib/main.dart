import 'package:absen_polinema/content/BottomNavigator/BottomNavigate.dart';
import 'package:absen_polinema/content/mapPage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:absen_polinema/content/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenHandler(),
    );
  }
}

class SplashScreenHandler extends StatefulWidget {
  @override
  _SplashScreenHandlerState createState() => _SplashScreenHandlerState();
}

class _SplashScreenHandlerState extends State<SplashScreenHandler> {
  bool _isLoggedIn = false;
  late String _NIM;
  late String _namaLengkap;
  late String _Domisili;
  late String _kelas;
  late String _nomorTelp;
  late String _semester;
  late String _jenisKelamin;
  

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      setState(() {
        _isLoggedIn = true;
        _NIM = prefs.getString('NIM') ?? '';
        _namaLengkap = prefs.getString('namaLengkap') ?? '';
        _Domisili = prefs.getString('Domisili') ?? '';
        _kelas = prefs.getString('kelas') ?? '';
        _nomorTelp = prefs.getString('nomorTelp') ?? '';
        _semester = prefs.getString('semester') ?? '';
        _jenisKelamin = prefs.getString('jenisKelamin') ?? '';
      });
    } else {
      setState(() {
        _isLoggedIn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 1500,
      splash: Image.asset('img/polinema_logo.png'),
      nextScreen: _isLoggedIn ? BottomNavigate(
        NIM: _NIM,
        namaLengkap: _namaLengkap,
        Domisili: _Domisili,
        kelas: _kelas,
        nomorTelp: _nomorTelp,
        semester: _semester,
        jenisKelamin: _jenisKelamin,
      ) : const loginPage(),
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.leftToRight,
      backgroundColor: const Color.fromARGB(255, 14, 26, 197),
    );
  }
}
