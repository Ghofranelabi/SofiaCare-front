// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sofiacare/patient/screens/colors.dart';
// ignore: unused_import
import 'package:sofiacare/patient/screens/rendez_vous/date_time_picker.dart';
import 'package:url_launcher/url_launcher.dart';


class Presentation extends StatefulWidget {
  const Presentation({super.key});

 @override
  _PresentationState createState() => _PresentationState();
}

class _PresentationState extends State<Presentation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 25,
            child: Padding(
          padding: EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text(
                    "Diplomes et formations",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF013871),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
            child: 
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Medecin dentiste ",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: bColor.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Assurance maladie ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF013871),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 80,
            width: double.infinity,
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/cnam.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 25,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Adresse ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF013871),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rue 1 er Mai (à cote du Tunisie Télécom) Premier étage ",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: bColor.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Téléphone ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF013871),
                    ),
                  ),
                ],
              ),
            ),
          ),
           SizedBox(
  height: 30,
  child: Padding(
    padding: EdgeInsets.only(left: 10),
    // ignore: duplicate_ignore
    child: GestureDetector(
      // ignore: duplicate_ignore, duplicate_ignore, duplicate_ignore
      onTap: () async {
        final phoneNumber = '+21625489325';
        final url = 'tel:$phoneNumber';
        // ignore: deprecated_member_use
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "+21625489325",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    ),
  ),
),
Spacer(),

SizedBox(height: 30),
Material(
  color: pColor,
  borderRadius: BorderRadius.circular(10),
  child: ElevatedButton(
    onPressed: () {
      // Button onPressed logic
    },
    style: ElevatedButton.styleFrom(
      foregroundColor: wColor,
      backgroundColor: pColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      minimumSize: Size(20, 10), // Adjust the width and height values to make the button smaller
    ),
    child: Text(
      "Prenez Rendez-Vous",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),

        ],
      ),
    );
  }
}