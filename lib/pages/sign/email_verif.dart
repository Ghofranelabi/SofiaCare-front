import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  @override
  _EmailVerificationScreenState createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  List<TextEditingController> _codeControllers = List.generate(
    8,
    (index) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var controller in _codeControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vérification du Code d\'Email'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Veuillez entrer le code que vous avez reçu par email :',
              style: TextStyle(
                color: Color(0xFF013871),
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                _codeControllers.length,
                (index) => SizedBox(
                  width: 36.0,
                  child: TextFormField(
                    controller: _codeControllers[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 24.0),
                    maxLength: 1,
                    onChanged: (value) {
                      if (value.isNotEmpty && index < _codeControllers.length - 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Validate the code and perform verification
                String code = '';
                for (var controller in _codeControllers) {
                  code += controller.text;
                }
                if (code == '12345678') {
                  // Code is correct, proceed to the next step
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NextScreen()),
                  );
                } else {
                  // Code is incorrect, display an error message
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Code Incorrect'),
                      content: Text('Le code entré est incorrect. Veuillez réessayer.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF013871),
              ),
              child: Text('Vérifier le Code'),
            ),
          ],
        ),
      ),
    );
  }
}


class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: 48.0,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Félicitations ! Code d\'email vérifié avec succès.',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {},
              child: Text(
                'Skip',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
