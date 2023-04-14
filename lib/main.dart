import 'package:flutter/material.dart';
import 'package:flutter_doktor_app/screens/giris_sayfasi.dart';
import 'package:flutter_doktor_app/screens/karsilama_sayfasi.dart';
import 'package:flutter_doktor_app/screens/profil_sayfasi.dart';
import 'package:flutter_doktor_app/screens/randevu_sayfasi.dart';
import 'araclar/sabitler.dart';
import 'main_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Doktor App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: Sabitler.primaryColor,
          floatingLabelStyle: TextStyle(color: Sabitler.primaryColor),
          prefixIconColor: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const KarsilamaSayfasi(),
        'giris_sayfasi':(context) => const GirisSayfasi(),
        'main': (context) => const MainLayout(),
        //'doktor_detay_sayfasi':(context) => const DoktorDetaySayfasi(),
        'randevu_sayfasi': (context) => const RandevuSayfasi(),
        'profil_sayfasi':(context) => const ProfilSayfasi(),
      },
    );
  }
}
