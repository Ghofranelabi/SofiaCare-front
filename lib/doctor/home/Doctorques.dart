import 'package:flutter/material.dart';

class QuestionAnswerScreen extends StatefulWidget {
  @override
  _QuestionAnswerScreenState createState() => _QuestionAnswerScreenState();
}

class _QuestionAnswerScreenState extends State<QuestionAnswerScreen> {
  List imgs = [
    "patient.jpg",
    "patient1.jpeg",
    "patient2.jpg",
    "patient3.jpeg",
  ];
  List<bool> isExpandedList = List.generate(4, (_) => false); // Updated count to match the length of imgs list

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFD9E4EE),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(imgs.length, (index) {
            return Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(vertical: 20),
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
                        backgroundImage: AssetImage("assets/images/${imgs[index]}"),
                      ),
                      title: Text(
                        "Labidi",
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
                      height: 20,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Des odeurs dans la bouche ",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF013871),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "Je porte un dotier et j'ai des odeurs dans ma bouche malgré que je brosse mes dents qu'est ce qui'il y a lieu de faire svp ?",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}