import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sofiacare/doctor/appointments_list.dart';
import 'package:sofiacare/doctor/dossier.dart';
import 'package:sofiacare/doctor/home/Doctorques.dart';
import 'package:sofiacare/doctor/home/appointment_card.dart';
import '../../utils/config.dart';

class DoctorHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
  child: FractionalTranslation(
    translation: Offset(0, -0.9), // Adjust the vertical position here
    child: Text(
      "Mes Questions",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),
              Config.spaceSmall,
              Expanded(
                child: ListView(
                  children: <Widget>[
                    QuestionAnswerScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Color(0xFF013871),
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[800]!,
            color: Colors.black,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Accueil',
              ),
              GButton(
                icon: Icons.file_copy,
                text: 'Dossiers',
              ),
              GButton(
                icon: Icons.calendar_month,
                text: 'Rendez-vous',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Paramètres',
              ),
            ],
            selectedIndex: 0 ,
            onTabChange: (index) {
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorHome()),
                );
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MedicalDocument()),
                );
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppointmentList()),
                );
                
              } else if (index == 3) {
                
              }
            },
          ),
        ),
      ),
    );
  }
}
