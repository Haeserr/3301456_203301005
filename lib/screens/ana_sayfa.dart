import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../araclar/doktor_card.dart';
import '../araclar/randevu_card.dart';
import '../araclar/sabitler.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  List<Map<String, dynamic>> iconKategori = [
    {
      "icon": FontAwesomeIcons.heartPulse,
      "kategori": "Kardiyoloji",
    },
    {
      "icon": FontAwesomeIcons.lungs,
      "kategori": "Göğüs Hastalıkları",
    },
    {
      "icon": FontAwesomeIcons.tooth,
      "kategori": "Genel Diş",
    },
    {
      "icon": FontAwesomeIcons.hand,
      "kategori": "Dermataloji",
    },
    {
      "icon": FontAwesomeIcons.eye,
      "kategori": "Göz Hastalıkları",
    },
    {
      "icon": FontAwesomeIcons.personPregnant,
      "kategori": "Kadın Hastalıkları ve Doğum",
    },
    {
      "icon": FontAwesomeIcons.brain,
      "kategori": "Beyin ve Sinir Cerrahisi",
    },
  ];

  @override
  Widget build(BuildContext context) {
    Sabitler().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Hoşgeldin, Tuğçe',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('profil_sayfasi');
                      },
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/profile1.jpg'),
                      ),
                    ),
                  )
                ],
              ),
              Sabitler.spaceMedium,
              const Text(
                'Kategori',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Sabitler.spaceSmall,
              SizedBox(
                height: Sabitler.heightSize * 0.07,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List<Widget>.generate(
                    iconKategori.length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          /* Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return DoktorListeSayfasi(
                                  appTitle: iconKategori[index]['kategori']);
                            },
                          )); */
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Card(
                          margin: const EdgeInsets.only(right: 20),
                          color: Sabitler.primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FaIcon(
                                  iconKategori[index]['icon'],
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  iconKategori[index]['kategori'],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Sabitler.spaceSmall,
              const Text(
                'Yaklaşan Randevunuz',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Sabitler.spaceSmall,
              const RandevuCard(),
              Sabitler.spaceSmall,
              const Text(
                'Popüler Doktorlarımız',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Sabitler.spaceSmall,
              Column(
                children: const [
                  DoktorCard(
                      route: 'doc_details',
                      doktorAdi: 'Dr. Zeynep Dereli',
                      doktorBolum: 'Genel Diş',
                      doktorMezun: 'Selçuk Üniversitesi - Diş Hekimliği Fakültesi',
                      imgPath: 'assets/doctor1.jpg'),
                  DoktorCard(
                      route: 'doc_details',
                      doktorAdi: 'Dr. Tuğba Çiçek',
                      doktorBolum: 'Göğüs Hastalıkları',
                      doktorMezun: 'İstanbul Üniversitesi - Cerrahpaşa Tıp Fakültesi',
                      imgPath: 'assets/doctor2.jpg'),
                  DoktorCard(
                      route: 'doc_details',
                      doktorAdi: 'Dr. Sait Karaca',
                      doktorBolum: 'Kardiyoloji',
                      doktorMezun: 'Ankara Üniversitesi - Tıp Fakültesi',
                      imgPath: 'assets/doctor3.jpg'),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
