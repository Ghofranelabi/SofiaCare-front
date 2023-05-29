import 'package:flutter/material.dart';
import 'package:sofiacare/doctor/home/Doctorques.dart';

import '../../doctor/appointments_list.dart';
import '../../doctor/home/appointment_card.dart';
import '../../utils/config.dart';

class DoctorHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Added this line
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    "Dr.Labidi",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/doctor1.jpg"),
                    ),
                  ),
                ],
              ),
              Config.spaceSmall,
              const Text(
                "Rendez-vous d'aujourd'hui",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              AppointCard(),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppointmentList()),
                  );
                },
                child: Text(
                  "Voir tout",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                ),
              ),
              Config.spaceSmall,
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Mes Questions",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Config.spaceSmall,
              Expanded(
                child: ListView(
                  children: <Widget>[
                    DoctorQues(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
