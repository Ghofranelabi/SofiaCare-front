import 'package:flutter/material.dart';
import 'package:sofiacare/tools/colors.dart';

// ignore: must_be_immutable
class DoctorQues extends StatefulWidget {
  List<String> imgs = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
  ];

  @override
  _DoctorQuesState createState() => _DoctorQuesState();
}

class _DoctorQuesState extends State<DoctorQues> {
  List<bool> isExpandedList = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 5),
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
              width: MediaQuery.of(context).size.width / 3,
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage("assets/images/${widget.imgs[index]}"),
                    ),
                    title: Text(
                      "Dr. Labidi",
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
                      alignment: Alignment.center,
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
                  Visibility(
                    visible: isExpandedList[index],
                    child: SizedBox(height: 2),
                  ),
                  Visibility(
                    visible: isExpandedList[index],
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Pour éviter ce genre de problèmes, il faut bien nettoyer la prothèse à chaque repas et faire un bain de bouche.",
                        style: TextStyle(
                          color: bColor.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}