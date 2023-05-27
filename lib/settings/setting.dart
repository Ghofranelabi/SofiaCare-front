import 'package:flutter/material.dart';
import 'package:sofiacare/views/patient/home/notification_appoint.dart';
import 'package:sofiacare/views/patient/home/pat_home.dart';
import 'package:sofiacare/views/patient/profile/search_screen.dart';
import 'package:sofiacare/settings/edit_profile.dart';
import 'package:sofiacare/settings/fav_doc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sofiacare/views/sign/sign.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF013871),
        title: Text("Paramétres"),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.person,),
            title: Text("Modifier Profil",
              style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold,
                color: bColor,)),
            onTap: () {
              // Navigate to the edit profile screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfile()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Médecins favoris",
              style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold,
                color: bColor,)),
            onTap: () {
              // Navigate to the notification settings screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoriteDoctors()),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Déconnecter",
              style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold,
                color: bColor,),),
            onTap: () {
              // Show confirmation dialog before logging out
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Déconnexion", 
                    style: TextStyle(
                      color: Colors.red,
                    ),),
                    content: Text(" Voulez-vous  vraiment  vous  déconnecter ?"),
                    actions: [
                      TextButton(
                        child: Text("Annuler",
                        style: TextStyle(
                          color: Color(0xFF013871),
                        ),),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text("Déconnecter", 
                        style: TextStyle(
                          color: Color(0xFF013871),
                        ),),
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
      bottomNavigationBar: GNav(
        selectedIndex: 3,
        tabs: [
          GButton(icon: Icons.home, text: 'Acuieil'),
          GButton(icon: Icons.search, text: 'Recherche'),
          GButton(icon: Icons.calendar_month, text: 'Rendez-vous'),
          GButton(icon: Icons.settings, text: 'Paramétres'),
        ],
        onTabChange: (int index) {
          // Handle tab change event here
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PatHome()),
            );
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
          }
        },
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
      
      bottomNavigationBar: GNav(
  selectedIndex: 3,
  backgroundColor: Color(0xFFD9E4EE), // Set the background color
  tabs: [
    GButton(icon: Icons.home, text: 'Acuieil'),
    GButton(icon: Icons.search, text: 'Recherche'),
    GButton(icon: Icons.calendar_month, text: 'Rendez-vous'),
    GButton(icon: Icons.settings, text: 'Paramétres'),
  ],
  onTabChange: (int index) {
    // Handle tab change event here
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PatHome()),
      );
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
    }
  },
),

    );
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
      home: SearchScreen(),
    );
  }
}
