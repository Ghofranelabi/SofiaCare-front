import 'package:flutter/material.dart';
import 'package:sofiacare/pages/patient/settings/page_setting.dart';

class FavoriteDoctors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          backgroundColor: Color(0xFF013871),
          title: Text("Médecin Favoris"),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: yourFavoriteDoctors.map((doctor) {
            return FavoriteDoctorItem(
              doctor: doctor,
            );
          }).toList(),
        ));
  }
}

class FavoriteDoctorItem extends StatefulWidget {
  final Doctor doctor;

  FavoriteDoctorItem({required this.doctor});

  @override
  _FavoriteDoctorItemState createState() => _FavoriteDoctorItemState();
}

class _FavoriteDoctorItemState extends State<FavoriteDoctorItem> {
  bool isFavorite = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 50,
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF2F8FF),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: sdColor,
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppointmentScreen(),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.all(8),
                  height: 45,
                  width: 45,
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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Center(
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.amber : pColor,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.doctor.name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: pColor,
                  ),
                ),
                Text(
                  widget.doctor.specialty,
                  style: TextStyle(
                    fontSize: 18,
                    color: bColor.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Doctor {
  final String name;
  final String specialty;
  final String imagePath;
  final double rating;

  Doctor({
    required this.name,
    required this.specialty,
    required this.imagePath,
    required this.rating,
  });
}

// Replace the 'yourFavoriteDoctors' list with your actual data
List<Doctor> yourFavoriteDoctors = [
  Doctor(
    name: "Dr. Labidi",
    specialty: "Chirurgien",
    imagePath: "assets/images/doctor1.jpg",
    rating: 4.9,
  ),
  // Add more doctors here
];

// Define your colors
Color sdColor = Color(0xFF000000);
Color pColor = Color(0xFF000000);
Color bColor = Color(0xFF000000);

class AppointmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment"),
      ),
      body: Center(
        child: Text("Appointment screen"),
      ),
    );
  }
}
