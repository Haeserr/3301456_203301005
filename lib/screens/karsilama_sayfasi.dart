import 'package:flutter/material.dart';
import '../araclar/sabitler.dart';

class KarsilamaSayfasi extends StatelessWidget {
  const KarsilamaSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    Sabitler().init(context);
    return SafeArea(
      child: Material(
        child: Container(
          width: Sabitler.screenWidth,
          height: Sabitler.screenHeight,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Sabitler.primaryColor.withOpacity(0.5), Sabitler.primaryColor]),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Image.asset('assets/doctors.png',height: 200,scale: 2),
              ),
              const Spacer(),
              Sabitler.spaceMedium,
              
              const Text(
                'DOKTOR\'UM',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  wordSpacing: 2,
                ),
              ),
              const SizedBox(height: 10,),
              const Text(
                'Kendi Doktorunu Seç',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  
                ),
              ),
              Sabitler.spaceMedium,
              Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).popAndPushNamed('giris_sayfasi');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    child: const Text(
                      'Hadi Başlayalım',
                      style: TextStyle(
                        color: Sabitler.primaryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
    
                      ),
                    ),
                  ),
                ),
              ),
              Sabitler.spaceMedium,
              const Spacer(),
              Image.asset('assets/lined heart.png',
              color: Colors.white,
              scale: 2,
              //width: 300,
              height: 120,
              )
            ],
          ),
        ),
      ),
    );
  }
}