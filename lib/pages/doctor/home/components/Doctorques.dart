import 'package:flutter/material.dart';

class QuestionAnswerScreen extends StatefulWidget {
  @override
  _QuestionAnswerScreenState createState() => _QuestionAnswerScreenState();
}

class _QuestionAnswerScreenState extends State<QuestionAnswerScreen> {
  List imgs = [
    "labidi.jpg",
    "labidi.jpg",
    "labidi.jpg",
    "labidi.jpg",
  ];
  List<bool> isExpandedList =
      List.generate(4, (_) => false); // Updated count to match the length of imgs list

  void showReplyDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String reply = '';

        return AlertDialog(
          title: Text('Réponse'),
          content: TextField(
            onChanged: (value) {
              reply = value;
            },
            decoration: InputDecoration(hintText: 'Entrer votre réponse ..'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF013871), // Set the button color
              ),
              child: Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle the reply submission
                print('Reply: $reply');
                Navigator.of(context).pop(); // Close the dialog
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF013871), // Set the button color
              ),
              child: Text('Envoyer'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFD9E4EE),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            imgs.length,
            (index) {
              return Container(
                margin: EdgeInsets.all(20), // Increase the padding
                padding: EdgeInsets.all(20), // Increase the padding
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              AssetImage("assets/images/${imgs[index]}"),
                        ),
                        title: Text(
                          "Ghofrane Labidi",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text('1 jour'),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Je porte un dotier et j'ai des odeurs dans ma bouche malgré que je brosse mes dents qu'est ce qui'il y a lieu de faire svp ?",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 80,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            showReplyDialog(); // Show the reply dialog
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF013871),
                            textStyle: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: Text(
                            'Répondre',
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Display the reply text
                      Text(
                        "Pour éviter ce genre de problèmes, il faut bien nettoyer la prothèse à chaque repas et faire un bain de bouche.",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
