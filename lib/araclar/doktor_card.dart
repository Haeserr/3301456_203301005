import 'package:flutter/material.dart';
import 'package:flutter_doktor_app/araclar/sabitler.dart';
import 'package:flutter_doktor_app/screens/doktor_detay_sayfasi.dart';

class DoktorCard extends StatelessWidget {
  const DoktorCard(
      {super.key,
      required this.route,
      required this.imgPath,
      required this.doktorAdi,
      required this.doktorBolum,
      required this.doktorMezun});

  final String route;
  final String imgPath;
  final String doktorAdi;
  final String doktorBolum;
  final String doktorMezun;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 150,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: Sabitler.widthSize * 0.33,
                child: Image.asset(
                  imgPath,
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doktorAdi,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      doktorBolum,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.star_border,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Text(
                          '4.5',
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Text(
                          'Yorumlar',
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Text(
                          '(20)',
                        ),
                        Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DoktorDetaySayfasi(
              doktorAdi: doktorAdi,
              imgPath: imgPath,
              doktorBolum: doktorBolum,
              doktorMezun: doktorMezun,
            ),
          ));
        },
      ),
    );
  }
}
