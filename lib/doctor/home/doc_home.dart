import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sofiacare/doctor/appointments_list.dart';
import 'package:sofiacare/doctor/dossiers/doss_home.dart'; 
import 'package:sofiacare/doctor/home/Doctorques.dart';
import 'package:sofiacare/doctor/home/appointment_card.dart';
import 'package:sofiacare/doctor/settings/doc_setting_home.dart';
import 'package:sofiacare/patient/home/new_post.dart';
import '../../utils/config.dart';

class DoctorHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1.2, // Adjust the desired height here
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DoctorSettings()),
                          );
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/doctor1.jpg"),
                        ),
                      ),
                    ),
                  ],
                ),
                Config.spaceSmall,
                NewPost(), // Add the NewPost widget here
                Config.spaceSmall,
                const Text(
                  "Rendez-vous d'aujourd'hui",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
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
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: GNav(

            gap: 8,
            activeColor: Color(0xFF013871),
            iconSize: 25,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[800]!,
            color: Colors.black,
            tabs: [
              GButton(
                icon: Icons.home,
                
              ),
              GButton(
                icon: Icons.file_copy,
                
              ),
              GButton(
                icon: Icons.calendar_month,
                
              ),
              GButton(
                icon: Icons.settings,
                
              ),
            ],
            selectedIndex: 0,
            onTabChange: (index) {
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorHome()),
                );
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DossierHome()),
                );
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppointmentList()),
                );
              } else if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorSettings()),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
