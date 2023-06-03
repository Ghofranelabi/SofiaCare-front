import 'package:flutter/material.dart';
import 'package:sofiacare/doctor/settings/doc_setting_home.dart';

class DocChangePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DoctorSettings()),
          );
        },
      ),
        title: Text('Modifier le mot de passe'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Mot de passe actuel',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nouveau mot de passe',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Confirmer le nouveau mot de passe',
              ),
              obscureText: true,
            ),
           SizedBox(height: 24.0),
ElevatedButton(
  onPressed: () {
    // TODO: Implement password change logic
  },
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF013871)),
  ),
  child: Text('Changer le mot de passe '),
),

          ],
        ),
      ),
    );
  }
}
