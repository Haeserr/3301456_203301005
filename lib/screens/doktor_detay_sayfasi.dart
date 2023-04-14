import 'package:flutter/material.dart';
import 'package:flutter_doktor_app/araclar/Sabitler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoktorDetaySayfasi extends StatefulWidget {
  const DoktorDetaySayfasi(
      {super.key,
      required this.imgPath,
      required this.doktorAdi,
      required this.doktorBolum,
      required this.doktorMezun});

  final String imgPath;
  final String doktorAdi;
  final String doktorBolum;
  final String doktorMezun;

  @override
  State<DoktorDetaySayfasi> createState() => _DoktorDetaySayfasiState();
}

class _DoktorDetaySayfasiState extends State<DoktorDetaySayfasi> {
  //bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                DoktorHakkinda(
                    doktorAdi: widget.doktorAdi,
                    imgPath: widget.imgPath,
                    doktorMezun: widget.doktorMezun),
                DetayKismi(
                  doktorAdi: widget.doktorAdi,
                  doktorBolum: widget.doktorBolum,
                  doktorMezun: widget.doktorMezun,
                ),
                //const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Sabitler.primaryColor,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pushNamed('randevu_sayfasi');
                      },
                      child: const Text(
                        'Randevu Al',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DoktorHakkinda extends StatefulWidget {
  const DoktorHakkinda(
      {super.key,
      required this.imgPath,
      required this.doktorAdi,
      required this.doktorMezun});

  final String imgPath;
  final String doktorAdi;
  final String doktorMezun;

  @override
  State<DoktorHakkinda> createState() => _DoktorHakkindaState();
}

class _DoktorHakkindaState extends State<DoktorHakkinda> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    Sabitler().init(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            width: Sabitler.screenWidth,
            height: MediaQuery.of(context).size.height / 2.15,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.imgPath), fit: BoxFit.cover),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Sabitler.primaryColor.withOpacity(0.9),
                    Sabitler.primaryColor.withOpacity(0),
                    Sabitler.primaryColor.withOpacity(0),
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 50,
                              color: Sabitler.primaryColor,
                              spreadRadius: 2,
                            )
                          ],
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const FaIcon(
                              Icons.arrow_back_ios,
                              color: Sabitler.primaryColor,
                              size: 24,
                            ),
                            alignment: Alignment.centerRight,
                            iconSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 50,
                              color: Sabitler.primaryColor,
                              spreadRadius: 2,
                            )
                          ],
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                isFav = !isFav;
                              });
                            },
                            icon: FaIcon(
                              isFav
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_outline,
                              color: Colors.red,
                              size: 24,
                            ),
                            alignment: Alignment.center,
                            iconSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        widget.doktorAdi,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          /* CircleAvatar(
            radius: 65,
            backgroundImage: AssetImage(imgPath),
            backgroundColor: Colors.white,
          ), */
          
          Sabitler.spaceSmall,
          SizedBox(
            width: Sabitler.widthSize * 0.75,
            child: Text(
              widget.doktorMezun,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          Sabitler.spaceSmall,
          SizedBox(
            width: Sabitler.widthSize * 0.75,
            child: const Text(
              'Konya Özel Hastanesi',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class DetayKismi extends StatelessWidget {
  const DetayKismi(
      {super.key,
      required this.doktorAdi,
      required this.doktorBolum,
      required this.doktorMezun});

  final String doktorAdi;
  final String doktorBolum;
  final String doktorMezun;

  @override
  Widget build(BuildContext context) {
    Sabitler().init(context);
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Sabitler.spaceSmall,
          Row(
            children: const [
              DetayCard(label: 'Deneyim', value: '10 yıl'),
              SizedBox(
                width: 15,
              ),
              DetayCard(label: 'Değerlendirme', value: '4.5'),
            ],
          ),
          Sabitler.spaceMedium,
          const Text(
            'Doktor Hakkında',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Sabitler.spaceSmall,
          Text(
            '$doktorAdi, Konya Özel Hastanesi\'nde $doktorBolum uzmanıdır, 2012\'de mezun olmuştur ve eğitimini $doktorMezun\'nde tamamlamıştır.',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
            softWrap: true,
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}

class DetayCard extends StatelessWidget {
  const DetayCard({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Sabitler.primaryColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
