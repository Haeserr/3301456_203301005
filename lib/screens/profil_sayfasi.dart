import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../araclar/sabitler.dart';

class ProfilSayfasi extends StatefulWidget {
  const ProfilSayfasi({super.key});

  @override
  State<ProfilSayfasi> createState() => _ProfilSayfasiState();
}

class _ProfilSayfasiState extends State<ProfilSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profiliniz',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Sabitler.primaryColor),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const FaIcon(Icons.arrow_back_ios),
            alignment: Alignment.centerRight,
            iconSize: 16,
          ),
        ),
        actions: [
          Container(
            height: 25,
            width: 40,
            alignment: Alignment.centerLeft,
            child: const Icon(
              Icons.person_outline_outlined,
              color: Colors.black,
              size: 30,
            ),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            const CircleAvatar(
              radius: 65,
              backgroundImage: AssetImage('assets/profile1.jpg'),
              backgroundColor: Colors.white,
            ),
            Sabitler.spaceMedium,
            const Text(
              'Tuğçe Bozkır',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Sabitler.spaceSmall,
            const Text('Profil sahibi hakkında bilgiler'),
          ],
        ),
      ),
    );
  }
}
