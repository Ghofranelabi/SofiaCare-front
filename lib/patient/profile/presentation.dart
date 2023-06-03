// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sofiacare/patient/rendez_vous/booking.dart';
import 'package:sofiacare/tools/colors.dart';
// ignore: unused_import
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/buttons/button_login.dart';


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
            height: 100,
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
              child: Center(
              child: Text(
                "Dr.Labidi",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF013871),
                  decoration: TextDecoration.underline,
                ),
              ),
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
                'assets/images/cnam.png',
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
      onTap: () async {
        final phoneNumber = '+21625489325';
        final url = 'tel:$phoneNumber';
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

SizedBox(height: 100),
            Padding(
                  padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
              child: ButtonLogin(onTap: (){  Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  Booking(),
                          ),
                        );}, text: "Prenez un Rendez-vous"),
            ),


        ],
      ),
    );
  }
}