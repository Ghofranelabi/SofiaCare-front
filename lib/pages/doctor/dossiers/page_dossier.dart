import 'package:flutter/material.dart';
import 'package:sofiacare/pages/doctor/dossiers/page_doss_home.dart';
import 'package:sofiacare/pages/doctor/dossiers/page_dossier_perso.dart';

class MedicalDocument extends StatefulWidget {
  @override
  _MedicalDocumentState createState() => _MedicalDocumentState();
}

class _MedicalDocumentState extends State<MedicalDocument> {
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  // Rest of the code...

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
                builder: (context) => DossierHome(), // Navigate to DoctorHome
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
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: 'Nom *',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: 'Prénom*',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              // Rest of the code...
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DossierPerso(),
                    ),
                  );
                },
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
            ],
          ),
        ),
      ),
    );
  }
}
