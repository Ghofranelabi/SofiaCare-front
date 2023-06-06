import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sofiacare/patient/home/pat_home.dart';
import 'package:sofiacare/patient/home/search_screen.dart';
import 'package:sofiacare/settings/setting.dart';
import 'package:sofiacare/utils/config.dart';

class NotificationAppoint extends StatefulWidget {
  @override
  _NotificationAppointState createState() => _NotificationAppointState();
}

class _NotificationAppointState extends State<NotificationAppoint> {
  List<String> imgs = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
  ];

  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF013871),
        title: const Text('Liste des Rendez-vous'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: imgs.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppointmentCard(
              img: imgs[index],
              onDelete: () {
                setState(() {
                  imgs.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: GNav(

            gap: 8,
            activeColor: Color(0xFF013871),
            iconSize: 25,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[800]!,
            color: Colors.black,
            tabs: [
              GButton(
                icon: Icons.home,
              ),
              GButton(
                icon: Icons.search,
              ),
              GButton(
                icon: Icons.calendar_month,
              ),
              GButton(
                icon: Icons.settings,
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PatHome()),
                );
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationAppoint()),
                );
              } else if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class AppointmentCard extends StatefulWidget {
  final String img;
  final VoidCallback onDelete;

  const AppointmentCard({
    required this.img,
    required this.onDelete,
  }) : super();

  @override
  _AppointmentCardState createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  bool isAccepted = true;
  String _appointmentDate = "Lundi, 11/02/2023";
  String _appointmentTime = "14:00";

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
                    backgroundImage: AssetImage("assets/images/${widget.img}"),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Doctor Name',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Med',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      widget.onDelete(); // Delete the appointment card on button press
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              Config.spaceSmall,
              ScheduleCard(
                appointmentDate: _appointmentDate,
                appointmentTime: _appointmentTime,
                onUpdateDateTime: (newDate, newTime) {
                  setState(() {
                    _appointmentDate = newDate;
                    _appointmentTime = newTime;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String appointmentDate;
  final String appointmentTime;
  final Function(String, String) onUpdateDateTime;

  const ScheduleCard({
    required this.appointmentDate,
    required this.appointmentTime,
    required this.onUpdateDateTime,
  }) : super();

  Future<void> _showEditDialog(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      final newDate = "${_getDayOfWeek(selectedDate.weekday)}, ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";

      final selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (selectedTime != null) {
        final newTime = selectedTime.format(context);
        onUpdateDateTime(newDate, newTime);
      }
    }
  }

  String _getDayOfWeek(int day) {
    switch (day) {
      case 1:
        return "Lundi";
      case 2:
        return "Mardi";
      case 3:
        return "Mercredi";
      case 4:
        return "Jeudi";
      case 5:
        return "Vendredi";
      case 6:
        return "Samedi";
      case 7:
        return "Dimanche";
      default:
        return "";
    }
  }

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
            appointmentDate,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 20),
          Icon(
            Icons.access_alarm,
            color: Colors.white,
            size: 17,
          ),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              appointmentTime,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              _showEditDialog(context); // Show the edit dialog on button press
            },
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
