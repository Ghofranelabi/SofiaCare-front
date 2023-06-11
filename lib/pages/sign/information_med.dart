import 'package:flutter/material.dart';

class InformationMed extends StatefulWidget {
  const InformationMed({super.key});

  @override
  State<InformationMed> createState() => _InformationMedState();
}

class _InformationMedState extends State<InformationMed> {
  TextEditingController _info = TextEditingController();
  List<String> specialiteList = [
    'Généraliste',
    'Dentiste',
    'Gynécologue',
    'Vétérinaire',
    'Sexologue',
    'Dermatologue',
    'ORL',
    'Psychiatre',
    'Cardiologue',
    'Gastro',
    'Pédiatre',
    'Neurologue',
    'Nutritionniste'
  ];
  String? slectedItem = 'Généraliste';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: ListView(
        padding: EdgeInsets.all(32),
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: _info,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Profil',
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        width: 1, color: Color(0xFF013871)))),
          ),
          SizedBox(
            height: 15,
          ),
          DropdownButtonFormField<String>(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 2, color: const Color.fromARGB(255, 18, 88, 146)),
              )),
              value: slectedItem,
              items: specialiteList
                  .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(fontSize: 25),
                      )))
                  .toList(),
              onChanged: (item) => setState(() => slectedItem = item)),
        ],
      )),
    );
  }
}
