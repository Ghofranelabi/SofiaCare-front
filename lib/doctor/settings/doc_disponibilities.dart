import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DoctorDisponibilities extends StatefulWidget {
  @override
  _DoctorDisponibilitiesState createState() =>
      _DoctorDisponibilitiesState();
}

class _DoctorDisponibilitiesState extends State<DoctorDisponibilities> {
  DateTime _selectedDate = DateTime.now();
  List<DateTime> _selectedHours = [];

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _toggleHour(DateTime hour) {
    setState(() {
      if (_selectedHours.contains(hour)) {
        _selectedHours.remove(hour);
      } else {
        _selectedHours.add(hour);
      }
    });
  }

  Widget _buildHourButton(DateTime hour) {
    return ElevatedButton(
      onPressed: () {
        _toggleHour(hour);
      },
      style: ElevatedButton.styleFrom(
        primary: _selectedHours.contains(hour) ? Colors.green : Colors.grey,
      ),
      child: Text(
        DateFormat('HH:mm').format(hour),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fixer les disponibilités'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sélectionnez le jour :',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text(
                DateFormat('dd/MM/yyyy').format(_selectedDate),
              ),
            ),
            SizedBox(height: 32.0),
            Text(
              'Sélectionnez les heures :',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                for (int i = 8; i < 18; i++)
                  for (int j = 0; j < 2; j++)
                    _buildHourButton(
                      DateTime(
                        _selectedDate.year,
                        _selectedDate.month,
                        _selectedDate.day,
                        i,
                        j * 30,
                      ),
                    ),
              ],
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Valider les disponibilités
              },
              child: Text('Valider les disponibilités'),
            ),
          ],
        ),
      ),
    );
  }
}
