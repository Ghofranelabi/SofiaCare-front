import 'package:flutter/material.dart';
import 'package:sofiacare/pages/patient/search/page_search_screen.dart';
import 'package:sofiacare/pages/patient/profile/page_doc_profile.dart';

class Speciality extends StatefulWidget {
  @override
  _SpecialityState createState() => _SpecialityState();
}

class _SpecialityState extends State<Speciality> {
  List<bool> isFavoriteList = List.generate(4, (_) => false);

  List<String> doctorNames = [
    "Dr. Lilia Jemai",
    "Dr. Bassem Mkadmi",
    "Dr. Siwar Hajri",
    "Dr. Ichrak Ben Rhouma",
  ];

  List<String> doctorImages = [
    "assets/images/lilia.jpg",
    "assets/images/bassemmk.jpg",
    "assets/images/siwar.jpg",
    "assets/images/ichrak.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchScreen()),
            );
          },
        ),
        title: Text('Liste des spécialistes'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: doctorNames.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F8FF),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          blurRadius: 4,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoctorProfile(),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: Image.asset(
                              doctorImages[index],
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctorNames[index],
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "chirurgien",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey.withOpacity(0.6),
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "4.9",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.withOpacity(0.6),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
