// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sofiacare/patient/home/notification_appoint.dart';
import 'package:sofiacare/patient/home/posts.dart';
import 'package:sofiacare/patient/home/search_screen.dart';
import 'package:sofiacare/settings/setting.dart';
import 'package:sofiacare/views/patient/home/app_bar.dart';

class PatHome extends StatefulWidget {
  const PatHome({Key? key});

  @override
  _PatHomeState createState() => _PatHomeState();
}

class _PatHomeState extends State<PatHome> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Color(0xFFD9E4EE),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              MyAppBar(),
              Posts(),
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
                icon: Icons.search,
                text: 'Recherche',
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
            selectedIndex: 0,
            onTabChange: (index) {
              if (index == 0) {
              // we are in it already
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationAppoint()),
                );
              } else if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              }
            },
          ),
        ),
      ),


        
      
    );
  }
}
