import 'package:flutter/material.dart';

import '../../widgets/buttons/app_bar.dart';
import '../screens/widgets/buttons/button_login.dart';
import 'date_time_picker.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: SizedBox(
    height: 500, // Adjust the height as per your requirement
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start, // Adjust the alignment as needed
      children: <Widget>[
        AppBarTop(textTop: "Calender"),
        const SizedBox(height: 10), // Add a SizedBox for spacing
        const Text(
          'Choisir une date de Rendez-vous',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: ButtonLogin(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DateTimePicker(),
                    ),
                  );
                },
                text: "Prenez un Rendez-vous",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
