import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sofiacare/doctor/dossiers/doss_home.dart';

class DossierPerso extends StatefulWidget {
  @override
  _DossierPersoState createState() => _DossierPersoState();
}

class _DossierPersoState extends State<DossierPerso> {
  TextEditingController patientNameController = TextEditingController();
  TextEditingController diagnosisController = TextEditingController();
  TextEditingController medicationController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneController = TextEditingController(text: '+216');
  TextEditingController emailController = TextEditingController();
  TextEditingController CnamController = TextEditingController();
  TextEditingController symptomsController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  List<String> notes = [];
  List<String> medications = [];

 void _createMedicalRecord() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Merci !'),
          content: Text('Vous pouvez le consulter dans les liste des dossiers.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  Widget buildCameraBox() {
    return GestureDetector(
      onTap: () async {
        final ImagePicker _picker = ImagePicker();
        final XFile? image = await _picker.pickImage(source: ImageSource.camera);

        if (image != null) {
          print('Image path: ${image.path}');
        }
      },
      child: Container(
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[200],
        ),
        child: Icon(
          Icons.camera_alt,
          color: Color(0xFF013871),
          size: 30,
        ),
      ),
    );
  }

  Widget buildNoteBox(String note, int index) {
    return Dismissible(
      key: Key(note),
      onDismissed: (_) {
        setState(() {
          notes.removeAt(index);
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                note,
                style: TextStyle(fontSize: 16),
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  notes.removeAt(index);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMedicationBox(String medication, int index) {
    return Dismissible(
      key: Key(medication),
      onDismissed: (_) {
        setState(() {
          medications.removeAt(index);
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                medication,
                style: TextStyle(fontSize: 16),
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  medications.removeAt(index);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void addNote() {
    setState(() {
      String note = noteController.text;
      if (note.isNotEmpty) {
        DateTime now = DateTime.now();
        String formattedDate = '${now.day}/${now.month}/${now.year}';
        notes.add('$formattedDate: $note');
        noteController.clear();
      }
    });
  }

  void addMedication(String medication) {
    setState(() {
      medications.add(medication);
      medicationController.text = medications.join(', ');
    });
  }

  void _showMedicationPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ajouter un médicament'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: medicationController,
                  decoration: InputDecoration(
                    labelText: 'Médicament',
                  ),
                ),
                TextField(
                  controller: dobController,
                  decoration: InputDecoration(
                    labelText: 'Date de début',
                  ),
                ),
                TextField(
                  controller: genderController,
                  decoration: InputDecoration(
                    labelText: 'Période d\'utilisation',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                'Annuler',
                style: TextStyle(color: Color(0xFF013871)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Ajouter',
                style: TextStyle(color: Color(0xFF013871)),
              ),
              onPressed: () {
                String medication = medicationController.text;
                addMedication(medication);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildCameraBoxSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ajoutez vos ordonnances et fiches',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF013871),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildCameraBox(),
            buildCameraBox(),
            buildCameraBox(),
            buildCameraBox(),
          ],
        ),
      ],
    );
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
                builder: (context) => DossierHome(),
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
                  color: Color(0xFF013871),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Nom: Ghofrane',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Prénom: Labidi',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Date de naissance: 22/06/2000',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Genre: ${genderController.text}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Numéro de téléphone: ${phoneController.text}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Email: ${emailController.text}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Numéro Cnam: ${CnamController.text}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              buildCameraBoxSection(),
              SizedBox(height: 20),
              Text(
                'Notes et médicaments',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF013871),
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: notes.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildNoteBox(notes[index], index);
                },
              ),
              SizedBox(height: 10),
              TextField(
                controller: noteController,
                decoration: InputDecoration(
                  labelText: 'Ajouter une note',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: addNote,
                  ),
                ),
              ),
               SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: medications.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildMedicationBox(medications[index], index);
                },
              ),
              SizedBox(height: 10),
ElevatedButton(
  child: Text('Ajouter un médicament'),
  onPressed: _showMedicationPopup,
  style: ElevatedButton.styleFrom(
    primary: Color(0xFF013871),
  ),
),

             
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Créer le dossier médical'),
                onPressed: _createMedicalRecord,
  style: ElevatedButton.styleFrom(
    primary: Color(0xFF013871),
  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
