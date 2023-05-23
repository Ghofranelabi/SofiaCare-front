// ignore: unused_import
import 'package:sofiacare/patient/profile/appoint_screen.dart';
// ignore: unused_import
import 'package:sofiacare/patient/rendez_vous/booking.dart';
// ignore: unused_import
import 'package:sofiacare/patient/screens/notification_screen.dart';
// ignore: unused_import
import 'package:sofiacare/welcome_animation/components/welcome_view.dart';
// ignore: unused_import
import 'package:sofiacare/welcome_animation/introduction_animation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: unused_import
import 'package:sofiacare/welcome_animation/sign/reset_pas/home_screen.dart';
// ignore: unused_import
//import 'package:sofiacare/welcome_animation/sign/information_med.dart';
// ignore: unused_import
import 'package:sofiacare/welcome_animation/sign/sign.dart';

//import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  static var navigatorKey;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
         home:NotificationScreen());
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
