import 'package:flutter/material.dart';
import 'package:sofiacare/doctor/dossiers/doss_home.dart';

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DossierHome()),
            );
          },
        ),
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
                    // Action lorsque vous appuyez sur un dossier
                    print('Dossier sélectionné : ${filteredDossiers[index]}');
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



void main() {
  runApp(MaterialApp(
    home: DossierList(),
  ));
}
