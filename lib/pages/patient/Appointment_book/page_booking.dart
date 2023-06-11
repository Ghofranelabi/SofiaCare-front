import 'package:flutter/material.dart';
import 'package:sofiacare/pages/patient/Appointment_book/page_validate.dart';
import 'package:table_calendar/table_calendar.dart';

class Booking extends StatefulWidget {
  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();
  CalendarFormat format = CalendarFormat.month;

  List<String> availableHours = [
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '01:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
    '05:00 PM',
  ];

  Set<String> selectedHours = {};

  Set<String> unavailableHours = {
    '09:00 AM',
    '01:00 PM',
    '04:00 PM',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF013871),
        title: Text('Prendre un rendez-vous'),
      ),
      body: content(),
    );
  }

  Widget content() {
    return Column(
      children: [
        Container(
          child: TableCalendar(
            locale: "en_US",
            rowHeight: 43,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => _isSameDay(day, selectedDay),
            focusedDay: selectedDay,
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekVisible: true,
            // Day changed
            onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
              setState(
                () {
                  this.selectedDay = selectedDay;
                  this.focusedDay = focusedDay;
                },
              );
              print(focusedDay);
            },
            // To style the Calendar
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                // Remove the borderRadius property or use a different shape
              ),
              selectedTextStyle: TextStyle(
                color: Colors.white,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.purpleAccent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
        Text(
          'Choisir Les Heures Disponibles:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Wrap(
          spacing: 12.0,
          children: availableHours.map((hour) {
            final isAvailable = !unavailableHours.contains(hour);
            final isSelected = selectedHours.contains(hour);

            return GestureDetector(
              onTap: () {
                setState(() {
                  if (isAvailable) {
                    if (isSelected) {
                      selectedHours.remove(hour);
                    } else {
                      selectedHours.add(hour);
                    }
                  }
                });
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: isAvailable
                      ? isSelected
                          ? Colors.green
                          : Colors.white
                      : Colors.red,
                  border: Border.all(
                    color: isSelected ? Colors.green : Colors.grey,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  hour,
                  style: TextStyle(
                    color: isAvailable ? Colors.black : Colors.white,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Validate(),
              ),
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF013871)),
          ),
          child: Text('Valider le rendez-vous'),
        ),
      ],
    );
  }

  bool _isSameDay(DateTime dayA, DateTime dayB) {
    return dayA.year == dayB.year &&
        dayA.month == dayB.month &&
        dayA.day == dayB.day;
  }
}
