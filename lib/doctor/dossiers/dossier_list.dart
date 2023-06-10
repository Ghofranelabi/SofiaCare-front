import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DossierList extends StatefulWidget {
  @override
  _DossierListState createState() => _DossierListState();
}

class _DossierListState extends State<DossierList> {
  List<String> dossiers = [
    'Ghofrane labidi',
    'Aziz rahali',
    'Siwar hajri',
    'Lilia Jemai',
    'Nour ferchichi',
    'Wafa zoghlemi',
    'Hejer Labidi',
    'Mounira ben hadid',
    'Tayeb labidi',
    'Hamdi Labidi',
  ];

  List<DateTime> dossierUpdateDates = [
    DateTime(2022, 5, 1),
    DateTime(2022, 6, 15),
    DateTime(2022, 7, 22),
    DateTime(2022, 8, 10),
    DateTime(2022, 9, 5),
    DateTime(2022, 10, 12),
    DateTime(2022, 11, 20),
    DateTime(2022, 12, 8),
    DateTime(2023, 1, 17),
    DateTime(2023, 2, 4),
  ];

  List<String> filteredDossiers = [];

  @override
  void initState() {
    super.initState();
    filteredDossiers.addAll(dossiers);
  }

  void filterDossiers(String query) {
    filteredDossiers.clear();
    if (query.isNotEmpty) {
      setState(() {
        filteredDossiers = dossiers
            .where((dossier) =>
                dossier.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        filteredDossiers.addAll(dossiers);
      });
    }
  }

  String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des dossiers médicaux'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => filterDossiers(value),
              decoration: InputDecoration(
                labelText: 'Rechercher',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredDossiers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.file_copy),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(filteredDossiers[index]),
                      SizedBox(height: 4),
                      Text(
                        'Dernière mise à jour: ${formatDate(dossierUpdateDates[index])}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DossierPersoScreen(
                          selectedDossier: filteredDossiers[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DossierPersoScreen extends StatefulWidget {
  final String selectedDossier;

  DossierPersoScreen({required this.selectedDossier});

  @override
  _DossierPersoScreenState createState() => _DossierPersoScreenState();
}

class _DossierPersoScreenState extends State<DossierPersoScreen> {
  TextEditingController patientNameController = TextEditingController();
  TextEditingController diagnosisController = TextEditingController();
  TextEditingController medicationController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneController = TextEditingController(text: '+216');
  TextEditingController emailController = TextEditingController();
  TextEditingController CnamController = TextEditingController();
  TextEditingController symptomsController = TextEditingController();

  List<TextEditingController> noteControllers = [];

  void _createMedicalRecord() {
    // Logic to create the medical record goes here
  }

  Widget buildCameraBox() {
    return GestureDetector(
      onTap: () async {
        final ImagePicker _picker = ImagePicker();
        final XFile? image =
            await _picker.pickImage(source: ImageSource.camera);

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

  Widget buildNoteBox(TextEditingController noteController) {
    return Container(
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
      child: TextField(
        controller: noteController,
        decoration: InputDecoration(
          hintText: 'Note',
          border: InputBorder.none,
        ),
      ),
    );
  }

  void addNoteBox() {
    setState(() {
      noteControllers.add(TextEditingController());
    });
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
                builder: (context) => DossierList(), // Navigate back to DossierList
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
                'Nom: ${patientNameController.text}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Prénom: ${patientNameController.text}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Date de naissance: ${dobController.text}',
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
                'Num CNAM: ${CnamController.text}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Informations supplémentaires',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF013871),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Diagnostiques: ${diagnosisController.text}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Médicaments: ${medicationController.text}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Symptômes: ${symptomsController.text}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              buildCameraBoxSection(),
              SizedBox(height: 20),
              Text(
                'Notes',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF013871),
                ),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  for (int i = 0; i < noteControllers.length; i++)
                    buildNoteBox(noteControllers[i]),
                  GestureDetector(
                    onTap: addNoteBox,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Color(0xFF013871),
                            size: 24,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Add Note',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF013871),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _createMedicalRecord,
                child: Text('Créer une fiche perso'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blue;
                      }
                      return Color(0xFF013871);
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


void main() {
  runApp(MaterialApp(
    home: DossierList(),
  ));
}
