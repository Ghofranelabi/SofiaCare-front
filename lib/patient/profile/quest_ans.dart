import 'package:flutter/material.dart';
import 'package:sofiacare/tools/colors.dart';

class PquestionAnswer extends StatefulWidget {
  @override
  _PQuestionAnswerState createState() => _PQuestionAnswerState();
}

class _PQuestionAnswerState extends State<PquestionAnswer> {
  List<bool> isExpandedList = [];

  @override
  void initState() {
    super.initState();
    // Initialize the isExpandedList with false for each item
    isExpandedList = List.generate(10, (index) => false); // Adjust the size based on your desired number of items
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10, // Adjust the number of items based on your data
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
                  height: 25,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Des odeurs dans la bouche",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF013871),
                          ),
                        ),
                      ],
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
    );
  }
}
