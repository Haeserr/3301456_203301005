import 'package:flutter/material.dart';
import 'package:flutter_doktor_app/screens/ana_sayfa.dart';
import 'package:flutter_doktor_app/screens/olusturulan_randevular_sayfasi.dart';
import 'package:flutter_doktor_app/screens/profil_sayfasi.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'araclar/sabitler.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentPage = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
        children: const [
          AnaSayfa(),
          OlusturulanRandevularSayfasi(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        backgroundColor: Sabitler.primaryColor,
        onTap: (value) {
          setState(() {
            currentPage = value;
            _pageController.animateToPage(value,
                duration: const Duration(milliseconds: 750),
                curve: Curves.linear);
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.houseChimneyMedical),
              label: 'Ana Sayfa'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidCalendarCheck),
              label: 'Randevular'),
        ],
      ),
    );
  }
}
