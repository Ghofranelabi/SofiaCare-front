// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sofiacare/patient/home/speciality.dart';

import 'package:sofiacare/settings/setting.dart';

import '../../../tools/colors.dart';
import '../../doctor/doctors_section.dart';
import '../home/notification_appoint.dart';
import '../home/pat_home.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String nomUtilisateur = "John Doe";
  List<String> catNames = [
    "Dentiste",
    "Cardiologue",
    "Gynécologue",
    "Opticien",
    "ORL",
    "Psychiatre",
    "Dermathologue",
    "Sexologue",
    "Généraliste",
    "Gastro",
    "Pédiatre",
    "Rhumatologue",
    "Nutritionniste",
    "Diabétologue",
  ];
  late String selectedCity;
  List<String> tunisiaCities = [
    'Tunis',
    'Sfax',
    'Sousse',
    'Bizerte',
    'Gabes',
    'Nabeul',
    'Tataouine',
    'Kairouan',
    'Tozeur',
    'Gafsa',
    'Monastir',
    'Mahdia',
    'Kasserine',
    'Jendouba',
    'Kef',
    'Kebili',
    'Medenine',
    'Siliana',
    'Manouba',
    'Zaghouan',
  ];
  List<Icon> catIcons = [
    Icon(MdiIcons.toothOutline, color: pColor, size: 30),
    Icon(MdiIcons.heartPlus, color: pColor, size: 30),
    Icon(MdiIcons.humanFemale, color: pColor, size: 30),
    Icon(MdiIcons.glasses, color: pColor, size: 30),
    Icon(MdiIcons.earHearing, color: pColor, size: 30),
    Icon(MdiIcons.brain, color: pColor, size: 30),
    Icon(MdiIcons.nail, color: pColor, size: 30),
    Icon(MdiIcons.human, color: pColor, size: 30),
    Icon(MdiIcons.stethoscope, color: pColor, size: 30),
    Icon(MdiIcons.stomach, color: pColor, size: 30),
    Icon(MdiIcons.baby, color: pColor, size: 30),
    Icon(MdiIcons.brain, color: pColor, size: 30),
    Icon(MdiIcons.nutrition, color: pColor, size: 30),
    Icon(MdiIcons.diabetes, color: pColor, size: 30),
  ];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedCity = tunisiaCities[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9E4EE),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    pColor.withOpacity(0.9),
                    pColor.withOpacity(0.2),
                  ],
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  ListTile(
                    leading: IconButton(
                      icon: Icon(Icons.settings),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                SettingsScreen(),
                          ),
                        );
                      },
                    ),
                    title: Text(
                      "Salut $nomUtilisateur",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "Que recherchez-vous aujourd'hui?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.notifications),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                NotificationAppoint(),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.search,
                          color: pColor,
                        ),
                        title: TextField(
                          decoration: InputDecoration(
                            hintText: "Chercher un médecin, une clinique...",
                            border: InputBorder.none,
                          ),
                        ),
                        trailing: PopupMenuButton<String>(
                          icon: Icon(
                            Icons.filter_list,
                            color: pColor,
                          ),
                          itemBuilder: (BuildContext context) {
                            return tunisiaCities.map((String city) {
                              return PopupMenuItem<String>(
                                value: city,
                                child: Text(city),
                              );
                            }).toList();
                          },
                          onSelected: (String selectedCity) {
                            // Handle the selected city
                            print('Selected city: $selectedCity');
                            // Add your logic to handle the selected city
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: GridView.builder(
                itemCount: catNames.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: InkWell(
                       onTap: () {
                       Navigator.push(
                          context,
                      MaterialPageRoute(
                         builder: (BuildContext context) => Speciality(),
                         ),
                        );
                      },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            catIcons[index],
                            SizedBox(height: 10),
                            Text(
                              catNames[index],
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "les médecins les plus recommandés",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: bColor.withOpacity(0.7),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: DoctorSection(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFFD9E4EE),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child:  GNav(
            hoverColor: Colors.grey[100]!,
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
                icon: Icons.search,
              ),
              GButton(
                icon: Icons.calendar_month,
              ),
              GButton(
                icon: Icons.settings,
              ),
            ],
            selectedIndex: 1,
            onTabChange: (index) {
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
      ),
    );
  }
}
