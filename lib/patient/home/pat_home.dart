import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sofiacare/patient/home/app_bar.dart';
import 'package:sofiacare/patient/home/notification_appoint.dart';
import 'package:sofiacare/patient/home/posts.dart';
import 'package:sofiacare/patient/profile/search_screen.dart';
import 'package:sofiacare/settings/setting.dart';


class PatHome extends StatefulWidget {
  const PatHome({Key? key});

  @override
  _PatHomeState createState() => _PatHomeState();
}

class _PatHomeState extends State<PatHome> {
  // ignore: unused_field
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
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
      bottomNavigationBar: GNav(
  selectedIndex: 0,
  backgroundColor: Color(0xFFD9E4EE), // Set the background color
  tabs: [
    GButton(icon: Icons.home, text: 'Acuieil'),
    GButton(icon: Icons.search, text: 'Recherche'),
    GButton(icon: Icons.calendar_month, text: 'Rendez-vous'),
    GButton(icon: Icons.settings, text: 'Paramétres'),
  ],
  onTabChange: (int index) {
    // Handle tab change event here
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchScreen()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SettingsScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NotificationAppoint()),
      );
    } else if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PatHome()),
      );
    }
  },
),


    );
  }
}
