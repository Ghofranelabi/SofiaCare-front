import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sofiacare/doctor/appointments_list.dart';
import 'package:sofiacare/doctor/dossiers/dossier.dart';
import 'package:sofiacare/doctor/home/doc_home.dart';

import '../../settings/fav_doc.dart';
import '../../tools/colors.dart';


class FileHome extends StatefulWidget {
  @override
  _FileHomeState createState() => _FileHomeState();
}

class _FileHomeState extends State<FileHome> {
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
              // Navigate to the favorite doctors screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoriteDoctors()),
              );
            },
          ),
         
        ],
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
                text: 'Dossiers ',
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
                  MaterialPageRoute(builder: (context) => FileHome()),
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
