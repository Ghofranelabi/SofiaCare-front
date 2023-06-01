import 'package:flutter/material.dart';
import 'package:sofiacare/tools/colors.dart';
// ignore: unused_import
import 'package:sofiacare/utils/config.dart';

class AppointCard extends StatefulWidget {
  const AppointCard({Key? key}) : super(key: key);

  @override
  State<AppointCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color:  Color(0xFF013871),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/patient.jpg'),
                    ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Mohamed Jemai',
                        style: TextStyle(
                          color: wColor,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Patient',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Config.spaceSmall,
              const ScheduleCard(),
              Config.spaceSmall,
              
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          const Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 15,
          ),
          const SizedBox(width: 5),
          Text(
            "Lundi, 11/02/2023",
            style: TextStyle(
              color: wColor,
            ),
          ),
          const SizedBox(width: 20),
          Icon(
            Icons.access_alarm,
            color: wColor,
            size: 17,
          ),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              "14:00",
              style: TextStyle(
                color: wColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
