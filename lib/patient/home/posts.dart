import 'package:flutter/material.dart';
import 'package:sofiacare/patient/profile/appoint_screen.dart';
import 'package:sofiacare/patient/screens/colors.dart';

import '../profile/presentation.dart';

class Posts extends StatefulWidget {
  const Posts();

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List<bool> isLovedList = List.generate(2, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          bool isLoved = isLovedList[index];

          return Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Appoint()),
                    );
                  },
                  child: Row(
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
                  padding: EdgeInsets.only(top: 0.2, bottom: 0.2),
                  child: Transform.scale(
                    scale: 1.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isLovedList[index] = !isLoved;
                            });
                          },
                          child: Container(
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
                                    isLoved ? Icons.favorite : Icons.favorite_border,
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
                                  Icons.comment,
                                  color: Colors.green,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 90,
                                child: Text("Commenter"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
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
                    scale: 1.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Handle love reaction
                          },
                          child: Container(
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
                                  Icons.comment,
                                  color: Colors.green,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 90,
                                child: Text("Commenter"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
