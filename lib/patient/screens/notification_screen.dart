import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  List<String> imgs = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF013871),
        title: Text('Notifications'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          AppointmentResultNotification(
            patientName: 'John Doe',
            result: AppointmentResult.accepted,
            imgUrl: imgs[0],
          ),
          AppointmentResultNotification(
            patientName: 'Jane Smith',
            result: AppointmentResult.refused,
            imgUrl: imgs[1],
          ),
          AppointmentResultNotification(
            patientName: 'Alice Johnson',
            result: AppointmentResult.accepted,
            imgUrl: imgs[2],
          ),
        ],
      ),
    );
  }
}

enum AppointmentResult { accepted, refused }

class AppointmentResultNotification extends StatelessWidget {
  final String patientName;
  final AppointmentResult result;
  final String imgUrl;

  const AppointmentResultNotification({
    required this.patientName,
    required this.result,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    String resultText;
    Color resultColor;

    if (result == AppointmentResult.accepted) {
      resultText = 'Accepté';
      resultColor = Colors.green;
    } else {
      resultText = 'reporté';
      resultColor = Colors.red;
    }

    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage("assets/images/$imgUrl"),
        ),
        title: Text(
          patientName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Résultat: $resultText'),
        trailing: Icon(Icons.check, color: resultColor),
      ),
    );
  }
}
