import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sofiacare/patient/home/notification_appoint.dart';
import 'package:sofiacare/patient/home/pat_home.dart';
import 'package:sofiacare/patient/profile/edit_profile.dart';
import 'package:sofiacare/patient/screens/doctors_section.dart';
import 'package:sofiacare/welcome_animation/sign/reset_pas/home_screen.dart';
import '../screens/colors.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  List<String> cities = [
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

  @override
  void initState() {
    super.initState();
    selectedCity = cities[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9E4EE),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    pColor.withOpacity(0.8),
                    pColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage("assets/images/doctor1.jpg"),
                            ),
                            Icon(
                              Icons.notifications_outlined,
                              color: wColor,
                              size: 30,
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Cher $nomUtilisateur",
                          style: TextStyle(
                            color: wColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Votre santé est notre préoccupation !",
                          style: TextStyle(
                            color: wColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 15,
                            bottom: 20,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: wColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                spreadRadius: 3,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Rechercher ici",
                                    hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              DropdownButton<String>(
                                value: selectedCity,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedCity = newValue!;
                                  });
                                },
                                items: cities.map((String city) {
                                  return DropdownMenuItem<String>(
                                    value: city,
                                    child: Text(city),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: bColor.withOpacity(0.7),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 100,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: catNames.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 15,
                              ),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F8FF),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: sdColor,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: catIcons[index],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              catNames[index],
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: bColor.withOpacity(0.7),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      "les médecins les plus recommendés",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: bColor.withOpacity(0.7),
                      ),
                    ),
                  ),
                  DocTorsSection(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GNav(
  selectedIndex: 0,
  tabs: [
    GButton(icon: Icons.search, text: 'Recherche'),
    GButton(icon: Icons.home, text: 'Acuieil'),
    GButton(icon: Icons.calendar_month, text: 'Rendez-vous'),
    GButton(icon: Icons.person, text: 'Profil'),
  ],
  onTabChange: (int index) {
    // Handle tab change event here
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PatHome()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EditProfile()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NotificationAppoint()),
      );
    } else if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchScreen()),
      );
    }
  },
),
    );
  }
}
