import 'package:flutter/material.dart';
import 'package:sofiacare/doctor/settings/doc_disponibilities.dart';

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
      home: DoctorDisponibilities(),
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
