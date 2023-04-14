import 'package:flutter/material.dart';
import 'package:flutter_doktor_app/araclar/sabitler.dart';

class RandevuCard extends StatelessWidget {
  const RandevuCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Sabitler.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/doctor4.jpg'),
                    radius: 30,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Dr. Mehmet Kaya',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Dermatoloji',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              Sabitler.spaceSmall,
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Pazartesi, 15/04/2023',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.access_alarm,
                      color: Colors.white,
                      size: 17,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                        child: Text(
                      '11:50',
                      style: TextStyle(color: Colors.white),
                    ))
                  ],
                ),
              ),
              Sabitler.spaceSmall,
            ],
          ),
        ),
      ),
    );
  }
}
