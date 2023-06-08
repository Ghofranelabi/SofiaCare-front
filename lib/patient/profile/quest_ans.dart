import 'package:flutter/material.dart';
import 'package:sofiacare/tools/colors.dart';

class PquestionAnswer extends StatefulWidget {
  @override
  _PQuestionAnswerState createState() => _PQuestionAnswerState();
}

class _PQuestionAnswerState extends State<PquestionAnswer> {
  List<bool> isExpandedList = [];
  TextEditingController _questionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the isExpandedList with false for each item
    isExpandedList = List.generate(10, (index) => false); // Adjust the size based on your desired number of items
  }

  @override
  void dispose() {
    _questionController.dispose();
    super.dispose();
  }

  void _showQuestionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Ajouter votre question",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color:  Color(0xFF013871),),),
          content: TextField(
            controller: _questionController,
            decoration: InputDecoration(hintText: "Ecrivez ..."),
          ),
          actions: [
            TextButton(
              child: Text("Annuler",
              style: TextStyle(color: Color(0xFF013871) ,),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                "Envoyer", 
                style: TextStyle(color:  Color(0xFF013871),),
              ),
              onPressed: () {
                String question = _questionController.text;
                if (question.isNotEmpty) {
                  setState(() {
                    // Add the new question to the top of the list
                    isExpandedList.insert(0, false);
                  });
                  _questionController.clear();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: isExpandedList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10), // Adjust padding as needed
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    "Ghofrane Labidi",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('1 jour'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                ),
                SizedBox(
                  height: 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Je porte un dotier et j'ai des odeurs dans ma bouche malgré que je brosse mes dents. Qu'est-ce qu'il y a lieu de faire svp?",
                    style: TextStyle(
                      color: bColor.withOpacity(0.7),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpandedList[index] = !isExpandedList[index];
                    });
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Réponse",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 23, 13, 161),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                if (isExpandedList[index]) ...[
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Pour éviter ce genre de problèmes, il faut bien nettoyer la prothèse à chaque repas et faire un bain de bouche.",
                      style: TextStyle(
                        color: bColor.withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
  child: Icon(Icons.add),
  backgroundColor: Color(0xFF013871), // Set the background color here
  onPressed: () {
    _showQuestionDialog(context);
  },
),

    );
  }
}
