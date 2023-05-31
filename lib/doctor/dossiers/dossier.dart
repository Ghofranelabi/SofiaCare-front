import 'package:flutter/material.dart';
import 'package:sofiacare/doctor/dossiers/doss_home.dart';

class MedicalDocument extends StatefulWidget {
  @override
  _MedicalDocumentState createState() => _MedicalDocumentState();
}

class _MedicalDocumentState extends State<MedicalDocument> {
  TextEditingController patientNameController = TextEditingController();
  TextEditingController diagnosisController = TextEditingController();
  TextEditingController medicationController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneController = TextEditingController(text: '+216');
  TextEditingController emailController = TextEditingController();
  TextEditingController CnamController = TextEditingController();
  TextEditingController symptomsController = TextEditingController();

  void _createMedicalRecord() {
    // Logic to create the medical record goes here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => FileHome(), // Navigate to DoctorHome
              ),
            );
          },
        ),
        title: Text('Fiche Perso'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Les informations du patient',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: patientNameController,
                decoration: InputDecoration(
                  labelText: 'Nom *',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: patientNameController,
                decoration: InputDecoration(
                  labelText: 'Prénom*',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: dobController,
                decoration: InputDecoration(
                  labelText: 'Date de naissance',
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Femme'),
                      value: 'femme',
                      groupValue: genderController.text,
                      onChanged: (String? value) {
                        setState(() {
                          genderController.text = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Homme'),
                      value: 'homme',
                      groupValue: genderController.text,
                      onChanged: (String? value) {
                        setState(() {
                          genderController.text = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  labelText: 'Numéro du téléphone',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email@gmail.com',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: CnamController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.numbers),
                  labelText: 'Num CNAM',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Informations supplémentaires',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: diagnosisController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.local_hospital),
                  labelText: 'Diagnostiques',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: medicationController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.medical_services),
                  labelText: 'Médicaments',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: symptomsController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.sentiment_satisfied),
                  labelText: 'Symptômes',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _createMedicalRecord,
                child: Text('Créer une fiche perso'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Color(0xFF013871); // Color when the button is pressed
                      }
                      return Colors.blue; // Default color of the button
                    },
                  ),
                ),
              ),
              SizedBox(width: 10),
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    color: Color(0xFF013871),
                  ),
                  onPressed: () {
                    // Logic to open camera goes here
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
