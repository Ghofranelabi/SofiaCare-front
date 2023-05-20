import 'package:flutter/material.dart';
import 'package:sofiacare/patient/screens/colors.dart';

// ignore: must_be_immutable
class QuestionAnswerScreen extends StatelessWidget {
  List imgs = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 157, 206, 246),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.calendar_month,
              ),
            ),
          ],

        ),
      Expanded(
  child: SizedBox(
    height: 500,
    child: ListView.builder(
            scrollDirection: Axis.vertical,
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
                          backgroundImage: AssetImage("assets/images/${imgs[index]}"),
                        ),
                        title: Text(
                          "Dr.Labidi",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text('1 jour'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [ 
                          ],
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
                    "Des odeurs dans la bouche ",
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
                      SizedBox(height: 2,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Je porte un dotier et j'ai des odeurs dans ma bouche malgré que je brosse mes dents qu'est ce qui'il y a lieu de faire svp ?",
                          style: TextStyle(
                            color: bColor.withOpacity(0.7),
                          ),
                        ),
                      ),
                      SizedBox(height: 3,),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Réponse",
                          style: TextStyle(
                        fontSize: 16,
                            color: Color.fromARGB(255, 23, 13, 161),
                          ),
                        ),
                      ),
                      SizedBox(height: 2,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Pour éviter ce genre des problèmes, il faut bien nettoyer la prothèse à chaque repas et faire un bain de bouche",
                          style: TextStyle(
                            color: bColor.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
              );
            },
          ),
        ),
     ), ], 
     ),
    );
  }
}
