import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sofiacare/pages/doctor/Appointment/page_appointment.dart';
import 'package:sofiacare/pages/doctor/dossiers/page_doss_home.dart';
import 'package:sofiacare/pages/doctor/home/page_doc_home.dart';
import 'package:sofiacare/pages/doctor/settings/page_doc_disponibilities.dart';
import 'package:sofiacare/pages/doctor/settings/page_doc_edit.dart';
import 'package:sofiacare/pages/patient/settings/page_edit_profile.dart';

import '../../sign/sign.dart';

class DoctorSettings extends StatefulWidget {
  @override
  _DoctorSettingsState createState() => _DoctorSettingsState();
}

class _DoctorSettingsState extends State<DoctorSettings> {
  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF013871),
        title: Text("Paramètres"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/lilia.jpg'),
                backgroundColor: Colors.white, // Set a border color
              ),
              SizedBox(height: 8),
              Text(
                "Dr.Lilia Jemai",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.person,
            ),
            title: Text(
              "Modifier Profil",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            onTap: () {
              // Navigate to the edit profile screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DocEditProfile()),
              );
            },
          ),
        
          ListTile(
            leading: Icon(
              Icons.calendar_today,
            ),
            title: Text(
              "Diponibilités",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DoctorDisponibilities()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              "Déconnecter",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            onTap: () {
              // Show confirmation dialog before logging out
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      "Déconnexion",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    content: Text("Voulez-vous vraiment vous déconnecter ?"),
                    actions: [
                      TextButton(
                        child: Text(
                          "Annuler",
                          style: TextStyle(
                            color: Color(0xFF013871),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text(
                          "Déconnecter",
                          style: TextStyle(
                            color: Color(0xFF013871),
                          ),
                        ),
                        onPressed: () {
                          // Perform logout operation
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Sign()),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: GNav(
            gap: 8,
            activeColor: Color(0xFF013871),
            iconSize: 25,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
            selectedIndex: 3,
            onTabChange: (index) {
              if (index == 0) {
                // Navigate to PatHome
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorHome()),
                );
              } else if (index == 1) {
                // Navigate to SearchScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DossierHome()),
                );
              } else if (index == 2) {
                // Navigate to AppointmentList
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppointmentList()),
                );
              } else if (index == 3) {
                // Navigate to DoctorSettings (current screen)
              }
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DoctorSettings(),
    );
  }
}
