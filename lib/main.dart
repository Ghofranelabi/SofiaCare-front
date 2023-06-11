import 'package:flutter/material.dart';
import 'package:sofiacare/pages/components/doctors_section.dart';
import 'package:sofiacare/pages/doctor/Appointment/page_appointment.dart';
import 'package:sofiacare/pages/doctor/dossiers/page_doss_home.dart';
import 'package:sofiacare/pages/doctor/dossiers/page_dossier_perso.dart';
import 'package:sofiacare/pages/doctor/home/page_doc_home.dart';
import 'package:sofiacare/pages/doctor/settings/page_doc_disponibilities.dart';
import 'package:sofiacare/pages/patient/Notifications/page_notification_appoint.dart';
import 'package:sofiacare/pages/patient/home/page_pat_home.dart';
import 'package:sofiacare/pages/patient/search/page_search_screen.dart';
import 'package:sofiacare/pages/patient/profile/page_doc_profile.dart';
import 'package:sofiacare/pages/patient/Appointment_book/page_booking.dart';
import 'package:sofiacare/pages/patient/settings/page_setting.dart';
import 'package:sofiacare/pages/welcome_animation/introduction_animation_screen.dart';
import 'package:sofiacare/pages/sign/email_verif.dart';
import 'package:sofiacare/pages/sign/register.dart';

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
        scaffoldBackgroundColor: Color(0xFFD9E4EE),
        appBarTheme: AppBarTheme(
          color: Color(0xFF013871), // Set the app bar color
        ),
      ),
      debugShowCheckedModeBanner: false,
      home:SearchScreen(),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
