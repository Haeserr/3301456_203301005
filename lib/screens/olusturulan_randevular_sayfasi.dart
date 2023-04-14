import 'package:flutter/material.dart';

class OlusturulanRandevularSayfasi extends StatefulWidget {
  const OlusturulanRandevularSayfasi({super.key});

  @override
  State<OlusturulanRandevularSayfasi> createState() => _OlusturulanRandevularSayfasiState();
}

class _OlusturulanRandevularSayfasiState extends State<OlusturulanRandevularSayfasi> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Oluşturulan Randevular Sayfası'),
    );
  }
}