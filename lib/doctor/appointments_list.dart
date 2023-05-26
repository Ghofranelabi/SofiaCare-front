import 'package:flutter/material.dart';
import 'package:sofiacare/doctor/home/doc_home.dart';
import 'package:sofiacare/utils/config.dart';
class AppointmentList extends StatelessWidget {
  final List<Patient> patients = [
    Patient(name: "Ghofrane Labidi", image: "patient1.jpeg"),
    Patient(name: "Lilia Jemai", image: "patient2.jpg"),
    Patient(name: "Mounira ben Hadid", image: "patient3.jpeg"),
    Patient(name: "Mohamed Labidi", image: "patient.jpg"),
    // Add more patients as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF013871),
        title: const Text('Appointment List'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DoctorHome()),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppointmentCard(patient: patients[index]),
          );
        },
      ),
    );
  }
}

class AppointmentCard extends StatefulWidget {
  final Patient patient;

  const AppointmentCard({Key? key, required this.patient}) : super(key: key);

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF013871),
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
                    backgroundImage: AssetImage('assets/images/${widget.patient.image}'),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.patient.name,
                        style: TextStyle(
                          color: Colors.white, // Replace with your desired color
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Patient',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey, // Replace with your desired color
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Config.spaceSmall,
              ScheduleCard(),
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Reporter',
                        style: TextStyle(color: Colors.white), // Replace with your desired color
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Accepter',
                        style: TextStyle(color: Colors.white), // Replace with your desired color
                      ),
                    ),
                  ),
                ],
              ),
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
        children: <Widget>[
          const Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 15,
          ),
          const SizedBox(width: 5),
          Text(
            "Lundi, 11/02/2023",
            style: TextStyle(
              color: Colors.white, // Replace with your desired color
            ),
          ),
          const SizedBox(width: 20),
          Icon(
            Icons.access_alarm,
            color: Colors.white, // Replace with your desired color
            size: 17,
          ),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              "14:00",
              style: TextStyle(
                color: Colors.white, // Replace with your desired color
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Patient {
  final String name;
  final String image;

  Patient({required this.name, required this.image});
}
