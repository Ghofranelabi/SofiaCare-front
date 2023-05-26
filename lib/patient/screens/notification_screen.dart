import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotificationScreen extends StatelessWidget {
  List<String> imgs = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
  ];

  List<String> favoriteDoctors = [
    "Dr. Labidi",
    "Dr. Smith",
    "Dr. Johnson",
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
          SizedBox(height: 16.0),
          Text(
            'Mes médecins préférés:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          ListView.builder(
            shrinkWrap: true,
            itemCount: favoriteDoctors.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.favorite, color: Colors.amber),
                title: Text(favoriteDoctors[index]),
              );
            },
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
