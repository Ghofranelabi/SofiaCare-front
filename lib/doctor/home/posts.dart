import 'package:flutter/material.dart';
import 'package:sofiacare/patient/screens/colors.dart';

class Posts extends StatelessWidget {
  const Posts();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    TextEditingController textController = TextEditingController();

    return Container(
      height: 1000,
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: ListView.builder(
          // Utilisation de ListView.builder
          itemCount: 4, // Nombre de répétitions des publications
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        child: CircleAvatar(
  radius: 30,
  backgroundImage: AssetImage('assets/images/doctor4.jpg'),
),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          "Dr.Labidi",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 150,
                        minWidth: 150,
                        maxHeight: 350.0,
                        maxWidth: MediaQuery.of(context).size.width,
                      ),
                      child: Container(
                        child: Image.asset(
                          "assets/images/conseil.jpg",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2, bottom: 2),
                    child: Transform.scale(
                      scale: 1.3,
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              alignment: Alignment.center,
                              color: wColor,
                              height: 60,
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 30,
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 40,
                                    child: Text("like"),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, left: 10),
                              alignment: Alignment.center,
                              color: wColor,
                              height: 60,
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 30,
                                    child: Icon(
                                      Icons.share,
                                      color: Colors.purpleAccent,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 50,
                                    child: Text("Share"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 20), // Ajout d'un espace entre les publications
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        child: CircleAvatar(
  radius: 30,
  backgroundImage: AssetImage('assets/images/doctor2.jpg'),
),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          "Dr.Jemai",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
  padding: EdgeInsets.only(top: 10, bottom: 10),
  child: Center(
    child: Text(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed gravida erat vel massa hendrerit, sed iaculis nisl hendrerit. Donec feugiat augue nec dolor fermentum, ac volutpat neque faucibus. In blandit, velit sit amet viverra tristique, turpis nisi tempor libero, sit amet pharetra urna risus vel erat. Curabitur ultricies tristique convallis. Morbi viverra eleifend metus a fringilla. Nulla facilisi.",
      style: TextStyle(
        fontSize: 14,
      ),
    ),
  ),
),
                  Padding(
                    padding: EdgeInsets.only(top: 2, bottom: 2),
                    child: Transform.scale(
                      scale: 1.3,
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              alignment: Alignment.center,
                              color: wColor,
                              height: 60,
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 30,
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 40,
                                    child: Text("like"),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, left: 10),
                              alignment: Alignment.center,
                              color: wColor,
                              height: 60,
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 30,
                                    child: Icon(
                                      Icons.share,
                                      color: Colors.purpleAccent,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 50,
                                    child: Text("Share"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          
    );
  }
}
