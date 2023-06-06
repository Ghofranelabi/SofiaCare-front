import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sofiacare/doctor/appointments_list.dart';
import 'package:sofiacare/doctor/dossiers/dossier.dart';
import 'package:sofiacare/doctor/dossiers/dossier_list.dart';
import 'package:sofiacare/doctor/home/doc_home.dart';
import 'package:sofiacare/doctor/settings/doc_setting_home.dart';




class DossierHome extends StatefulWidget {
  @override
  _DossierHomeState createState() => _DossierHomeState();
}

class _DossierHomeState extends State<DossierHome> {
  // ignore: unused_field
  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF013871),
        title: Text("Dossiers Médicaux"),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.person,
            ),
            title: Text(
              "Créer une fiche",
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
                MaterialPageRoute(builder: (context) => MedicalDocument()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.file_copy),
            title: Text(
              "Liste des dossiers",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DossierList()),
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
            selectedIndex: 1 ,
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
    );
  }
}
